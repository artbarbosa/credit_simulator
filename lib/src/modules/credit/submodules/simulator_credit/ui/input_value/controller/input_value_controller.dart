import 'package:flutter/material.dart';

import '../../../models/value_credit_model.dart';

class InputValueController {
  double value = 0;
  late ValueCreditModel valueCreditModel;
  final formKey = GlobalKey<FormState>();

  String? validateValue(double? value) =>
      value?.isNaN ?? true ? "O nome não pode ser vazio" : null;

  void onSavedValue() {
    final form = formKey.currentState;
    if (form!.validate()) {
      valueCreditModel = ValueCreditModel(value: value);
    }
  }
}
