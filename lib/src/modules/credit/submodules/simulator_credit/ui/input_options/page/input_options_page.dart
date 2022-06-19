import 'package:flutter/material.dart';

import '../input_options_arguments.dart';
import 'controller/input_options_controller.dart';
import 'widgets/custom_slide.dart';

class InputOptionsPage extends StatefulWidget {
  const InputOptionsPage({Key? key, required this.arguments}) : super(key: key);
  final InputOptionsArguments arguments;

  @override
  State<InputOptionsPage> createState() => _InputOptionsPageState();
}

class _InputOptionsPageState extends State<InputOptionsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = InputOptionsController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Valor Escolhido'),
          Text('\$ ${widget.arguments.amountCreditModel.amount}'),
          CustomSlide(
            minValue: 3,
            maxValue: 12,
            divisions: 3,
            labelBottom: const ['3', '6', '9', '12'],
            currentSliderValue: 12,
            onChanged: (value) {
              controller.onChangeTerm(value);
            },
          ),
          CustomSlide(
            minValue: 20,
            maxValue: 50,
            divisions: 2,
            labelBottom: const ['20', '35', '50'],
            currentSliderValue: 20,
            onChanged: (value) {
              controller.onChangeLtv(value);
            },
          ),
        ],
      ),
    );
  }
}
