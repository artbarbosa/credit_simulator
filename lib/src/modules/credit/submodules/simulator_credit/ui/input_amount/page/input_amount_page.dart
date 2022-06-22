import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/ui/widget/custom_buttom.dart';

import '../../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../../core/shared/consts/app_text_style_const.dart';
import '../../../../../../../core/shared/ui/widget/custom_app_bar.dart';
import '../../input_options/route/input_options_arguments.dart';
import '../controller/input_amount_controller.dart';
import '../route/input_amount_arguments.dart';
import '../utils/currency_value_mask.dart';

class InputValuePage extends StatelessWidget {
  const InputValuePage({Key? key, required this.arguments}) : super(key: key);
  final InputAmountArguments arguments;

  @override
  Widget build(BuildContext context) {
    final controller = InputAmountController();
    final currentSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          value: 0.33,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SizedBox(
            height: currentSize.height - 80,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 35, top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'De quanto ',
                      style: AppTextStylesConst.titlesPrimary,
                      children: [
                        TextSpan(
                          text: 'você precisa?',
                          style: AppTextStylesConst.titlesBlack,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: 'Insira um valor entre ',
                      style: AppTextStylesConst.subtitlesRegular,
                      children: [
                        const TextSpan(
                          text: 'R\$500',
                          style: AppTextStylesConst.subtitlesBold,
                        ),
                        TextSpan(
                          text: ' a ',
                          style: AppTextStylesConst.subtitlesRegular,
                        ),
                        const TextSpan(
                          text: 'R\$300.000',
                          style: AppTextStylesConst.subtitlesBold,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextFormField(
                    initialValue: '5.000',
                    style: AppTextStylesConst.numberTitle,
                    keyboardType: TextInputType.number,
                    validator: controller.validateAmount,
                    onSaved: (amount) {
                      if (amount != null) {
                        controller.setValue(amount);
                      }
                    },
                    inputFormatters: [
                      CurrencyValueMask(decimal: '.'),
                    ],
                    decoration: const InputDecoration(
                        prefix: Text(
                      'R\$ ',
                      style: TextStyle(color: AppColorsConst.primary),
                    )),
                  ),
                  const Spacer(),
                  CustomButton(
                    label: 'Continuar',
                    onPressed: () {
                      controller.onSavedAmount();
                      Navigator.of(context).pushNamed(
                        '/inputOptions',
                        arguments: InputOptionsArguments(
                          user: arguments.user,
                          amountCreditModel: controller.amountCreditModel,
                        ),
                      );
                    },
                    width: currentSize.width,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
