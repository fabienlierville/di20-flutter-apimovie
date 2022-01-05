import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(String value,{textAlign: TextAlign.center, color: Colors.indigo, fontSize:15.0, fontStyle: FontStyle.normal, overFlow: TextOverflow.visible}):
    super(
          value,
        textAlign: textAlign,
        overflow: overFlow,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle
        )
      )
  ;

}