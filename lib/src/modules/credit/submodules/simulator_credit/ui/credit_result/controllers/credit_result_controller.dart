import 'package:flutter/material.dart';

import '../../../../../../../core/shared/failures/failures.dart';
import '../../../../../models/credit_model.dart';
import '../../../models/post_credit_model.dart';
import '../../../repository/simulator_credit_repository.dart';
import '../states/credit_result_states.dart';

class CreditResultController extends ValueNotifier<CreditResultPageState> {
  final ISimulatorCreditRepository _repository;

  CreditResultController(this._repository) : super(CreditResultLoadingState());

  late CreditModel _creditModel;

  Future<void> fetchCreditSimulator(PostCreditModel postCreditModel) async {
    value = CreditResultLoadingState();
    try {
      _creditModel = await _repository.postSimulatorCredit(
          postCreditModel: postCreditModel);
      value = CreditResultLoadedState(creditModel: _creditModel);
    } on NoInternetConnection catch (e) {
      value = CreditResultErrorState(errorMessage: e.toString());
    } on Failure catch (e) {
      value = CreditResultErrorState(errorMessage: e.toString());
    } catch (e) {
      value = CreditResultErrorState(errorMessage: e.toString());
    }
  }
}
