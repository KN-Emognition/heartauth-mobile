import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

/// tests for HealthApi
void main() {
  final instance = OpenapiClient().getHealthApi();

  group(HealthApi, () {
    // Get overall application health
    //
    // Returns the aggregated health status of the application.
    //
    //Future getHealth() async
    test('test getHealth', () async {
      // TODO
    });
  });
}
