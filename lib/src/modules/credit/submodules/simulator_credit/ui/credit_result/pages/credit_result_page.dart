import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/consts/app_text_style_const.dart';

import '../../../../../../../core/shared/ui/widget/custom_app_bar.dart';
import '../../../../../../../core/shared/ui/widget/custom_buttom.dart';
import '../../../../../models/credit_model.dart';
import 'widgets/list_tile_widget.dart';

class CreditResultPage extends StatelessWidget {
  const CreditResultPage({Key? key, required this.creditModel})
      : super(key: key);

  final CreditModel creditModel;
  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          value: 1,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Resultado da simulação',
              style: AppTextStylesConst.titlesBlack,
            ),
            const Spacer(),
            Column(
              children: [
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
                const ListTileWidget(
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
                const ListTileWidget(
                  label: 'Cotação BTC',
                  result: 'creditModel.contractValue.toStringAsFixed(3)',
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              label: 'Nova simulação',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/inputUser');
              },
              width: currentSize.width,
            ),
          ],
        ),
      ),
    );
  }
}
