import 'package:flutter/material.dart';

import '../../structure/data/datasources/local/shared_store.dart';
import '../utils/hex_to_color.dart';
import 'app_strings.dart';

class AppColors {

  static late Color appTextFieldBorderColor;
  static late Color appColor;
  static toggleColors(){
    String theme = SharedStore.getTheme();
    appTextFieldBorderColor = theme == AppStrings.dark ? HexColor("#5B3FC8") : HexColor("#5B3FC8");
    appColor = theme == AppStrings.dark ? HexColor("#28BAA3") : HexColor("#28BAA3");
  }
}
