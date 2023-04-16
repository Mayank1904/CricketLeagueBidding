import 'package:flutter/material.dart';

class SkipperText extends StatelessWidget {
  final String text;
  final TextStyle Function(BuildContext) textStyle;
  final Color? color;
  final TextAlign? textAlign;
  final bool? softwrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final Key? keyText;

  const SkipperText._(this.text, this.textStyle,
      {this.color,
      this.textAlign,
      this.softwrap,
      this.overflow,
      this.maxLines,
      this.keyText,
      Key? key})
      : super(key: key);

  SkipperText.header(String text,
      {Color? color,
      TextAlign? textAlign,
      bool? softwrap,
      TextOverflow? overflow,
      int? maxLines,
      Key? keyText,
      Key? key})
      : this._(
            text,
            (c) => TextStyle(
                color: color, fontSize: 20.0, fontWeight: FontWeight.w600),
            textAlign: textAlign,
            softwrap: softwrap,
            overflow: overflow,
            maxLines: maxLines,
            key: key);

  SkipperText.bodySmall(String text,
      {Color? color,
      TextAlign? textAlign,
      bool? softwrap,
      TextOverflow? overflow,
      int? maxLines,
      Key? keyText,
      Key? key})
      : this._(
            text,
            (c) => TextStyle(
                color: color, fontSize: 12.0, fontWeight: FontWeight.w400),
            textAlign: textAlign,
            softwrap: softwrap,
            overflow: overflow,
            maxLines: maxLines,
            key: key);

  SkipperText.textSmall(String text,
      {Color? color,
      TextAlign? textAlign,
      bool? softwrap,
      TextOverflow? overflow,
      int? maxLines,
      Key? keyText,
      Key? key})
      : this._(
            text,
            (c) => TextStyle(
                color: color, fontSize: 10.0, fontWeight: FontWeight.w400),
            textAlign: textAlign,
            softwrap: softwrap,
            overflow: overflow,
            maxLines: maxLines,
            key: key);

  @override
  Widget build(BuildContext context) => Text(
        key: keyText,
        text,
        textAlign: textAlign,
        softWrap: softwrap,
        overflow: overflow,
        maxLines: maxLines,
        style: textStyle(context),
      );
}
