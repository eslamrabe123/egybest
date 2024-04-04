import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textOverflow,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final int? maxLines;
  // final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow ?? TextOverflow.ellipsis,
      softWrap: true,
      maxLines: maxLines ?? 2,

      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 19,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0.15,

        color: color ?? Colors.black,

      ),
    );
  }
}
