import 'package:flutter/material.dart';

import '../../input_amount/route/input_amount_arguments.dart';
import '../controller/input_user_controller.dart';

class InputUserPage extends StatelessWidget {
  InputUserPage({Key? key}) : super(key: key);

  final controller = InputUserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(label: Text('Nome Completo')),
              validator: controller.validateFullName,
              onSaved: (fullname) {
                controller.fullName = fullname!;
              },
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              validator: controller.validateEmail,
              onSaved: (email) {
                controller.email = email!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.onSavedUser();
                Navigator.of(context).pushNamed('/inputValue',
                    arguments:
                        InputAmountArguments(user: controller.userModel));
              },
              child: const Text('Continuar'),
            )
          ],
        ),
      ),
    );
  }
}
