import 'package:openapi_client/openapi_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hauth_mobile/providers/server_health_provider.dart';

class ApiWrapper {
  final OpenapiClient _api;
  final Ref ref;

  ApiWrapper(this._api, this.ref);

  Future<T> run<T>(Future<T> Function(OpenapiClient api) call, [bool suppressError = false]) async {
    try {
      final result = await call(_api);
      return result;
    } catch (e) {
      // Network or server error
      if(!suppressError){
        ref.read(serverHealthProvider.notifier).state =
            ServerHealthStatus.unhealthy;
      }
      rethrow;
    }
  }
}

final apiClientProvider = Provider<ApiWrapper>((ref) {
  final apiClient = OpenapiClient(
    basePathOverride:
        dotenv.env['API_URL'] ??
        r'https://orchestrator.example.com', // your API url
    serializers: standardSerializers,
  );

  return ApiWrapper(apiClient, ref);
});
