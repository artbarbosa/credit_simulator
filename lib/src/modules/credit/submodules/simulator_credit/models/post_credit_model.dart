import '../../../../../core/user/model/user_model.dart';

class PostCreditModel {
  final UserModel user;
  final int ltv;
  final double amount;
  final int term;
  final bool hasProtectedCollateral;

  PostCreditModel({
    required this.user,
    required this.ltv,
    required this.amount,
    required this.term,
    required this.hasProtectedCollateral,
  });
}
