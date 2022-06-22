import 'package:flutter/material.dart';

import '../../consts/app_colors_const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.value,
  }) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: LinearProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(AppColorsConst.primary),
        backgroundColor: AppColorsConst.onBackground,
        value: value,
      ),
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
    );
  }
}
