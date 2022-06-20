import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/repository/simulator_credit_repository.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/credit_result/controllers/credit_result_controller.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/credit_result/states/credit_result_states.dart';

import '../../../../../../../../mocks/mock.dart';

class SimulatorCreditRepositoryMock extends Mock
    implements ISimulatorCreditRepository {}

class ExceptionMock extends Mock implements Exception {}

void main() {
  late CreditResultController controller;
  late SimulatorCreditRepositoryMock repository;

  setUpAll(() {
    repository = SimulatorCreditRepositoryMock();
    controller = CreditResultController(repository);
  });

  group('CreditResultController - fetchCreditSimulator', () {
    test('Should get and change value CreditResultLoadedState', () async {
      when(() => repository.postSimulatorCredit(
              postCreditModel: postCreditModelMock))
          .thenAnswer((_) async => creditModelMock);

      await controller.fetchCreditSimulator(postCreditModelMock);

      expect(controller.value, isA<CreditResultLoadedState>());
    });

    test('Should get and change value CreditResultErrorState', () async {
      when(() => repository.postSimulatorCredit(
          postCreditModel: postCreditModelMock)).thenThrow(ExceptionMock());

      await controller.fetchCreditSimulator(postCreditModelMock);

      expect(controller.value, isA<CreditResultErrorState>());
    });
  });
}
