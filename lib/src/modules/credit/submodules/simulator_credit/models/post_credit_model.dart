import 'dart:convert';

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
      ltv: map['ltv']?.toInt() ?? 0,
      amount: map['amount']?.toDouble() ?? 0.0,
      term: map['term']?.toInt() ?? 0,
      hasProtectedCollateral: map['hasProtectedCollateral'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCreditModel.fromJson(String source) =>
      PostCreditModel.fromMap(json.decode(source));
}
