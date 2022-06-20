import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../modules/credit/submodules/simulator_credit/datasource/simulator_credit_datasource.dart';
import '../../../modules/credit/submodules/simulator_credit/repository/simulator_credit_repository.dart';
import '../../../modules/credit/submodules/simulator_credit/ui/credit_result/controllers/credit_result_controller.dart';
import '../services/remote/dio_http_client_service.dart';
import '../services/remote/http_client_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.I;

    getIt.registerLazySingleton<IHttpClientService>(
        () => DioHttpServiceImp(Dio()));

    getIt.registerLazySingleton<ISimulatorCreditDatasource>(
        () => SimulatorCreditDatasource(httpClient: getIt()));

    getIt.registerLazySingleton<ISimulatorCreditRepository>(
        () => SimulatorCreditRepository(datasource: getIt()));

    getIt.registerLazySingleton<CreditResultController>(
        () => CreditResultController(getIt()));
  }
}
