import '../../../models/credit_model.dart';
import '../datasource/simulator_credit_datasource.dart';
import '../models/post_credit_model.dart';

abstract class ISimulatorCreditRepository {
  Future<CreditModel> postSimulatorCredit(PostCreditModel postCreditModel);
}

class SimulatorCreditRepository implements ISimulatorCreditRepository {
  final ISimulatorCreditDatasource datasource;

  SimulatorCreditRepository({
    required this.datasource,
  });

  @override
  Future<CreditModel> postSimulatorCredit(
      PostCreditModel postCreditModel) async {
    final map =
        await datasource.postSimulatorCredit(postCreditModel: postCreditModel);

    return CreditModel.fromMap(map);
  }
}
