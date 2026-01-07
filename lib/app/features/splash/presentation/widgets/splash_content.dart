// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memories_app/app/shared/presentation/components/dividers/main_divider.dart';
import 'package:memories_app/core/utils/constant.dart';
import 'package:memories_app/core/utils/sizes.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorScheme.background, colorScheme.surface],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          // Foto estilo polaroid
          Transform.rotate(
            angle: -0.05,
            child: Container(
              width: 240.w,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.radiusSmall),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Imagen
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.radiusSmall),
                    child: Image.asset(
                      'assets/images/collage_3.png',
                      width: 208.w,
                      height: 208.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MainDivider(height: 50),
          // Título
          Text(
            kAppName,
            textAlign: TextAlign.center,
            style: textTheme.displayLarge?.copyWith(
              fontSize: 40.sp,
              color: colorScheme.primary,
            ),
          ),
          MainDivider(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              'Cada foto cuenta una historia',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: EdgeInsets.only(bottom: 100.h, left: 30.w, right: 30.w),
            child: LinearProgressIndicator(
              backgroundColor: colorScheme.primary.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
