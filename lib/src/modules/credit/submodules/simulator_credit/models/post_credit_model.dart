import '../../../../../core/user/model/user_model.dart';

class PostCreditModel {
  final UserModel user;
  final List<int> ltv;
  final double amount;
  final List<int> term;
  final bool hasProtectedCollateral;

  PostCreditModel({
    required this.user,
    required this.ltv,
    required this.amount,
    required this.term,
    required this.hasProtectedCollateral,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.toMap()});
    result.addAll({'ltv': ltv});
    result.addAll({'amount': amount});
    result.addAll({'term': term});
    result.addAll({'hasProtectedCollateral': hasProtectedCollateral});

    return result;
  }

  factory PostCreditModel.fromMap(Map<String, dynamic> map) {
    return PostCreditModel(
      user: UserModel.fromMap(map['user']),
      ltv: List<int>.from(map['ltv']),
      amount: map['amount']?.toDouble() ?? 0.0,
      term: List<int>.from(map['term']),
      hasProtectedCollateral: map['hasProtectedCollateral'] ?? false,
    );
  }
}
