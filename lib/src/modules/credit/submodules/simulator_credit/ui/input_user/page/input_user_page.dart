import 'package:flutter/material.dart';

import '../../input_value/route/input_value_arguments.dart';
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
              decoration: const InputDecoration(label: Text('Nome Completo')),
              validator: controller.validateFullName,
            ),
            TextFormField(
              autofocus: true,
              validator: controller.validateEmail,
            ),
            ElevatedButton(
              onPressed: () {
                controller.onSavedUser();
                Navigator.of(context).pushNamed('/inputValue',
                    arguments: InputValueArguments(user: controller.userModel));
              },
              child: const Text('Continuar'),
            )
          ],
        ),
      ),
    );
  }
}
