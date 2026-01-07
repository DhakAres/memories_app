import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDivider extends StatelessWidget {
  const MainDivider({super.key, this.width, this.height = 5.0});
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width?.w,
    );
  }
}
