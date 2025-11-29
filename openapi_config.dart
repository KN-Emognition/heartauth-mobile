import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  inputSpec: InputSpec(path: 'specs/mobile.yml'),
  generatorName: Generator.dio,
  outputDirectory: '.',
  forceAlwaysRun: true,
  skipIfSpecIsUnchanged: false,
  additionalProperties: DioProperties(
    pubName: 'heartauth_mobile',
    pubVersion: '0.1.0',
  ),
)
class MobileHeartauthApi {}
