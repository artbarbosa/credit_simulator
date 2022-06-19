import 'package:flutter/material.dart';

import '../../inputOptions/input_options_arguments.dart';
import '../controller/input_value_controller.dart';
import '../route/input_value_arguments.dart';
import '../utils/currency_value_mask.dart';

class InputValuePage extends StatelessWidget {
  const InputValuePage({Key? key, required this.arguments}) : super(key: key);
  final InputValueArguments arguments;
  @override
  Widget build(BuildContext context) {
    final controller = InputValueController();

    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            validator: (text) {
              if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$')
                  .hasMatch(text ?? '')) {
                return 'Digite um valor válido!';
              }
              return null;
            },
            inputFormatters: [
              CurrencyValueMask(symbol: r'$', decimal: ',', cents: '.'),
            ],
            decoration: const InputDecoration(
              labelText: 'Valor',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.onSavedValue();
              Navigator.of(context).pushNamed('/inputOptions',
                  arguments: InputOptionsArguments(
                      user: arguments.user, value: controller.value));
            },
            child: const Text('Continuar'),
          )
        ],
      ),
    );
  }
}
