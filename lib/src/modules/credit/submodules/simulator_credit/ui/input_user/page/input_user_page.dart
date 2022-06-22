import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/ui/widget/custom_buttom.dart';

import '../../../../../../../core/shared/consts/app_text_style_const.dart';
import '../../input_amount/route/input_amount_arguments.dart';
import '../controller/input_user_controller.dart';

class InputUserPage extends StatelessWidget {
  InputUserPage({Key? key}) : super(key: key);

  final controller = InputUserController();

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SizedBox(
            height: currentSize.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 35, left: 30, right: 30, top: 96),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset('assets/images/input_user_image.png'),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Simule ',
                      style: AppTextStylesConst.titlesBlack,
                      children: [
                        TextSpan(
                          text: 'agora',
                          style: AppTextStylesConst.titlesPrimary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Crédito rápido, fácil e seguro! :)',
                      style: AppTextStylesConst.subtitlesRegular),
                  SizedBox(height: currentSize.height * 0.1),
                  RichText(
                    text: TextSpan(
                      text: 'Qual seu',
                      style: AppTextStylesConst.subtitlesRegular,
                      children: const [
                        TextSpan(
                          text: ' nome completo?',
                          style: AppTextStylesConst.subtitlesBold,
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Nome Completo',
                    ),
                    validator: controller.validateFullName,
                    onSaved: (fullname) {
                      controller.fullName = fullname!;
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'E seu',
                      style: AppTextStylesConst.subtitlesRegular,
                      children: const [
                        TextSpan(
                          text: ' e-mail?',
                          style: AppTextStylesConst.subtitlesBold,
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'seuemail@email.com',
                    ),
                    onSaved: (email) {
                      controller.email = email!;
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    label: 'Continuar',
                    onPressed: () {
                      controller.onSavedUser();
                      Navigator.of(context).pushNamed('/inputValue',
                          arguments:
                              InputAmountArguments(user: controller.userModel));
                    },
                    width: currentSize.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
