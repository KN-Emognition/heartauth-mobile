import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair() {
  final ecDomain = ECDomainParameters('prime256v1'); // P-256 curve
  final keyGen = ECKeyGenerator()
    ..init(ParametersWithRandom(
      ECKeyGeneratorParameters(ecDomain),
      SecureRandom('Fortuna')
        ..seed(KeyParameter(
          Uint8List.fromList(List.generate(32, (i) => i * 37 % 256)),
        )),
    ));
  return keyGen.generateKeyPair();
}

String publicKeyToPem(ECPublicKey publicKey) {
  return CryptoUtils.encodeEcPublicKeyToPem(publicKey);
}

String privateKeyToPem(ECPrivateKey privateKey) {
  return CryptoUtils.encodeEcPrivateKeyToPem(privateKey);
}

Future<ECPrivateKey?> loadPrivateKey() async {
  final pem = await FlutterSecureStorage().read(key: "privateKeyPem");
  if (pem == null) return null;
  return CryptoUtils.ecPrivateKeyFromPem(pem);
}

Future<String?> signNonce(String nonce) async {
  final privateKey = await loadPrivateKey();
  if (privateKey == null) {
    throw Exception("No private key stored");
  }

  // Convert nonce to bytes
  final messageBytes = utf8.encode(nonce);

  // Initialize signer
  final signer = Signer('SHA-256/DET-ECDSA');
  signer.init(
    true,
    PrivateKeyParameter<ECPrivateKey>(privateKey),
  );

  // Sign
  final ECSignature sig = signer.generateSignature(Uint8List.fromList(messageBytes)) as ECSignature;

  // ES256 requires r and s concatenated as fixed 32-byte big-endian integers
  final rBytes = _bigIntToFixedLengthBytes(sig.r, 32);
  final sBytes = _bigIntToFixedLengthBytes(sig.s, 32);

  final rawSignature = Uint8List.fromList([...rBytes, ...sBytes]);

  // Return base64url-encoded signature (standard for ES256/JWT)
  return base64UrlEncode(rawSignature).replaceAll('=', '');
}

Uint8List _bigIntToFixedLengthBytes(BigInt number, int length) {
  final bytes = number.toUnsigned(8 * length).toRadixString(16).padLeft(length * 2, '0');
  return Uint8List.fromList(List<int>.generate(
    length,
        (i) => int.parse(bytes.substring(i * 2, i * 2 + 2), radix: 16),
  ));
}

