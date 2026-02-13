import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/core/theme/app_colors.dart';

class PrimaryChip extends ConsumerWidget {
  const PrimaryChip({super.key, required this.label, required this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      height: 35.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors[ColorsName.brandPrimary],
        border: Border.all(color: colors[ColorsName.brandPrimary]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: colors[ColorsName.surfaceWhite],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
