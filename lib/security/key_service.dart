import 'dart:convert';
import 'dart:developer' as dev show log;

import 'package:cryptography/cryptography.dart';
import 'package:cryptography_flutter/cryptography_flutter.dart' show FlutterCryptography;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyService {
  static const _tag = 'KeyService';
  static const _privKeyKey = 'ed25519_private_key_b64';
  static const _pubKeyKey  = 'ed25519_public_key_b64';

  final FlutterSecureStorage _storage;
  final Ed25519 _algo = Ed25519();

  KeyService._(this._storage);
  factory KeyService() {
    const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true, // wraps with Android Keystore
        resetOnError: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock, // after first device unlock
      ),
      mOptions: MacOsOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );

    // Enable native/accelerated crypto once (idempotent).
    FlutterCryptography.enable();
    dev.log('FlutterCryptography enabled', name: _tag);

    return KeyService._(storage);
  }
  Future<SimpleKeyPair> getOrCreate() async {
    try {
      final privB64 = await _storage.read(key: _privKeyKey);
      final pubB64  = await _storage.read(key: _pubKeyKey);

      if (privB64 != null && pubB64 != null) {
        final pubBytes  = base64Decode(pubB64);
        final fp = await _pubFingerprint(pubBytes);
        dev.log('Loaded keypair from secure storage (pub fp: $fp, pubLen=${pubBytes.length})', name: _tag);

        final privBytes = base64Decode(privB64);
        return SimpleKeyPairData(
          privBytes,
          publicKey: SimplePublicKey(pubBytes, type: KeyPairType.ed25519),
          type: KeyPairType.ed25519,
        );
      }

      dev.log('No stored keypair found. Generating new Ed25519 keypair…', name: _tag);
      final keyPair = await _algo.newKeyPair();
      final data = await keyPair.extract(); // contains both private & public keys
      final privBytes = await data.extractPrivateKeyBytes();
      final pubBytes  = data.publicKey.bytes;
      final fp        = await _pubFingerprint(pubBytes);

      await _storage.write(key: _privKeyKey, value: base64Encode(privBytes));
      await _storage.write(key: _pubKeyKey,  value: base64Encode(pubBytes));

      dev.log('Generated + stored keypair (pub fp: $fp, pubLen=${pubBytes.length})', name: _tag);

      return SimpleKeyPairData(
        privBytes,
        publicKey: SimplePublicKey(pubBytes, type: KeyPairType.ed25519),
        type: KeyPairType.ed25519,
      );
    } catch (e, st) {
      dev.log('getOrCreate failed: $e', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<String> getPublicKeyBase64() async {
    try {
      final pub = await _storage.read(key: _pubKeyKey);
      if (pub != null) {
        final fp = await _pubFingerprint(base64Decode(pub));
        dev.log('Returning stored public key (fp: $fp)', name: _tag);
        return pub;
      }
      dev.log('Public key missing — creating keypair first…', name: _tag);
      final kp = await getOrCreate();
      final pk = await kp.extractPublicKey();
      final pubB64 = base64Encode(pk.bytes);
      final fp = await _pubFingerprint(pk.bytes);
      dev.log('Returning freshly created public key (fp: $fp)', name: _tag);
      return pubB64;
    } catch (e, st) {
      dev.log('getPublicKeyBase64 failed: $e', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> reset() async {
    try {
      await _storage.delete(key: _privKeyKey);
      await _storage.delete(key: _pubKeyKey);
      dev.log('Deleted stored keypair', name: _tag);
    } catch (e, st) {
      dev.log('reset failed: $e', name: _tag, error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<String> _pubFingerprint(List<int> pubKeyBytes) async {
    final h = await Sha256().hash(pubKeyBytes);
    final b64 = base64Encode(h.bytes);
    // Trim for readability; still unique enough for logs.
    return b64.substring(0, 16);
  }
}
