// ignore_for_file: unreachable_switch_default

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memories_app/app/shared/presentation/components/chips/primary_chip.dart';
import 'package:memories_app/app/shared/presentation/components/chips/secondary_chip.dart';
import 'package:memories_app/core/theme/app_colors.dart';

class ActionDialog extends ConsumerWidget {
  const ActionDialog({
    super.key,
    required this.type,
    required this.title,
    required this.subTitle,
    this.doubleButton = false,
    this.aceptText,
    this.cancelText,
    this.onTapAcept,
    this.onTapCancel,
  });
  final AlertType type;
  final String title;
  final String subTitle;
  final bool doubleButton;
  final String? aceptText;
  final String? cancelText;
  final void Function()? onTapAcept;
  final void Function()? onTapCancel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: colors[ColorsName.surfaceWhite],
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage(switchImage()), width: 60.0),
          const SizedBox(height: 10.0),
          SizedBox(
            // width: MediaQuery.of(context).size.width * factorWidth,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...() {
            if (subTitle.trim() != "") {
              return [
                const SizedBox(height: 5.0),
                SizedBox(
                  // width: MediaQuery.of(context).size.width * factorWidth,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
              ];
            }
            return [];
          }(),
          const SizedBox(height: 20.0),
          doubleButton
              ? SizedBox(
                // width: MediaQuery.of(context).size.width * factorWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: SecondaryChip(
                        label: cancelText ?? "Cancelar",
                        onTap: onTapCancel,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: PrimaryChip(
                        label: aceptText ?? "Aceptar",
                        onTap: onTapAcept,
                      ),
                    ),
                  ],
                ),
              )
              : SizedBox(
                child: PrimaryChip(
                  label: aceptText ?? "Aceptar",
                  onTap: onTapAcept ?? () => Navigator.pop(context),
                ),
              ),
        ],
      ),
    );
  }

  String switchImage() {
    switch (type) {
      case AlertType.error:
        return "assets/icons/error_ico.png";
      case AlertType.success:
        return "assets/icons/succes_ico.png";
      case AlertType.warning:
        return "assets/icons/warning_ico.png";
      default:
        return "assets/icons/error_ico.png";
    }
  }
}

enum AlertType { error, success, warning }
