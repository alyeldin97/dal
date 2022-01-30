import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_template/configs/constants/fonts.dart';

class PrimaryTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const PrimaryTextRegular(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.primaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.regular,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle primaryFontRegularTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.regular,
      color: color ?? Colors.black);
}

class PrimaryTextLight extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  final TextOverflow? overflow;
  const PrimaryTextLight(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.overflow,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        overflow: overflow,
        fontFamily: FontsConstants.primaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.light,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle primaryFontLightTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.light,
      color: color ?? Colors.black);
}

class PrimaryTextMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const PrimaryTextMedium(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.primaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.medium,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle primaryFontMediumTextStyle(double fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.medium,
      color: color ?? Colors.black);
}

class PrimaryTextSemiBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const PrimaryTextSemiBold(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.primaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.semiBold,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle primaryFontSemiBoldTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.semiBold,
      color: color ?? Colors.black);
}

class PrimaryTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const PrimaryTextBold(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.primaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.bold,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle primaryFontBoldTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.bold,
      color: color ?? Colors.black);
}


class SecondaryTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const SecondaryTextRegular(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.secondaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.regular,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle secondaryFontRegularTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.regular,
      color: color ?? Colors.black);
}

class SecondaryTextLight extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const SecondaryTextLight(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.secondaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.light,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle secondaryFontLightTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.light,
      color: color ?? Colors.black);
}

class SecondaryTextMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const SecondaryTextMedium(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.secondaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.medium,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle secondaryFontMediumTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.medium,
      color: color ?? Colors.black);
}

class SecondaryTextSemiBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const SecondaryTextSemiBold(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.secondaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.semiBold,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle secondaryFontSemiBoldTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.semiBold,
      color: color ?? Colors.black);
}

class SecondaryTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool? isLineThrough;
  final bool? isCenter;
  final int? maxLines;
  const SecondaryTextBold(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.color,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: FontsConstants.secondaryFont,
        fontSize: fontSize.sp,
        fontWeight: FontWeighConstants.bold,
        color: color ?? Colors.black,
        decoration:
            isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

TextStyle secondaryFontBoldTextStyle(fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.bold,
      color: color ?? Colors.black);
}
