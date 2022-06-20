import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/core/shared/consts/api_consts.dart';
import 'package:rispar_credit_simulator/src/core/shared/failures/failures.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/http_client_service.dart';
import 'package:rispar_credit_simulator/src/core/user/model/user_model.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/datasource/simulator_credit_datasource.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/failures/simulator_credit_failures.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/models/post_credit_model.dart';

import '../../../../../../mocks/mock.dart';

class HttpClientServiceMock extends Mock implements IHttpClientService {}

void main() {
  late SimulatorCreditDatasource datasource;
  late HttpClientServiceMock httpClient;

  final userModel = UserModel(fullName: 'Test', email: 'test');

  Response response =
      Response(data: creditMapMock, requestOptions: RequestOptions(path: ''));

  final postCreditModel = PostCreditModel(
      user: userModel,
      ltv: 35,
      amount: 2000.0,
      term: 12,
      hasProtectedCollateral: true);

  setUpAll(() {
    httpClient = HttpClientServiceMock();
    datasource = SimulatorCreditDatasource(httpClient: httpClient);
  });

  group('SimulatorCreditDatasource - postSimulatorCredit', () {
    test('Should return Map', () async {
      when(() => httpClient.post(
            ApiConst.apiURL(),
            data: ApiConst.creditSimulatorPostData(
              fullname: postCreditModel.user.fullName,
              email: postCreditModel.user.email,
              ltv: postCreditModel.ltv,
              amount: postCreditModel.amount,
              term: postCreditModel.term,
              hasProtectedCollateral: postCreditModel.hasProtectedCollateral,
            ),
          )).thenAnswer((_) async => response);

      final result = await datasource.postSimulatorCredit(
          postCreditModel: postCreditModel);

      expect(result['term'], 12);
    });

    test('Should throw SimulatorCreditDatasourceInternetConnection ', () async {
      when(() => httpClient.post(ApiConst.apiURL(),
          data: ApiConst.creditSimulatorPostData(
            fullname: postCreditModel.user.fullName,
            email: postCreditModel.user.email,
            ltv: postCreditModel.ltv,
            amount: postCreditModel.amount,
            term: postCreditModel.term,
            hasProtectedCollateral: postCreditModel.hasProtectedCollateral,
          ))).thenThrow(NoInternetConnection());

      expect(
          () async => await datasource.postSimulatorCredit(
              postCreditModel: postCreditModel),
          throwsA(isA<SimulatorCreditDatasourceInternetConnection>()));
    });
    test('Should throw SimulatorCreditDatasourceError', () async {
      when(() => httpClient.post(ApiConst.apiURL(),
          data: ApiConst.creditSimulatorPostData(
            fullname: postCreditModel.user.fullName,
            email: postCreditModel.user.email,
            ltv: postCreditModel.ltv,
            amount: postCreditModel.amount,
            term: postCreditModel.term,
            hasProtectedCollateral: postCreditModel.hasProtectedCollateral,
          ))).thenThrow(DioServiceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(
          () async => await datasource.postSimulatorCredit(
              postCreditModel: postCreditModel),
          throwsA(isA<SimulatorCreditDatasourceError>()));
    });
  });
}
