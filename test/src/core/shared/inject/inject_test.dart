import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:rispar_credit_simulator/src/core/shared/inject/inject.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/dio_http_client_service.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/http_client_service.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });
  test('Should return Instance DioHttpServiceImp', () async {
    final result = GetIt.I<IHttpClientService>();

    expect(result, isA<IHttpClientService>());
    expect(result, isA<DioHttpServiceImp>());
  });
}
