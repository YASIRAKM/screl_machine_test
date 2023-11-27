import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class MyTextStyle {
  static TextStyle appBarText =
      GoogleFonts.roboto(color: AppColor.appBarTextColor, fontSize: 35);
  static TextStyle bodySmallText =
      GoogleFonts.roboto(color: AppColor.bodyTextColor);
  static TextStyle bodyMediumText =
      GoogleFonts.abel(color: AppColor.bodyTextColor, fontSize: 25);
  static TextStyle txtTextStyle =
      GoogleFonts.abel(color: AppColor.appBarColor, fontSize: 25);
  static TextStyle bodyLargeText =
      GoogleFonts.roboto(color: AppColor.bodyTextColor, fontSize: 35);
}
