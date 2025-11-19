import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';

class Stats {
  final int incomingChallenges;
  final int successfulLogins;
  final int pairedAccounts;

  const Stats({
    required this.incomingChallenges,
    required this.successfulLogins,
    required this.pairedAccounts,
  });

  Stats copyWith({
    int? incomingChallenges,
    int? successfulLogins,
    int? pairedAccounts,
  }) {
    return Stats(
      incomingChallenges: incomingChallenges ?? this.incomingChallenges,
      successfulLogins: successfulLogins ?? this.successfulLogins,
      pairedAccounts: pairedAccounts ?? this.pairedAccounts,
    );
  }
}

class StatsNotifier extends StateNotifier<Stats> {
  static const _kIncomingKey = 'stats_incoming';
  static const _kSuccessKey = 'stats_success';
  static const _kPairedKey = 'stats_paired';

  final SharedPreferences _prefs;

  StatsNotifier(this._prefs)
      : super(const Stats(incomingChallenges: 0, successfulLogins: 0, pairedAccounts: 0)) {
    _loadFromPrefs();
  }

  void _loadFromPrefs() {
    final incoming = _prefs.getInt(_kIncomingKey) ?? 0;
    final success = _prefs.getInt(_kSuccessKey) ?? 0;
    final paired = _prefs.getInt(_kPairedKey) ?? 0;
    state = Stats(
      incomingChallenges: incoming,
      successfulLogins: success,
      pairedAccounts: paired,
    );
  }

  Future<void> _saveToPrefs() async {
    await _prefs.setInt(_kIncomingKey, state.incomingChallenges);
    await _prefs.setInt(_kSuccessKey, state.successfulLogins);
    await _prefs.setInt(_kPairedKey, state.pairedAccounts);
  }

  Future<void> incrementIncoming() async {
    state = state.copyWith(incomingChallenges: state.incomingChallenges + 1);
    await _saveToPrefs();
  }

  Future<void> incrementSuccess() async {
    state = state.copyWith(successfulLogins: state.successfulLogins + 1);
    await _saveToPrefs();
  }

  Future<void> incrementPaired() async {
    state = state.copyWith(pairedAccounts: state.pairedAccounts + 1);
    await _saveToPrefs();
  }

  Future<void> setPaired(int value) async {
    state = state.copyWith(pairedAccounts: value);
    await _saveToPrefs();
  }

  Future<void> reset() async {
    state = const Stats(incomingChallenges: 0, successfulLogins: 0, pairedAccounts: 0);
    await _saveToPrefs();
  }
}

final statsProvider = StateNotifierProvider<StatsNotifier, Stats>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return StatsNotifier(prefs);
});
