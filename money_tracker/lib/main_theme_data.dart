import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';


TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    titleLarge: CustomThemeProp.titleLargeTypography.style,//24
    titleMedium: CustomThemeProp.titleMediumTypography.style,//15
    titleSmall: CustomThemeProp.titleMediumTypography.style.copyWith(//15
      color: Colors.white,
    ),

    bodyLarge: CustomThemeProp.bodyMediumTypographyVioletFirm.style,//17
    bodyMedium: CustomThemeProp.bodyMediumTypography.style,//17
    bodySmall: CustomThemeProp.bodySmallTypography.style,//10

    displayLarge: CustomThemeProp.displayLarge.style,//12
    displaySmall: CustomThemeProp.pieChartSectionTypography.style,//12

  );
}

TextTheme _textBlack(TextTheme base) {
  return base.copyWith(
    titleLarge: CustomThemeProp.titleLargeTypography.style,
    titleMedium: CustomThemeProp.titleMediumTypography.style,
    titleSmall: CustomThemeProp.titleMediumTypography.style.copyWith(
      color: Colors.white,
    ),
    bodyMedium: CustomThemeProp.bodyMediumTypography.style,
    bodyLarge: CustomThemeProp.bodyMediumTypographyVioletFirm.style,
    bodySmall: CustomThemeProp.bodySmallTypography.style,//10

    displayLarge: CustomThemeProp.displayLarge.style,//12
    displaySmall: CustomThemeProp.pieChartSectionTypography.style,//12
  );
}

ColorScheme _colorScheme(ColorScheme base) {
  return base.copyWith(
    background: CustomThemeProp.white,
    primary: CustomThemeProp.violetFirm,
    primaryContainer: CustomThemeProp.violetFirm,

    secondary: CustomThemeProp.grayLight,
    secondaryContainer: CustomThemeProp.grayLight,

    inversePrimary: CustomThemeProp.red,
  );
}

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base){
  return base.copyWith(
    border: const UnderlineInputBorder(borderSide: BorderSide(
      color: CustomThemeProp.grayLight,
      width: 2,
    )),
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(
      color: CustomThemeProp.violetFirm,
      width: 2,
    )),
    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(
      color: CustomThemeProp.grayLight,
      width: 2,
    )),

    suffixIconColor: CustomThemeProp.grayLight,
    focusColor: CustomThemeProp.violetFirm,

    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelAlignment: FloatingLabelAlignment.start,

    labelStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    floatingLabelStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    errorStyle: CustomThemeProp.bodyMediumTypographyRed.style,

    hintStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    counterStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    prefixStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    suffixStyle: CustomThemeProp.bodyMediumTypographyGray.style,
    helperStyle: CustomThemeProp.bodyMediumTypographyGray.style,


  );
}

AppBarTheme _appBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: CustomThemeProp.violetFirm,
    centerTitle: true,
    iconTheme: IconThemeData(color: CustomThemeProp.white, size: 24),
    titleTextStyle: CustomThemeProp.appBarTypographyWhite.style,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(BottomNavigationBarThemeData base){
  return base.copyWith(
    backgroundColor: CustomThemeProp.white,
    selectedItemColor: CustomThemeProp.violetFirm,
    unselectedItemColor: CustomThemeProp.grayText,
    selectedIconTheme:  const IconThemeData(color: CustomThemeProp.violetFirm, size: 24),
    selectedLabelStyle: CustomThemeProp.bottomNavigationBarTypography.style,
    unselectedIconTheme: const IconThemeData(color: CustomThemeProp.grayText, size: 24),
    unselectedLabelStyle: CustomThemeProp.bottomNavigationBarTypography.style.copyWith(
      color: CustomThemeProp.grayText
    ),
    mouseCursor: const MaterialStatePropertyAll(SystemMouseCursors.click),
    elevation: 0,
  );
}

CardTheme _cardTheme(CardTheme base) {
  return base.copyWith(
    color: CustomThemeProp.white,
    surfaceTintColor: CustomThemeProp.whiteWithOpacity(),
    margin: const EdgeInsets.only(left: 25, right: 25, bottom: 12.5, top: 12.5),
    shadowColor: CustomThemeProp.grayLight,
    elevation: 13,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    clipBehavior: Clip.antiAliasWithSaveLayer
  );
}

IconThemeData _iconTheme(IconThemeData base){
  return base.copyWith(
      color: CustomThemeProp.grey,
      size: 24
  );
}



ProgressIndicatorThemeData _progressIndicatorThemeData(ProgressIndicatorThemeData base){
  return base.copyWith(
    //color: Colors.black54,
  );
}

DialogTheme _dialogTheme(DialogTheme base){
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor: CustomThemeProp.white,
    surfaceTintColor: CustomThemeProp.white,
    iconColor: CustomThemeProp.redDialog,
    titleTextStyle: CustomThemeProp.bodyMediumTypography.style.copyWith(
      color: CustomThemeProp.redDialog
    ),
    contentTextStyle: CustomThemeProp.bodyMediumTypography.style.copyWith(
      color: CustomThemeProp.redDialog
    ),
  );
}

ButtonStyle _buttonStyle(ButtonStyle base){
  return base.copyWith(
    backgroundColor: const MaterialStatePropertyAll(CustomThemeProp.violetFirm),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    foregroundColor: MaterialStatePropertyAll(CustomThemeProp.white),

    //padding: const MaterialStatePropertyAll(EdgeInsets.only(top: 15, bottom: 15)),
    minimumSize: const MaterialStatePropertyAll(Size(0, 50)),
    maximumSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),


    textStyle: MaterialStatePropertyAll(CustomThemeProp.bodyMediumTypography.style.copyWith(
      color: CustomThemeProp.white,
    )),
  );
}



ChipThemeData _chipThemeData(ChipThemeData base){
  return base.copyWith(
    // backgroundColor: Colors.black54,
    // disabledColor: Colors.grey,
    // selectedColor: Colors.deepOrange[100],
    // labelStyle: const TextStyle(color: Colors.white),
    // showCheckmark: false,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    // padding: const EdgeInsets.all(5),
    // elevation: 0,
    // side: const BorderSide(color: Colors.white, width: 6, style: BorderStyle.solid),


  );
}

ThemeData _theme = CustomThemeProp.bwTheme?ThemeData.light():ThemeData.dark();

ThemeData themeMainProgram = _theme.copyWith(

  appBarTheme: _appBarTheme(_theme.appBarTheme),

  colorScheme: _colorScheme(_theme.colorScheme),

  primaryColorLight: CustomThemeProp.violetFirm,
  primaryColorDark: CustomThemeProp.violetFirm,
  scaffoldBackgroundColor: CustomThemeProp.white,
  dialogBackgroundColor: CustomThemeProp.white,


  bottomNavigationBarTheme: _bottomNavigationBarThemeData(_theme.bottomNavigationBarTheme),

  textTheme: CustomThemeProp.bwTheme
      ?_textLight(_theme.textTheme)
      :_textBlack(_theme.textTheme),

  iconTheme: _iconTheme(_theme.iconTheme),

  cardTheme: _cardTheme(_theme.cardTheme),

  progressIndicatorTheme: _progressIndicatorThemeData(_theme.progressIndicatorTheme),

  dialogTheme: _dialogTheme(_theme.dialogTheme),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buttonStyle(
      _theme.elevatedButtonTheme.style??const ButtonStyle(),
    ),
  ),




  chipTheme: _chipThemeData(_theme.chipTheme),

  inputDecorationTheme: _inputDecorationTheme(_theme.inputDecorationTheme),


);
