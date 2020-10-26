import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  String message;
  int code;
  ServerException({this.message, @required this.code});
}

class CacheException implements Exception {}

class NetworkException implements Exception {}
