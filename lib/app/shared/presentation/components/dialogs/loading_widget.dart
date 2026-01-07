import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:memories_app/core/theme/app_colors.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return LoadingAnimationWidget.inkDrop(
      color: color ?? colors[ColorsName.surfaceWhite]!,
      size: 60.0,
    );
  }
}
