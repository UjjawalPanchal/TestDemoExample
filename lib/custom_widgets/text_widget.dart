/*
* Created by ujjawal on 04/02/26.
*/

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? tColor;

  const TextWidget(this.text, {super.key, this.textStyle, this.textSize, this.fontWeight, this.tColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? TextStyle(fontWeight: fontWeight, fontSize: textSize, color: tColor),
    );
  }
}
