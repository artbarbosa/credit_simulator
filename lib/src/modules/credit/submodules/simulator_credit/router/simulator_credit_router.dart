import 'package:flutter/material.dart';

import '../ui/credit_result/route/credit_result_arguments.dart';
import '../ui/credit_result/route/credit_result_route.dart';
import '../ui/inputOptions/input_options_arguments.dart';
import '../ui/inputOptions/input_options_route.dart';
import '../ui/input_user/route/input_user_route.dart';
import '../ui/input_value/route/input_value_arguments.dart';
import '../ui/input_value/route/input_value_route.dart';

class SimulatorCreditRouter extends StatelessWidget {
  const SimulatorCreditRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/inputUser',
      onGenerateRoute: (settings) {
        if (settings.name == '/inputUser') {
          return MaterialPageRoute(
            builder: (context) {
              return const InputUserRoute();
            },
          );
        }
        if (settings.name == '/inputValue') {
          return MaterialPageRoute(
            builder: (context) {
              return InputValueRoute(
                arguments: settings.arguments as InputValueArguments,
              );
            },
          );
        }
        if (settings.name == '/inputOptions') {
          return MaterialPageRoute(
            builder: (context) {
              return InputOptionsRoute(
                arguments: settings.arguments as InputOptionsArguments,
              );
            },
          );
        }
        if (settings.name == '/creditResult') {
          return MaterialPageRoute(
            builder: (context) {
              return CreditResultRoute(
                arguments: settings.arguments as CreditResultArguments,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
