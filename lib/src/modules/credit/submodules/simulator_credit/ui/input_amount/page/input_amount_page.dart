import 'package:flutter/material.dart';

import '../../input_options/input_options_arguments.dart';
import '../controller/input_amount_controller.dart';
import '../route/input_amount_arguments.dart';
import '../utils/currency_value_mask.dart';

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
              validator: controller.validateAmount,
              inputFormatters: [
                CurrencyValueMask(symbol: r'$', decimal: ',', cents: '.'),
              ],
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
                      amountCreditModel: controller.amountCreditModel),
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
