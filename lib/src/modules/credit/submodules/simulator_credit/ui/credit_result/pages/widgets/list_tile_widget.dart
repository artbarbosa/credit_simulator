import 'package:flutter/material.dart';
import 'package:rispar_credit_simulator/src/core/shared/consts/app_text_style_const.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key, required this.label, required this.result})
      : super(key: key);
  final String label;
  final String result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: AppTextStylesConst.subtitlesBold,
                ),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: AppTextStylesConst.subtitlesRegular,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.0)
        ],
      ),
    );
  }
}
