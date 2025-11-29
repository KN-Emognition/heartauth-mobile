// Openapi Generator last run: : 2025-11-29T11:10:53.294297
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