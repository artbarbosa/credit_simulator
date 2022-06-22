import 'package:flutter/material.dart';

import '../../../models/amount_credit_model.dart';

class InputAmountController {
  double? value = 0;
  late AmountCreditModel amountCreditModel;
  final formKey = GlobalKey<FormState>();

  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    var valueDouble = double.tryParse(value.replaceAll('.', ''));
    if (valueDouble! >= 500 && valueDouble <= 300000) {
      return null;
    }
    return '';
  }

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
