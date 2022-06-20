import '../../../models/credit_model.dart';
import '../datasource/simulator_credit_datasource.dart';
import '../failures/simulator_credit_failures.dart';
import '../models/post_credit_model.dart';

abstract class ISimulatorCreditRepository {
  Future<CreditModel> postSimulatorCredit(
      {required PostCreditModel postCreditModel});
}

class SimulatorCreditRepository implements ISimulatorCreditRepository {
  final ISimulatorCreditDatasource datasource;

  SimulatorCreditRepository({
    required this.datasource,
  });

  @override
  Future<CreditModel> postSimulatorCredit(
      {required PostCreditModel postCreditModel}) async {
    try {
      final map = await datasource.postSimulatorCredit(
          postCreditModel: postCreditModel);
      return CreditModel.fromMap(map);
    } on SimulatorCreditDatasourceInternetConnection catch (e) {
      throw SimulatorCreditRepositoryInternetConnection();
    } on SimulatorCreditDatasourceError catch (e, stackTrace) {
      throw SimulatorCreditRepositoryError(
        stackTrace: stackTrace,
        label: 'SimulatorCreditRepository-postSimulatorCredit',
        exception: e,
        errorMessage: e.toString(),
      );
    }
  }
}
