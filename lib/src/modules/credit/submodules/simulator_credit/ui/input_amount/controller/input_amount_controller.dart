import 'package:flutter/material.dart';

import '../../../models/amount_credit_model.dart';

class InputAmountController {
  double value = 0;
  late AmountCreditModel amountCreditModel;
  final formKey = GlobalKey<FormState>();

  String? validateValue(double? value) =>
      value?.isNaN ?? true ? "O nome não pode ser vazio" : null;

  void onSavedValue() {
    final form = formKey.currentState;
    if (form!.validate()) {
      amountCreditModel = AmountCreditModel(amount: value);
    }
  }
}
