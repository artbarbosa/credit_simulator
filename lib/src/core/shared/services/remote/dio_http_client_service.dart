import 'package:dio/dio.dart';

import '../../failures/failures.dart';
import 'http_client_service.dart';

class DioHttpServiceImp implements IHttpClientService {
  final Dio _dio;

  DioHttpServiceImp(this._dio);

  @override
  Future<Response<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic data}) {
    try {
      return _dio.post<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw NoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw NoInternetConnection();
      } else {
        throw DioServiceError(
          stackTrace: stackTrace,
          label: 'DioHttpServiceImp-get',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }
}
