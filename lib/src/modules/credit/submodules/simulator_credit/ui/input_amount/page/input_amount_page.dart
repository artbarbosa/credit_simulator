import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/ui/widget/custom_buttom.dart';

import '../../../../../../../core/shared/consts/app_colors_const.dart';
import '../../input_options/input_options_arguments.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const LinearProgressIndicator(
          value: 0.33,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 35, right: 35, bottom: 35, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: currentSize.height * 0.3,
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'De quanto ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Aftika',
                          color: AppColorsConst.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'você precisa?',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Aftika',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'De Quanto Voce Precisa ',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'R\$500',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' a ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'R\$300.000',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                initialValue: '5.000',
                style: const TextStyle(
                  fontFamily: 'Abitare',
                  fontSize: 40,
                  color: AppColorsConst.primary,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
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
                  currentSize: currentSize)
            ],
          ),
        ),
      ),
    );
  }
}
