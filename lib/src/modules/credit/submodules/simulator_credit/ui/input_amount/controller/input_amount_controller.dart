import 'package:flutter/material.dart';

import '../../../models/amount_credit_model.dart';

class InputAmountController {
  double? value = 0;
  late AmountCreditModel amountCreditModel;
  final formKey = GlobalKey<FormState>();

  String? validateAmount(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  setValue(String amount) {
    value = double.tryParse(amount.replaceAll('.', ''));
  }

  void onSavedAmount() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      amountCreditModel = AmountCreditModel(amount: value!);
    }
  }
}
