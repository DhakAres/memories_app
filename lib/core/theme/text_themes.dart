import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memories_app/core/theme/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_themes.g.dart';

enum FontFamilyNamed { black, bold, semiBold, mediun, regular, light }

final Map<FontFamilyNamed, String> customFontFamily = {
  FontFamilyNamed.black: "Sora-ExtraBold",
  FontFamilyNamed.bold: "Sora-Bold",
  FontFamilyNamed.semiBold: "Sora-SemiBold",
  FontFamilyNamed.mediun: "Sora-Medium",
  FontFamilyNamed.regular: "Sora-Regular",
  FontFamilyNamed.light: "Sora-Light",
};

class AppTextStyles {
  Map<ColorsName, Color> colors;

  AppTextStyles({required this.colors});

  TextStyle black({Color? color, double? size, TextDecoration? decoration}) =>
      TextStyle(
        fontFamily: customFontFamily[FontFamilyNamed.black],
        fontSize: (size ?? 18.0).sp,
        color: color ?? colors[ColorsName.textPrimary],
        decoration: decoration,
      );

  TextStyle bold({
    Color? color,
    double? size,
    bool isUnderline = false,
    Color? decorationColor,
    TextDecoration? decoration,
  }) => TextStyle(
    fontFamily: customFontFamily[FontFamilyNamed.bold],
    fontSize: (size ?? 14.0).sp,
    decoration: decoration ?? (isUnderline ? TextDecoration.underline : null),
    decorationColor: decorationColor,
    color: color ?? colors[ColorsName.textPrimary],
  );

  TextStyle semiBold({
    Color? color,
    double? size,
    TextDecoration? decoration,
  }) => TextStyle(
    fontFamily: customFontFamily[FontFamilyNamed.semiBold],
    fontSize: (size ?? 14.0).sp,
    color: color ?? colors[ColorsName.textPrimary],
    decoration: decoration,
  );

  TextStyle medium({Color? color, double? size, TextDecoration? decoration}) =>
      TextStyle(
        fontFamily: customFontFamily[FontFamilyNamed.mediun],
        fontSize: (size ?? 14.0).sp,
        color: color ?? colors[ColorsName.textPrimary],
        decoration: decoration,
      );

  TextStyle regular({
    Color? color,
    double? size,
    TextDecoration? decoration,
    bool isUnderline = false,
  }) => TextStyle(
    fontFamily: customFontFamily[FontFamilyNamed.regular],
    fontSize: (size ?? 14.0).sp,
    color: color ?? colors[ColorsName.textPrimary],
    decoration: decoration ?? (isUnderline ? TextDecoration.underline : null),
    decorationColor: colors[ColorsName.brandAccent],
  );

  TextStyle light({
    Color? color,
    double? size,
    bool isUnderline = false,
    Color? decorationColor,
    TextDecoration? decoration,
  }) => TextStyle(
    fontFamily: customFontFamily[FontFamilyNamed.light],
    fontSize: (size ?? 14.0).sp,
    color: color ?? colors[ColorsName.textPrimary],
    decoration: decoration ?? (isUnderline ? TextDecoration.underline : null),
    decorationColor: decorationColor,
  );
}

@riverpod
AppTextStyles appTextStyles(Ref ref) {
  return AppTextStyles(colors: ref.watch(colorsStateProvider));
}
