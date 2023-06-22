class DataException implements Exception {
  final _message;
  final _data;
  DataException([this._message, this._data]);
  String toString() {
    return "$_message: $_data";
  }
}

class EnvalidurlException extends DataException {
  EnvalidurlException([String? message]) : super(message, "Invalid uri");
}

class InternetException extends DataException {
  InternetException([String? msg]) : super(msg, "no internet");
}
