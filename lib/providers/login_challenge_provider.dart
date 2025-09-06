import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';

class LoginChallenge {
  final String challengeId;
  final int expiresAt;
  final int ttl;

  LoginChallenge({required this.challengeId, required this.expiresAt, required this.ttl});
}

class LoginChallengeNotifier extends StateNotifier<LoginChallenge?> {
  final SharedPreferences _prefs;
  Timer? _expiryTimer;

  LoginChallengeNotifier(this._prefs) : super(null) {
    _loadChallenge();
  }

  // Load the challenge from SharedPreferences
  void _loadChallenge() {
    final challengeId = _prefs.getString('challengeId');
    final expiresAt = _prefs.getInt('expiresAt');
    final ttl = _prefs.getInt('ttl');

    if (challengeId != null && expiresAt != null && ttl != null) {
      final challenge = LoginChallenge(
        challengeId: challengeId,
        expiresAt: expiresAt,
        ttl: ttl,
      );
      state = challenge;
      _startExpiryTimer(challenge.expiresAt);
    }
  }

  // Set a new challenge, save to SharedPreferences, and start the timer
  Future<void> setChallenge(LoginChallenge challenge) async {
    await _prefs.setString('challengeId', challenge.challengeId);
    await _prefs.setInt('expiresAt', challenge.expiresAt);
    await _prefs.setInt('ttl', challenge.ttl);
    state = challenge;
    _startExpiryTimer(challenge.expiresAt);
  }

  // Clear the challenge from state and SharedPreferences
  Future<void> clearChallenge() async {
    await _prefs.remove('challengeId');
    await _prefs.remove('expiresAt');
    await _prefs.remove('ttl');
    _expiryTimer?.cancel();
    state = null;
  }

  // Start the timer to automatically clear the challenge on expiry
  void _startExpiryTimer(int expiresAt) {
    _expiryTimer?.cancel();
    final now = DateTime.now().millisecondsSinceEpoch;
    final durationUntilExpiry = (expiresAt*1000) - now;

    if (durationUntilExpiry > 0) {
      _expiryTimer = Timer(Duration(milliseconds: durationUntilExpiry), () {
        clearChallenge();
      });
    } else {
      // Challenge has already expired, clear it immediately
      clearChallenge();
    }
  }

  @override
  void dispose() {
    _expiryTimer?.cancel();
    super.dispose();
  }
}

final loginChallengeProvider =
    StateNotifierProvider<LoginChallengeNotifier, LoginChallenge?>((ref) {
      final prefs = ref.watch(sharedPreferencesProvider);
      return LoginChallengeNotifier(prefs);
    });
