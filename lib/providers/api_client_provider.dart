import 'package:dio/dio.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hauth_mobile/providers/server_health_provider.dart';
import 'package:hauth_mobile/providers/shared_preferences_provider.dart';

class ApiWrapper {
  final HauthApiExternal _api;
  final Ref ref;

  ApiWrapper(this._api, this.ref);

  Future<T> run<T>(Future<T> Function(HauthApiExternal api) call, [bool suppressError = false]) async {
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

final apiUrlProvider = Provider<String>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return prefs.getString('API_URL') ?? dotenv.env['API_URL'] ??
      r'https://orchestrator.example.com';
});

final apiClientProvider = Provider<ApiWrapper>((ref) {
  final apiUrl = ref.watch(apiUrlProvider);
  final apiClient = HauthApiExternal(
    dio: Dio(BaseOptions(receiveTimeout: Duration(seconds: 20), baseUrl: apiUrl)),
    basePathOverride: apiUrl,
    serializers: standardSerializers,
  );

  return ApiWrapper(apiClient, ref);
});
