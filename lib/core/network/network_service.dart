import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart';

const baseUrl = "http://localhost:5000/api/1/";

class NetworkService {
  Dio dioInstance;

  NetworkService({@required Dio dioInstance})
      : assert(dioInstance != null),
        this.dioInstance = dioInstance;

  Future<dynamic> get(String url,
      {String customUrl, bool useCustomUrl = false, queryParameters}) {
    return dioInstance.get(!useCustomUrl ? baseUrl + url : url,
        queryParameters: queryParameters);
  }

  Future<dynamic> post(String url,
      {bool useCustomUrl = false, data, queryParameters}) {
    return dioInstance.post(!useCustomUrl ? baseUrl + url : url,
        data: data, queryParameters: queryParameters);
  }
}

class DioClient {
  static BaseOptions baseOptions = BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 20000,
  );
  static final DioClient _dioClient = DioClient._internal();
  Dio _dio = new Dio(baseOptions);
  Dio get dioInstance => _dio;

  factory DioClient() {
    return _dioClient;
  }


  DioClient._internal() {
    _dio.transformer = FlutterTransformer(); // replace dio default transformer
  }
}
