import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/core/theme/app_colors.dart';

class PrimaryDialog extends StatelessWidget {
  const PrimaryDialog({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final colors = ref.watch(colorsStateProvider);
        return Dialog(
          backgroundColor: colors[ColorsName.surfaceWhite],
          insetPadding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: child,
        );
      },
    );
  }
}
