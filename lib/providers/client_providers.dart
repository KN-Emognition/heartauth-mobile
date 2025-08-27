import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:openapi_client/openapi_client.dart';

final _dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  return dio;
});

final apiClientProvider = Provider<OpenapiClient>((ref) {
  final dio = ref.watch(_dioProvider);

  final apiUrl = dotenv.env['API_URL'] ?? r'https://orchestrator.example.com';
  return OpenapiClient(
    dio: dio,
    basePathOverride: apiUrl, // your API url
    serializers: standardSerializers,
  );
});

final healthApiProvider = Provider<HealthApi>((ref) {
  final client = ref.watch(apiClientProvider);
  return client.getHealthApi();
});

final pairingApiProvider = Provider<PairingApi>((ref) {
  final client = ref.watch(apiClientProvider);
  return client.getPairingApi();
});

final challengeApiProvider = Provider<ChallengeApi>((ref) {
  final client = ref.watch(apiClientProvider);
  return client.getChallengeApi();
});