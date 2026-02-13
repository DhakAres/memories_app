import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memories_app/app/features/home/presentation/home_view.dart';
import 'package:memories_app/app/features/memories/presentation/memory_view.dart';
import 'package:memories_app/app/features/splash/presentation/splash_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutesNamed {
  static const splashRoute = "/splash";
  static const homeRoute = "/home";
  static const createMemoryRoute = "/createMemory";
  // static const clientHomeRoute = "/clientHome";
  // static const adminHomeRoute = "/adminHome";
  // static const authLoginRoute = "/authLogin";
  // static const authRegisterRoute = "/authRegister";
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutesNamed.splashRoute,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutesNamed.splashRoute,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: AppRoutesNamed.homeRoute,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: AppRoutesNamed.createMemoryRoute,
        builder: (context, state) {
          return const MemoryView();
        },
      ),
      // GoRoute(
      //   path: AppRoutesNamed.adminHomeRoute,
      //   builder: (context, state) {
      //     return const AdminHomeView();
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutesNamed.authLoginRoute,
      //   builder: (context, state) {
      //     return const AuthView();
      //   },
      // ),
      // GoRoute(
      //   path: AppRoutesNamed.authRegisterRoute,
      //   builder: (context, state) {
      //     return const RegisterForm();
      //   },
      // ),
    ],
  );
}
