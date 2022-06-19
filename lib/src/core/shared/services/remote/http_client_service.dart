import 'package:dio/dio.dart';

abstract class IHttpClientService {
  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
}
