import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/consts/app_colors_const.dart';
import 'package:rispar_credit_simulator/src/core/shared/ui/widget/custom_buttom.dart';

import '../../input_amount/route/input_amount_arguments.dart';
import '../controller/input_user_controller.dart';

class InputUserPage extends StatelessWidget {
  InputUserPage({Key? key}) : super(key: key);

  final controller = InputUserController();

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 35, right: 35, bottom: 35, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: currentSize.height * 0.35,
                child: Image.asset('assets/images/input_user_image.png'),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Simule ',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Aftika',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'agora',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Aftika',
                        color: AppColorsConst.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Crédito rápido, fácil e seguro! :)',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Vayu',
                  color: Color(0xFF323436),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'Qual seu',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Vayu',
                    color: Color(0xFF323436),
                  ),
                  children: [
                    TextSpan(
                      text: ' nome completo?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Nome Completo',
                ),
                validator: controller.validateFullName,
                onSaved: (fullname) {
                  controller.fullName = fullname!;
                },
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  text: 'E seu',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Vayu',
                    color: Color(0xFF323436),
                  ),
                  children: [
                    TextSpan(
                      text: 'e-mail?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
                decoration: const InputDecoration(
                  hintText: 'seuemail@email.com',
                ),
                onSaved: (email) {
                  controller.email = email!;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Continuar',
                onPressed: () {
                  controller.onSavedUser();
                  Navigator.of(context).pushNamed('/inputValue',
                      arguments:
                          InputAmountArguments(user: controller.userModel));
                },
                currentSize: currentSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
