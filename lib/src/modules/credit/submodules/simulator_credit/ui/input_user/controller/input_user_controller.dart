import 'package:flutter/material.dart';

import '../../../../../../../core/user/model/user_model.dart';

class InputUserController {
  String fullName = '';
  String email = '';
  late UserModel userModel;
  final formKey = GlobalKey<FormState>();

  String? validateFullName(String? value) =>
      !RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)")
              .hasMatch(value ?? '')
          ? 'Digite um email válido!'
          : null;

  String? validateEmail(String? value) =>
      !RegExp(r'[a-zA-Z0-9.-_]+@[a-zA-Z0-9-_]+\..+').hasMatch(value ?? '')
          ? 'Digite um email válido!'
          : null;

  void onSavedUser() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      userModel = UserModel(fullName: fullName, email: email);
    }
  }
}
