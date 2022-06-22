import 'package:flutter/material.dart';

import '../../../../../../../core/shared/consts/app_colors_const.dart';
import '../../../../../../../core/shared/consts/app_text_style_const.dart';
import '../../../../../../../core/shared/ui/widget/custom_buttom.dart';

class CreditResultError extends StatelessWidget {
  const CreditResultError(
      {Key? key, required this.errorMenssage, required this.refresh})
      : super(key: key);
  final String errorMenssage;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
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
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Text(
                errorMenssage,
                style: AppTextStylesConst.subtitlesRegular,
              ),
            ),
            const Spacer(),
            CustomButton(
              onPressed: refresh,
              width: currentSize.width,
              label: 'Tentar novamente',
            )
          ],
        ),
      ),
    );
  }
}
