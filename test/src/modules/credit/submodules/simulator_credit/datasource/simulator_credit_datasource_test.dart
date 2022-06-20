import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/core/shared/consts/api_consts.dart';
import 'package:rispar_credit_simulator/src/core/shared/failures/failures.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/datasource/simulator_credit_datasource.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/failures/simulator_credit_failures.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late SimulatorCreditDatasource datasource;
  late HttpClientServiceMock httpClient;

  setUpAll(() {
    httpClient = HttpClientServiceMock();
    datasource = SimulatorCreditDatasource(httpClient: httpClient);
  });

  group('SimulatorCreditDatasource - postSimulatorCredit', () {
    test('Should return Map', () async {
      when(() => httpClient.post(
            ApiConst.apiURL(),
            data: ApiConst.creditSimulatorPostData(
              fullname: postCreditModelMock.user.fullName,
              email: postCreditModelMock.user.email,
              ltv: postCreditModelMock.ltv,
              amount: postCreditModelMock.amount,
              term: postCreditModelMock.term,
              hasProtectedCollateral:
                  postCreditModelMock.hasProtectedCollateral,
            ),
          )).thenAnswer((_) async => responseMock);

      final result = await datasource.postSimulatorCredit(
          postCreditModel: postCreditModelMock);

      expect(result['term'], 12);
    });

    test('Should throw SimulatorCreditDatasourceInternetConnection ', () async {
      when(() => httpClient.post(ApiConst.apiURL(),
          data: ApiConst.creditSimulatorPostData(
            fullname: postCreditModelMock.user.fullName,
            email: postCreditModelMock.user.email,
            ltv: postCreditModelMock.ltv,
            amount: postCreditModelMock.amount,
            term: postCreditModelMock.term,
            hasProtectedCollateral: postCreditModelMock.hasProtectedCollateral,
          ))).thenThrow(NoInternetConnection());

      expect(
          () async => await datasource.postSimulatorCredit(
              postCreditModel: postCreditModelMock),
          throwsA(isA<SimulatorCreditDatasourceInternetConnection>()));
    });
    test('Should throw SimulatorCreditDatasourceError', () async {
      when(() => httpClient.post(ApiConst.apiURL(),
          data: ApiConst.creditSimulatorPostData(
            fullname: postCreditModelMock.user.fullName,
            email: postCreditModelMock.user.email,
            ltv: postCreditModelMock.ltv,
            amount: postCreditModelMock.amount,
            term: postCreditModelMock.term,
            hasProtectedCollateral: postCreditModelMock.hasProtectedCollateral,
          ))).thenThrow(DioServiceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(
          () async => await datasource.postSimulatorCredit(
              postCreditModel: postCreditModelMock),
          throwsA(isA<SimulatorCreditDatasourceError>()));
    });
  });
}
