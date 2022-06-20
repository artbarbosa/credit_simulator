import 'package:flutter/material.dart';

import '../../../../../models/credit_model.dart';

class CreditResultPage extends StatelessWidget {
  const CreditResultPage({Key? key, required this.creditModel})
      : super(key: key);

  final CreditModel creditModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(creditModel.email),
      ]),
    );
  }
}
