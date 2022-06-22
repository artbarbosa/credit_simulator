import 'package:flutter/material.dart';

import 'app_colors_const.dart';

class AppTextStylesConst {
  static const titlesBlack = TextStyle(
    fontSize: 26,
    fontFamily: 'Cabrion',
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static const titlesPrimary = TextStyle(
    fontSize: 26,
    fontFamily: 'Cabrion',
    color: AppColorsConst.primary,
    fontWeight: FontWeight.w700,
  );

  static final subtitlesRegular = TextStyle(
    fontSize: 16,
    fontFamily: 'Cabrion',
    color: Colors.black.withOpacity(0.8),
  );
  static const subtitlesBold = TextStyle(
    fontSize: 16,
    fontFamily: 'Cabrion',
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static const numberTitle = TextStyle(
    fontSize: 45,
    fontFamily: 'Abitare',
    color: AppColorsConst.primary,
  );

  static const textButtonrPrimary = TextStyle(
    fontSize: 17,
    fontFamily: 'Cabrion',
    color: AppColorsConst.primary,
    fontWeight: FontWeight.w700,
  );
  static const buttonPrimary = TextStyle(
    fontSize: 20,
    fontFamily: 'Cabrion',
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static final titleSlideRegular = TextStyle(
    fontSize: 18,
    fontFamily: 'Cabrion',
    color: Colors.black.withOpacity(0.85),
    fontWeight: FontWeight.w700,
  );
  static const titleSlideBold = TextStyle(
    fontSize: 18,
    fontFamily: 'Cabrion',
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static final resultRegular = TextStyle(
    fontFamily: 'Cabrion',
    fontSize: 14,
    color: Colors.black.withOpacity(0.8),
  );
  static const resultBold = TextStyle(
    fontSize: 14,
    fontFamily: 'Cabrion',
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}
