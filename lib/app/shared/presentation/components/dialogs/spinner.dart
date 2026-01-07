// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/loading_widget.dart';
import 'package:memories_app/core/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spinner.g.dart';

@riverpod
class SpinnerState extends _$SpinnerState {
  @override
  void build() {}

  void show() {
    try {
      final mainContext =
          ref
              .read(appRouterProvider)
              .routerDelegate
              .navigatorKey
              .currentContext;
      showDialog(
        context: mainContext!,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(child: LoadingWidget()),
          );
        },
        barrierDismissible: false,
      );
    } catch (e) {
      // ignore errors
    }
  }

  void hide() {
    try {
      final mainContext =
          ref
              .read(appRouterProvider)
              .routerDelegate
              .navigatorKey
              .currentContext;
      Navigator.pop(mainContext!);
    } catch (e) {
      // ignore errors
    }
  }
}
