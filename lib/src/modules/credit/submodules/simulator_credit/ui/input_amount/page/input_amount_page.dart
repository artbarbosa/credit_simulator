import 'package:flutter/material.dart';

import '../../input_options/input_options_arguments.dart';
import '../controller/input_amount_controller.dart';
import '../route/input_amount_arguments.dart';

class InputValuePage extends StatelessWidget {
  const InputValuePage({Key? key, required this.arguments}) : super(key: key);
  final InputAmountArguments arguments;
  @override
  Widget build(BuildContext context) {
    final controller = InputAmountController();

    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: false),
              validator: controller.validateAmount,
              onSaved: (amount) {
                if (amount != null) {
                  controller.value = double.tryParse(amount);
                }
              },
              inputFormatters: [],
              decoration: const InputDecoration(
                labelText: 'Valor',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.onSavedAmount();
                Navigator.of(context).pushNamed(
                  '/inputOptions',
                  arguments: InputOptionsArguments(
                    user: arguments.user,
                    amountCreditModel: controller.amountCreditModel,
                  ),
                );
              },
              child: const Text('Continuar'),
            )
          ],
        ),
      ),
    );
  }
}
