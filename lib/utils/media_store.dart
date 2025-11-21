import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class MediaStore {
  static const _channel = MethodChannel('flutter_media_store');

  Future<void> addItem({required File file, required String name}) async {
    await _channel.invokeMethod('addItem', {'path': file.path, 'name': name});
  }
}

Future<File> saveJsonToTemporaryFile(String body, String filename) async {
  final directory = await getTemporaryDirectory();
  final filePath = path.join(directory.path, filename);
  return await File(filePath).writeAsString(body);
}