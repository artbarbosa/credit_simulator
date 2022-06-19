import 'package:flutter/material.dart';

import '../../../../../../../../core/shared/consts/app_colors_const.dart';

class CustomSlide extends StatefulWidget {
  CustomSlide(
      {Key? key,
      required this.labelBottom,
      required this.minValue,
      required this.maxValue,
      required this.divisions,
      required this.currentSliderValue,
      required this.onChanged})
      : super(key: key);

  final double minValue;
  final double maxValue;
  final int divisions;
  final List<String> labelBottom;
  final void Function(num) onChanged;
  double currentSliderValue;

  @override
  State<CustomSlide> createState() => _CustomSlideState();
}

class _CustomSlideState extends State<CustomSlide> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: const SliderThemeData(
            disabledInactiveTrackColor: AppColorsConst.onBackground,
            inactiveTrackColor: AppColorsConst.onBackground,
            thumbColor: AppColorsConst.primary,
            activeTrackColor: AppColorsConst.primary,
            disabledActiveTrackColor: AppColorsConst.onBackground,
            tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 7),
            inactiveTickMarkColor: AppColorsConst.onBackground,
            activeTickMarkColor: AppColorsConst.primary,
          ),
          child: Slider(
              value: widget.currentSliderValue,
              min: widget.minValue,
              max: widget.maxValue,
              divisions: widget.divisions,
              onChanged: (value) {
                widget.onChanged;
                setState(() {
                  widget.currentSliderValue = value;
                });
              }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.labelBottom
                .asMap()
                .map<int, Widget>(
                  (index, model) => MapEntry(
                    index,
                    SizedBox(
                      width: 30,
                      child: Text(
                        widget.labelBottom[index].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ],
    );
  }
}
