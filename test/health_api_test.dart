import 'package:test/test.dart';
import 'package:heartauth_mobile/heartauth_mobile.dart';

/// tests for HealthApi
void main() {
  final instance = HeartauthMobile().getHealthApi();

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
