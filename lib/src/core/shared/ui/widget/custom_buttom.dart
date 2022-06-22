import 'package:flutter/material.dart';

import '../../consts/app_text_style_const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.width,
      required this.label})
      : super(key: key);
  final void Function() onPressed;
  final double width;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: width,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 20))),
          onPressed: onPressed,
          child: Text(
            label,
            style: AppTextStylesConst.buttonPrimary,
          ),
        ),
      ),
    );
  }
}
