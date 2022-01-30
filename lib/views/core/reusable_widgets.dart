import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightBox extends StatelessWidget {
  final double number;
  const HeightBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: number.h);
  }
}

class WidthBox extends StatelessWidget {
  final double number;
  const WidthBox(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: number.w);
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(),
    );
  }
}
