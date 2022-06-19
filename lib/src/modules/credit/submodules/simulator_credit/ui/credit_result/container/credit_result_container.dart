import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controllers/credit_result_controller.dart';
import '../page/credit_result_error.dart';
import '../page/credit_result_loading.dart';
import '../page/credit_result_page.dart';
import '../route/credit_result_arguments.dart';
import '../states/credit_result_states.dart';

class CreditResultContainer extends StatefulWidget {
  const CreditResultContainer({Key? key, required this.arguments})
      : super(key: key);

  final CreditResultArguments arguments;

  @override
  State<CreditResultContainer> createState() => _CreditResultContainerState();
}

class _CreditResultContainerState extends State<CreditResultContainer> {
  final controller = GetIt.I.get<CreditResultController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        controller.fetchCreditSimulator(widget.arguments.postCreditModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        if (value is CreditResultLoadedState) {
          return const CreditResultPage();
        }
        if (value is CreditResultErrorState) {
          return const CreditResultError();
        }

        return const CreditResultLoading();
      },
    );
  }
}
