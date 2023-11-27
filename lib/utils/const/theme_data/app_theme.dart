import 'package:flutter/material.dart';

import 'color.dart';
import 'my_text_style.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: MyTextStyle.appBarText,
        backgroundColor: AppColor.appBarColor,
        iconTheme: IconThemeData(color: AppColor.iconColor),
        centerTitle: true,
      ),
      iconTheme: IconThemeData(color:AppColor.iconColor,size: 30 ),
      brightness: Brightness.light,
      cardColor: AppColor.cardColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(textStyle: MaterialStatePropertyAll(MyTextStyle.bodySmallText),
              backgroundColor: MaterialStatePropertyAll(AppColor.buttonColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))))),
      cardTheme: CardTheme(color: AppColor.cardColor,elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      textTheme: TextTheme(
          bodyLarge: MyTextStyle.bodyLargeText,
          bodySmall: MyTextStyle.bodySmallText,
          bodyMedium: MyTextStyle.bodyMediumText),
      floatingActionButtonTheme: FloatingActionButtonThemeData(iconSize: 20,
          backgroundColor: AppColor.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
      ,
  );
}
