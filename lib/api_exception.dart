class ApiException implements Exception {
  final String _message;

  String get message => _message;

  ApiException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}