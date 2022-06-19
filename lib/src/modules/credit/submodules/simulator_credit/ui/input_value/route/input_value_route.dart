import 'package:flutter/material.dart';

import '../page/input_value_page.dart';
import 'input_value_arguments.dart';

class InputValueRoute extends StatelessWidget {
  const InputValueRoute({Key? key, required this.arguments}) : super(key: key);
  final InputValueArguments arguments;
  @override
  Widget build(BuildContext context) {
    return InputValuePage(arguments: arguments);
  }
}
