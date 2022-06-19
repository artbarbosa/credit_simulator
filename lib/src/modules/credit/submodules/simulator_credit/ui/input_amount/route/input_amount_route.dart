import 'package:flutter/material.dart';

import '../page/input_amount_page.dart';
import 'input_amount_arguments.dart';

class InputAmountRoute extends StatelessWidget {
  const InputAmountRoute({Key? key, required this.arguments}) : super(key: key);
  final InputAmountArguments arguments;
  @override
  Widget build(BuildContext context) {
    return InputValuePage(arguments: arguments);
  }
}
