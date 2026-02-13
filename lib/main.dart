import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memories_app/core/routes/app_router.dart';
import 'package:memories_app/core/theme/app_colors.dart';
import 'package:memories_app/core/theme/app_theme.dart';
import 'package:memories_app/core/theme/text_themes.dart';
import 'package:memories_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final colors = ref.watch(colorsStateProvider);
    final textStyles = ref.watch(appTextStylesProvider);

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) {
        return MaterialApp.router(
          // builder: (context, child) {
          //   return MediaQuery(
          //     data: MediaQuery.of(
          //       context,
          //     ).copyWith(textScaler: const TextScaler.linear(1.0)),
          //     child: child!,
          //   );
          // },
          title: 'memories_appDAVID',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: appTheme(context, colors, textStyles),
        );
      },
    );
  }
}
