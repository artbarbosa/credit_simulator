import 'package:flutter/material.dart';

import '../../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../../core/shared/consts/app_text_style_const.dart';

class CreditResultLoading extends StatelessWidget {
  const CreditResultLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size currentSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColorsConst.primary,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/inputUser');
            },
            icon: const Icon(
              Icons.clear,
              color: AppColorsConst.primary,
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: currentSize.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/gifs/progress_indicator.gif', width: 50),
              const SizedBox(height: 30),
              const Text(
                'Aguarde um momento',
                style: AppTextStylesConst.titlesBlack,
              ),
              const SizedBox(height: 20),
              Text(
                'Estamos simulando seu pedido de crédito Rispar...',
                style: AppTextStylesConst.subtitlesRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
