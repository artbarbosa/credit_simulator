import 'package:flutter/material.dart';

import '../submodules/simulator_credit/router/simulator_credit_router.dart';

class CreditRouter extends StatelessWidget {
  const CreditRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/simulator',
      onGenerateRoute: (settings) {
        if (settings.name == '/simulator') {
          return MaterialPageRoute(
            builder: (context) {
              return const SimulatorCreditRouter();
            },
          );
        }
        return null;
      },
    );
  }
}
