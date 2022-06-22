import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:rispar_credit_simulator/src/core/shared/inject/inject.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/dio_http_client_service.dart';
import 'package:rispar_credit_simulator/src/core/shared/services/remote/http_client_service.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/datasource/simulator_credit_datasource.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/repository/simulator_credit_repository.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/credit_result/controllers/credit_result_controller.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_amount/controller/input_amount_controller.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_options/page/controller/input_options_controller.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_user/controller/input_user_controller.dart';

void main() {
  setUpAll(() async {
    await Inject.initialize();
  });
  test('Should return Instance DioHttpServiceImp', () async {
    final result = GetIt.I<IHttpClientService>();

    expect(result, isA<IHttpClientService>());
    expect(result, isA<DioHttpServiceImp>());
  });

  test('Should return Instance SimulatorCreditDatasource', () async {
    final result = GetIt.I<ISimulatorCreditDatasource>();

    expect(result, isA<ISimulatorCreditDatasource>());
    expect(result, isA<SimulatorCreditDatasource>());
  });

  test('Should return Instance SimulatorCreditRepository', () async {
    final result = GetIt.I<ISimulatorCreditRepository>();

    expect(result, isA<ISimulatorCreditRepository>());
    expect(result, isA<SimulatorCreditRepository>());
  });
  test('Should return Instance CreditResultController', () async {
    final result = GetIt.I<CreditResultController>();

    expect(result, isA<CreditResultController>());
  });
  test('Should return Instance InputAmountController', () async {
    final result = GetIt.I<InputAmountController>();

    expect(result, isA<InputAmountController>());
  });
  test('Should return Instance InputOptionsController', () async {
    final result = GetIt.I<InputOptionsController>();

    expect(result, isA<InputOptionsController>());
  });

  test('Should return Instance InputUserController', () async {
    final result = GetIt.I<InputUserController>();

    expect(result, isA<InputUserController>());
  });
}
