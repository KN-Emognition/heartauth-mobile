import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final devModeProvider = Provider<bool>((ref) {
  final devModeString = dotenv.env['DEV_MODE'] ?? 'false';
  return devModeString.toLowerCase() == 'true';
});