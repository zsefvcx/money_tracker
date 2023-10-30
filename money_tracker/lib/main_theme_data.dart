import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';


TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    titleLarge: CustomThemeProp.titleLargeTypography.style,
    titleMedium: CustomThemeProp.titleMediumTypography.style,
    titleSmall: CustomThemeProp.titleMediumTypography.style.copyWith(
      color: Colors.white,
    ),
    bodyMedium: CustomThemeProp.bodyMediumTypography.style,
    bodyLarge: CustomThemeProp.bodyMediumTypographyVioletFirm.style,
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
    // color: CustomThemeProp.violetFirm,
    // elevation: 10,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    // margin: const EdgeInsets.all(10),
    // clipBehavior: Clip.antiAliasWithSaveLayer
  );
}

ProgressIndicatorThemeData _progressIndicatorThemeData(ProgressIndicatorThemeData base){
  return base.copyWith(
    //color: Colors.black54,
  );
}

DialogTheme _dialogTheme(DialogTheme base){
  return base.copyWith(
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    //backgroundColor: Colors.grey,

  );
}

ButtonStyle _buttonStyle(ButtonStyle base){
  return base.copyWith(
    // backgroundColor: MaterialStatePropertyAll(Colors.deepOrange[100]),
    // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    // foregroundColor: const MaterialStatePropertyAll(Colors.black54),
  );
}





ColorScheme _colorScheme(ColorScheme base) {
  return base.copyWith(
    background: CustomThemeProp.white,
    primary: CustomThemeProp.violetFirm,
    secondary: CustomThemeProp.grayLight,
    primaryContainer: CustomThemeProp.violetFirm,
    secondaryContainer: CustomThemeProp.grayLight,
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
  useMaterial3: true,

  appBarTheme: _appBarTheme(_theme.appBarTheme),

  colorScheme: _colorScheme(_theme.colorScheme),
  primaryColorLight: CustomThemeProp.violetFirm,
  primaryColorDark: CustomThemeProp.violetFirm,
  scaffoldBackgroundColor: Colors.white,


  bottomNavigationBarTheme: _bottomNavigationBarThemeData(_theme.bottomNavigationBarTheme),

  textTheme: CustomThemeProp.bwTheme
      ?_textLight(_theme.textTheme)
      :_textBlack(_theme.textTheme),








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

  iconTheme: _theme.iconTheme.copyWith(
    // color: Colors.deepOrange[100],
  ),
);
