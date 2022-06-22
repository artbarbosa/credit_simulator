import 'package:flutter/material.dart';

import '../../../../../../../core/user/model/user_model.dart';

class InputUserController {
  String _fullName = '';
  String _email = '';
  late UserModel userModel;
  final formKey = GlobalKey<FormState>();

  String get fullName => _fullName;
  String get email => _email;

  void setFullName(String fullName) {
    _fullName = fullName;
  }

  void setEmail(String email) {
    _email = email;
  }

  String? validateFullName(String? value) =>
      !RegExp(r"^([a-zA-Z])").hasMatch(value ?? '')
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
      userModel = UserModel(fullName: _fullName, email: _email);
    }
  }
}
