import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/core/shared/failures/failures.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/dio_http_client_service.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

void main() {
  late DioHttpServiceImp httpClient;
  late DioMock dio;
  setUpAll(() {
    dio = DioMock();
    httpClient = DioHttpServiceImp(dio);
  });

  group('DioHttpServiceImp - post', () {
    test('Should return Response', () async {
      when(() => dio.post(any())).thenAnswer((_) async => ResponseMock());

      final result = await httpClient.post('');

      expect(result, isA<Response>());
    });

    test('Should throw NoInternetConnection - DioErroType connectTimeout',
        () async {
      when(() => dio.post(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.connectTimeout));

      expect(() async => await httpClient.post(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.post(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.receiveTimeout));

      expect(() async => await httpClient.post(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.post(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.other,
      ));

      expect(() async => await httpClient.post(''),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should throw DioServiceError - DioErroType receiveTimeout', () async {
      when(() => dio.post(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.cancel,
      ));

      expect(() async => await httpClient.post(''),
          throwsA(isA<DioServiceError>()));
    });
  });
}
