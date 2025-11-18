class DeviceUnsupportedException implements Exception {
  final String message;

  DeviceUnsupportedException(this.message);

  @override
  String toString() {
    return message;
  }
}