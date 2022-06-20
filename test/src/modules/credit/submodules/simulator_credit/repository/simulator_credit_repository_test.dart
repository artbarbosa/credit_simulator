import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/modules/credit/models/credit_model.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/datasource/simulator_credit_datasource.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/failures/simulator_credit_failures.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/repository/simulator_credit_repository.dart';

import '../../../../../../mocks/mock.dart';

class ISimulatorCreditDatasourceMock extends Mock
    implements ISimulatorCreditDatasource {}

void main() {
  late SimulatorCreditRepository repository;
  late ISimulatorCreditDatasourceMock httpClient;

  setUpAll(() {
    httpClient = ISimulatorCreditDatasourceMock();
    repository = SimulatorCreditRepository(datasource: httpClient);
  });

  group('SimulatorCreditDatasource - postSimulatorCredit', () {
    test('Should return Map', () async {
      when(() => httpClient.postSimulatorCredit(
              postCreditModel: postCreditModelMock))
          .thenAnswer((_) async => creditMapMock);

      final result = await repository.postSimulatorCredit(
          postCreditModel: postCreditModelMock);

      expect(result, isA<CreditModel>());
      expect(result.term, 12);
    });

    test('Should throw SimulatorCreditRepositoryInternetConnection ', () async {
      when(() => httpClient.postSimulatorCredit(
              postCreditModel: postCreditModelMock))
          .thenThrow(SimulatorCreditDatasourceInternetConnection());

      expect(
          () async => await repository.postSimulatorCredit(
              postCreditModel: postCreditModelMock),
          throwsA(isA<SimulatorCreditRepositoryInternetConnection>()));
    });
    test('Should throw SimulatorCreditRepositoryError', () async {
      when(() => httpClient.postSimulatorCredit(
              postCreditModel: postCreditModelMock))
          .thenThrow(SimulatorCreditDatasourceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(
          () async => await repository.postSimulatorCredit(
              postCreditModel: postCreditModelMock),
          throwsA(isA<SimulatorCreditRepositoryError>()));
    });
  });
}
