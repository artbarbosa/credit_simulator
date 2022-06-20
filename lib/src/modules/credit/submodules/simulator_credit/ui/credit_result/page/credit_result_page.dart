import 'package:flutter/material.dart';

import '../../../../../models/credit_model.dart';
import 'widgets/list_tile_widget.dart';

class CreditResultPage extends StatelessWidget {
  const CreditResultPage({Key? key, required this.creditModel})
      : super(key: key);

  final CreditModel creditModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Resultado da simulação'),
          ListTileWidget(
            label: 'Valor Escolhido',
            result: creditModel.netValue.toStringAsFixed(0),
          ),
          ListTileWidget(
            label: 'Garantia',
            result: (creditModel.collateral / 100000000).toString(),
          ),
          ListTileWidget(
            label: 'Taxa de Juros',
            result: creditModel.interestRate.toString(),
          ),
          ListTileWidget(
            label: 'Percentual de Garantia',
            result: 'creditModel.',
          ),
          ListTileWidget(
            label: 'Primeiro Vencimento',
            result: creditModel.firstDueDate.replaceAll('-', '/'),
          ),
          ListTileWidget(
            label: 'IOF',
            result: creditModel.iofFee.toString(),
          ),
          ListTileWidget(
            label: 'Tarifa da Plataforma',
            result: creditModel.originationFee.toStringAsFixed(2),
          ),
          ListTileWidget(
            label: 'Total Financiado',
            result: creditModel.contractValue.toStringAsFixed(2),
          ),
          ListTileWidget(
            label: 'CET Mensal',
            result: creditModel.monthlyRate.toStringAsFixed(2),
          ),
          ListTileWidget(
            label: 'CET Anual',
            result: creditModel.annualRate.toStringAsFixed(2),
          ),
          ListTileWidget(
            label: 'Cotação BTC',
            result: 'creditModel.contractValue.toStringAsFixed(3)',
          ),
        ],
      ),
    );
  }
}
