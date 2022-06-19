import 'package:flutter/material.dart';

import '../input_options_arguments.dart';

class InputOptionsPage extends StatefulWidget {
  const InputOptionsPage({Key? key, required this.arguments}) : super(key: key);
  final InputOptionsArguments arguments;

  @override
  State<InputOptionsPage> createState() => _InputOptionsPageState();
}

class _InputOptionsPageState extends State<InputOptionsPage> {
  @override
  Widget build(BuildContext context) {
    double currentSliderValue = 20;

    return Scaffold(
      body: Column(children: [
        Slider(
          value: currentSliderValue,
          min: 20,
          max: 50,
          divisions: 2,
          onChanged: (value) {
            setState(() {
              currentSliderValue = value;
            });
          },
        ),
      ]),
    );
  }
}
