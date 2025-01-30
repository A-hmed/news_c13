import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/resourses/color_manger.dart';

class ThemeManger {
 static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
        primaryColor: ColorManger.white


  );


 static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorManger.black
  );


}