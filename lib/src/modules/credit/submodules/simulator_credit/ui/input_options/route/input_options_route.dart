import 'package:flutter/material.dart';

import '../page/input_options_page.dart';
import 'input_options_arguments.dart';

class InputOptionsRoute extends StatelessWidget {
  const InputOptionsRoute({Key? key, required this.arguments})
      : super(key: key);
  final InputOptionsArguments arguments;
  @override
  Widget build(BuildContext context) {
    return InputOptionsPage(arguments: arguments);
  }
}
