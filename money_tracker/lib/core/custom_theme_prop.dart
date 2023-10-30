import 'package:flutter/material.dart';

class Typography {
  String fontFamily;
  double fontSize;
  FontWeight fontWeight;
  double lineHeightPX;
  double letterSpacing;
  TextAlign textAlign;
  Color fontColor;

  Typography({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeightPX,
    required this.letterSpacing,
    required this.textAlign,
    required this.fontColor,
  });

  TextStyle get style => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: fontColor,
    letterSpacing: letterSpacing,
    fontWeight: fontWeight,
    ///When height is non-null, the line height of the span of text will be a multiple of fontSize and be exactly fontSize * height logical pixels tall.
    height: fontSize / lineHeightPX,
  );
}

/// свой класс Colors
/// наследники нам не нужны от этого класса поэтому final
abstract final class CustomThemeProp {
  ///true - light, false - black
  static bool bwTheme = true;

  static const String mainFont = 'SF UI Display';

  static Color black = bwTheme?
                          const Color(0xFF000000):
                          const Color(0xFFF0F0F0);
  static Color white = bwTheme?
                          const Color(0xFFFFFFFF):
                          const Color(0xFF000000);
  static const Color grayText   = Color(0xFFABABAB);
  static const Color red        = Color(0xFFF80606);
  static const Color violetFirm = Color(0xFF9053EB);
  static const Color grayLight  = Color(0xFFD0D0D0);
  static const Color grey       = Colors.grey;

  //rgba(0, 0, 0, 0.15)
  //{background: #000000; opacity: 0.1;}
  static Color whiteWithOpacity([double opacity = 0.15]) => Colors.white.withOpacity(opacity);
/*
//styleName: h_1_24;
font-family: SF UI Display;
font-size: 24px;
font-weight: 700;
line-height: 17px;
letter-spacing: 0em;
text-align: left;
*/
  static final Typography titleLargeTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    lineHeightPX: 17,
    fontColor: black,
    textAlign: TextAlign.left,
    letterSpacing: 0,
  );

/*
font-family: SF UI Display;
font-size: 15px;
font-weight: 400;
line-height: 17px;
letter-spacing: 0em;
text-align: center;
*/
  static final Typography titleMediumTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    lineHeightPX: 17,
    fontColor: black,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

  /*
//styleName: txr_17px_reg;
font-family: SF UI Display;
font-size: 17px;
font-weight: 400;
line-height: 17px;
letter-spacing: 0em;
text-align: left;

*/
  static final Typography bodyMediumTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    lineHeightPX: 17,
    fontColor: black,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

  static final Typography bodyMediumTypographyVioletFirm = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    lineHeightPX: 17,
    fontColor: violetFirm,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

  static final Typography bodyMediumTypographyGray = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    lineHeightPX: 17,
    fontColor: grayText,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

  static final Typography bodyMediumTypographyRed = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    lineHeightPX: 17,
    fontColor: red,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

/*//styleName: h_1_24;
font-family: SF UI Display;
font-size: 24px;
font-weight: 700;
line-height: 17px;
letter-spacing: 0em;
text-align: center;
*/
  static final Typography appBarTypographyWhite = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    lineHeightPX: 17,
    fontColor: white,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );
/*
  font-family: SF UI Display;
  font-size: 10px;
  font-weight: 400;
  letter-spacing: -0.40799999237060547px;
  text-align: left;

//styleName: 10_px;
  font-family: SF UI Display;
  font-size: 10px;
  font-weight: 400;
  letter-spacing: -0.40799999237060547px;
  text-align: left;
*/
  static final Typography bodySmallTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    lineHeightPX: 17,
    fontColor: grayText,
    textAlign: TextAlign.left,
    letterSpacing: -0.40799999237060547,
  );

/*//styleName: 10_px;
font-family: SF UI Display;
font-size: 10px;
font-weight: 400;
letter-spacing: -0.40799999237060547px;
text-align: center;
*/
  static final Typography bottomNavigationBarTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    lineHeightPX: 17,
    fontColor: violetFirm,
    textAlign: TextAlign.center,
    letterSpacing: -0.40799999237060547,
  );

  /*//styleName: 12px-bold;
font-family: SF UI Display;
font-size: 12px;
font-weight: 700;
line-height: 17px;
letter-spacing: 0em;
text-align: center;
*/
  static final Typography pieChartSectionTypography = Typography(
    fontFamily: mainFont,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    lineHeightPX: 17,
    fontColor: white,
    textAlign: TextAlign.center,
    letterSpacing: 0,
  );

//styleName: txr_17px_reg;
//   font-family: SF UI Display;
//   font-size: 17px;
//   font-weight: 400;
//   line-height: 17px;
//   letter-spacing: 0em;
//   text-align: left;
//
//   static Typography largeTypoH_15_Bold= Typography(
//     fontFamily: mainFont,
//     fontWeight: 700,
//     fontSize: 15,
//     lineHeight: 17,
//     fontColor: black,
//     textAlign: Alignment.center,
//     letterSpacing: 0,
//   );
//
//   //styleName: txt_15px_bold;
//   font-family: SF UI Display;
//   font-size: 15px;
//   font-weight: 700;
//   line-height: 17px;
//   letter-spacing: 0em;
//   text-align: center;
//
// //styleName: txt_15px_reg;
//   font-family: SF UI Display;
//   font-size: 15px;
//   font-weight: 400;
//   line-height: 17px;
//   letter-spacing: 0em;
//   text-align: center;
//

  static const buttonSize = Size(double.maxFinite, 50);

}
