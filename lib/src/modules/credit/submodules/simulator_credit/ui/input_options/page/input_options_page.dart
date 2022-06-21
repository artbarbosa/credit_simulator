import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/models/post_credit_model.dart';

import '../../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../../core/shared/utils/format_amount.dart';
import '../../credit_result/route/credit_result_arguments.dart';
import '../input_options_arguments.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Valor Escolhido',
            style: TextStyle(
              fontFamily: 'Abitare',
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          Text(
            'R\$ ${FormatAmount.call(widget.arguments.amountCreditModel.amount)}',
            style: const TextStyle(
              fontFamily: 'Abitare',
              fontSize: 40,
              color: AppColorsConst.primary,
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
          TextButton(
            child: const Text('Continuar Sem Protreção'),
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
          ElevatedButton(
            child: const Text('Continuar'),
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
          )
        ],
      ),
    );
  }
}
