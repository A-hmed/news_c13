import 'package:flutter/material.dart';

class AppTextStyle {
static TextStyle generalTextStyle ({Color? color,FontWeight? fontWeight , double? fontSize}){
  return TextStyle(color: color,fontWeight: fontWeight??FontWeight.w500,fontSize:fontSize??20 );
}
}