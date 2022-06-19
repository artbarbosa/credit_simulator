import '../../../../../core/shared/consts/api_consts.dart';
import '../../../../../core/shared/services/remote/http_client_service.dart';
import '../models/post_credit_model.dart';

abstract class ISimulatorCreditDatasource {
  Future<Map<String, dynamic>> postSimulatorCredit(
      {required PostCreditModel postCreditModel});
}

class SimulatorCreditDatasource implements ISimulatorCreditDatasource {
  final IHttpClientService httpClient;

  SimulatorCreditDatasource({
    required this.httpClient,
  });

  @override
  Future<Map<String, dynamic>> postSimulatorCredit({
    required PostCreditModel postCreditModel,
  }) async {
    final response = await httpClient.post(
      ApiConst.apiURL(),
      data: ApiConst.creditSimulatorPostData(
        name: postCreditModel.user.fullName,
        email: postCreditModel.user.email,
        ltv: postCreditModel.ltv,
        amount: postCreditModel.amount,
        term: postCreditModel.term,
        hasProtectedCollateral: postCreditModel.hasProtectedCollateral,
      ),
    );
    return response.data as Map<String, dynamic>;
  }
}
