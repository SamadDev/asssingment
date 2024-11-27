// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme.dart';

TextStyle textStyle(
  context, {
  Color? color = kcWhite,
  double? fontSize = 14,
  double? fontSizeSmaller960px,
  FontWeight? fontWeight = FontWeight.normal,
  TextDecoration? decoration,
  TextAlign? textAlign,
  int? maxLines,
  double? height,
}) {
  return GoogleFonts.lato(
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    fontSize: fontSize,
    height: height,
  );
}

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? height;
  const TextWidget(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.decoration,
    this.maxLines,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = textStyle(
      context,
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: fontWeight,
      textAlign: textAlign,
      height: height,
    );

    return Text(
      text,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: style,
      textAlign: textAlign,
    );
  }
}
