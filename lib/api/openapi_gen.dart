// Openapi Generator last run: : 2025-08-27T19:57:18.751919
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  inputSpec: InputSpec(path: 'lib/api/external.yml'),
  generatorName: Generator.dio,
  outputDirectory: 'lib/api/generated',
  additionalProperties: DioProperties(
    pubName: 'openapi_client',
    pubVersion: '0.1.0',
  ),
)
class MyOpenApi {}

/*
Add-Content lib/api/openapi.yml "`n# regen $(Get-Date -Format o)"
dart run build_runner clean
Remove-Item .dart_tool\openapi-generator-cache.json -Force -ErrorAction SilentlyContinue
dart run build_runner build --delete-conflicting-outputs
 */