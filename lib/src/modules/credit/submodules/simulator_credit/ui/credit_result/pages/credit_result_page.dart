import 'package:flutter/material.dart';

import '../../../../../../../core/shared/consts/app_text_style_const.dart';
import '../../../../../../../core/shared/ui/widget/custom_app_bar.dart';
import '../../../../../../../core/shared/ui/widget/custom_buttom.dart';
import '../../../../../../../core/shared/utils/format_double_decimal.dart';
import '../../../../../../../core/shared/utils/format_double_decimal_with_cents.dart';
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
                  result:
                      'R\$ ${FormatDoubleDecimal.call(creditModel.netValue.toDouble())}',
                ),
                ListTileWidget(
                  label: 'Garantia',
                  result:
                      '₿ ${creditModel.convertBitcoinToSats().toStringAsFixed(8).replaceAll('.', ',')}',
                ),
                ListTileWidget(
                  label: 'Taxa de Juros',
                  result: '${creditModel.interestRate.toString()}% a.m',
                ),
                ListTileWidget(
                  label: 'Percentual de Garantia',
                  result: '${creditModel.ltv.toString()}%',
                ),
                ListTileWidget(
                  label: 'Primeiro Vencimento',
                  result: creditModel.firstDueDate.replaceAll('-', '/'),
                ),
                ListTileWidget(
                  label: 'IOF',
                  result:
                      'R\$ ${creditModel.iofFee.toStringAsFixed(2).replaceAll('.', ',')}',
                ),
                ListTileWidget(
                  label: 'Tarifa da Plataforma',
                  result:
                      'R\$ ${creditModel.originationFee.toStringAsFixed(2).replaceAll('.', ',')}',
                ),
                ListTileWidget(
                  label: 'Total Financiado',
                  result:
                      'R\$ ${FormatDoubleDecimalWithCents.call(creditModel.contractValue.toDouble(), '.', ',')}',
                ),
                ListTileWidget(
                  label: 'CET Mensal',
                  result: '${creditModel.monthlyRate.toStringAsFixed(2)}%',
                ),
                ListTileWidget(
                  label: 'CET Anual',
                  result: '${creditModel.annualRate.toStringAsFixed(2)}%',
                ),
                ListTileWidget(
                  label: 'Cotação BTC',
                  result:
                      'R\$ ${FormatDoubleDecimalWithCents.call(creditModel.collateralUnitPrice, ',', '.')}',
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
