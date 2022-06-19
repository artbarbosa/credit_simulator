import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/models/amount_credit_model.dart';

import '../../../../../../core/user/model/user_model.dart';

class InputOptionsArguments {
  InputOptionsArguments({required this.amount, required this.user});
  final UserModel user;
  final AmountCreditModel amount;
}
