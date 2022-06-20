import 'package:flutter/material.dart';

import '../container/credit_result_container.dart';
import 'credit_result_arguments.dart';

class CreditResultRoute extends StatelessWidget {
  const CreditResultRoute({Key? key, required this.arguments})
      : super(key: key);
  final CreditResultArguments arguments;

  @override
  Widget build(BuildContext context) {
    return CreditResultContainer(
      arguments: arguments,
    );
  }
}
