// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memories_app/core/theme/app_colors.dart';
import 'package:memories_app/core/theme/text_themes.dart';

/// Este theme define estilos para todos los componentes comunes:
/// AppBar, Buttons, Inputs, Cards, Text, Icons, etc.
ThemeData appTheme(
  BuildContext context,
  Map<ColorsName, Color> colors,
  AppTextStyles textStyles,
) {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: colors[ColorsName.brandPrimary]!,
    onPrimary: colors[ColorsName.textOnBrand]!,
    secondary: colors[ColorsName.brandAccent]!,
    onSecondary: colors[ColorsName.textOnBrand]!,
    surface: colors[ColorsName.surfaceWhite]!,
    onSurface: colors[ColorsName.textPrimary]!,
    background: colors[ColorsName.backgroundLight]!,
    onBackground: colors[ColorsName.textPrimary]!,
    error: colors[ColorsName.error]!,
    onError: colors[ColorsName.textOnBrand]!,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,

    // Selección de texto (cursor y selección en TextField)
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primary.withOpacity(0.25),
      selectionHandleColor: colorScheme.primary,
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 24.sp),
    ),

    // Cards y superficies elevadas
    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
    ),

    // Botones elevados (principales)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    ),

    // Botones outline (secundarios)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        side: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
    ),

    // Botones de texto
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
    ),

    // Inputs y campos de texto
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: colorScheme.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      labelStyle: Theme.of(context).textTheme.labelLarge,
      hintStyle: Theme.of(context).textTheme.bodySmall,
    ),

    // FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),

    // Iconos
    iconTheme: IconThemeData(color: colorScheme.primary, size: 24.sp),

    // Dividers
    dividerTheme: DividerThemeData(
      color: colorScheme.onSurface.withOpacity(0.2),
      thickness: 1,
      space: 16.h,
    ),

    // Navigation Bar (Material 3)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary.withOpacity(0.15),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color:
              selected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withOpacity(0.7),
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return selected
            ? textStyles.medium(size: 12).copyWith(color: colorScheme.primary)
            : textStyles
                .regular(size: 12)
                .copyWith(color: colorScheme.onSurface.withOpacity(0.7));
      }),
    ),

    // TabBar
    tabBarTheme: TabBarThemeData(
      indicatorColor: colorScheme.primary,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurface.withOpacity(0.7),
      labelStyle: textStyles.semiBold(size: 14),
      unselectedLabelStyle: textStyles.regular(size: 14),
      dividerColor: colorScheme.onSurface.withOpacity(0.2),
    ),

    // SnackBar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.surface,
      contentTextStyle: TextStyle(color: colorScheme.onSurface),
      actionTextColor: colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    ),

    // Dialogs
    dialogTheme: DialogThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      titleTextStyle: textStyles.semiBold(size: 18),
      contentTextStyle: textStyles.regular(size: 14),
    ),

    // Tooltip
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15.r),
      ),
      textStyle: TextStyle(color: colorScheme.surface, fontSize: 12.sp),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
    ),

    // ListTile
    listTileTheme: ListTileThemeData(
      iconColor: colorScheme.primary,
      textColor: colorScheme.onSurface,
      titleTextStyle: textStyles.regular(size: 16),
      subtitleTextStyle: textStyles
          .regular(size: 12)
          .copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
      selectedColor: colorScheme.primary,
      selectedTileColor: colorScheme.primary.withOpacity(0.08),
    ),

    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 4,
      modalElevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
      ),
      clipBehavior: Clip.antiAlias,
    ),

    // Bottom Navigation Bar (compatibilidad amplia)
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(0.7),
      selectedIconTheme: IconThemeData(color: colorScheme.primary),
      unselectedIconTheme: IconThemeData(
        color: colorScheme.onSurface.withOpacity(0.7),
      ),
      selectedLabelStyle: textStyles.medium(size: 12),
      unselectedLabelStyle: textStyles.regular(size: 12),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // Checkbox, Radio, Switch (controles de selección)
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return colorScheme.onSurface.withOpacity(0.6);
      }),
      checkColor: WidgetStateProperty.all<Color>(colorScheme.onPrimary),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return colorScheme.onSurface.withOpacity(0.6);
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return selected ? colorScheme.onPrimary : colorScheme.onSurface;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return selected
            ? colorScheme.primary
            : colorScheme.onSurface.withOpacity(0.4);
      }),
    ),

    // Progress Indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.onSurface.withOpacity(0.2),
      refreshBackgroundColor: colorScheme.surface,
    ),

    // Text theme general (usando AppTextStyles - fuente Sora)
    textTheme: TextTheme(
      displayLarge: textStyles.black(size: 24),
      displayMedium: textStyles.black(size: 20),
      displaySmall: textStyles.black(size: 18),
      headlineLarge: textStyles.semiBold(size: 18),
      headlineMedium: textStyles.semiBold(size: 16),
      headlineSmall: textStyles.semiBold(size: 14),
      titleLarge: textStyles.semiBold(size: 16),
      titleMedium: textStyles.regular(size: 14),
      titleSmall: textStyles.regular(size: 12),
      bodyLarge: textStyles.regular(size: 14),
      bodyMedium: textStyles.regular(size: 13),
      bodySmall: textStyles.regular(size: 11),
      labelLarge: textStyles.medium(size: 12),
      labelMedium: textStyles.medium(size: 11),
      labelSmall: textStyles.medium(size: 10),
    ),
  );
}
