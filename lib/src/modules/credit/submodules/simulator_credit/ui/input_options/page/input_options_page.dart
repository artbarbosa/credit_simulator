import 'package:flutter/material.dart';

import '../../../../../../../core/shared/consts/app_text_style_const.dart';
import '../../../../../../../core/shared/ui/widget/custom_app_bar.dart';
import '../../../../../../../core/shared/ui/widget/custom_buttom.dart';
import '../../../../../../../core/shared/utils/format_double_decimal.dart';
import '../../../models/post_credit_model.dart';
import '../../credit_result/route/credit_result_arguments.dart';
import '../route/input_options_arguments.dart';
import 'controller/input_options_controller.dart';
import 'widgets/custom_slide.dart';

class InputOptionsPage extends StatefulWidget {
  const InputOptionsPage({Key? key, required this.arguments}) : super(key: key);
  final InputOptionsArguments arguments;

  @override
  State<InputOptionsPage> createState() => _InputOptionsPageState();
}

class _InputOptionsPageState extends State<InputOptionsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = InputOptionsController();
    final Size currentSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          value: 0.66,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Valor escolhido',
                    style: AppTextStylesConst.titlesBlack),
                Text(
                    'R\$ ${FormatDoubleDecimal.call(widget.arguments.amountCreditModel.amount)}',
                    style: AppTextStylesConst.numberTitle),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RichText(
                text: TextSpan(
                  text: 'Escolha o',
                  style: AppTextStylesConst.titleSlideRegular,
                  children: const [
                    TextSpan(
                      text: ' quantidades de parcelas',
                      style: AppTextStylesConst.titleSlideBold,
                    ),
                  ],
                ),
              ),
            ),
            CustomSlide(
              minValue: 3,
              maxValue: 12,
              divisions: 3,
              labelBottom: const ['3', '6', '9', '12'],
              currentSliderValue: 12,
              onChanged: (value) {
                controller.onChangeTerm(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: RichText(
                text: TextSpan(
                  text: 'Escolha o',
                  style: AppTextStylesConst.titleSlideRegular,
                  children: const [
                    TextSpan(
                      text: ' percentual de garantia',
                      style: AppTextStylesConst.titleSlideBold,
                    ),
                  ],
                ),
              ),
            ),
            CustomSlide(
              minValue: 20,
              maxValue: 50,
              divisions: 2,
              labelBottom: const ['20', '35', '50'],
              currentSliderValue: 20,
              onChanged: (value) {
                controller.onChangeLtv(value);
              },
            ),
            const Spacer(),
            const Text(
              'Garantia Protegida',
              style: AppTextStylesConst.titlesPrimary,
            ),
            Text(
              'Bitcoin caiu? Fique tranquilo! Na garantia protegida, você não recebe chamada de margem e não é liquido.',
              style: AppTextStylesConst.subtitlesRegular,
            ),
            const Spacer(),
            Center(
              child: TextButton(
                child: const Text(
                  'Continuar sem proteção',
                  style: AppTextStylesConst.textButtonrPrimary,
                ),
                onPressed: () {
                  controller.setHasProtected(false);
                  Navigator.of(context).pushNamed(
                    '/creditResult',
                    arguments: PostCreditModel(
                      user: widget.arguments.user,
                      amount: widget.arguments.amountCreditModel.amount,
                      ltv: controller.ltv,
                      term: controller.term,
                      hasProtectedCollateral: controller.hasProtected,
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              label: 'Adicionar garantia',
              onPressed: () {
                controller.setHasProtected(true);
                Navigator.of(context).pushNamed(
                  '/creditResult',
                  arguments: CreditResultArguments(
                    postCreditModel: PostCreditModel(
                      user: widget.arguments.user,
                      amount: widget.arguments.amountCreditModel.amount,
                      ltv: controller.ltv,
                      term: controller.term,
                      hasProtectedCollateral: controller.hasProtected,
                    ),
                  ),
                );
              },
              width: currentSize.width,
            ),
          ],
        ),
      ),
    );
  }
}
