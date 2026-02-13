// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:memories_app/app/features/memories/presentation/memory_controller.dart';
import 'package:memories_app/app/features/memories/presentation/memory_states.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/action_dialog.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/alerts.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/spinner.dart';
import 'package:memories_app/app/shared/presentation/components/dividers/main_divider.dart';
import 'package:memories_app/app/shared/presentation/others/full_screen_gallery.dart';

class MemoryContent extends ConsumerWidget {
  const MemoryContent({super.key});

  Future<void> _executeRegistration(BuildContext context, WidgetRef ref) async {
    ref.read(spinnerStateProvider.notifier).show();
    final response =
        await ref.read(memoryControllerProvider).executeRegistration();
    ref.read(spinnerStateProvider.notifier).hide();

    if (response.success) {
      context.pop();
    } else {
      Alerts.getDialog(
        context,
        ActionDialog(
          type: AlertType.error,
          title: "Error",
          subTitle: response.message,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textScheme = theme.textTheme;
    final selectedImages = ref.watch(selectedImagesProvider);
    final description = ref.watch(memoryDescriptionProvider);

    final isValid = selectedImages.isNotEmpty && description.trim().isNotEmpty;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tu Moodboard',
                style: textScheme.headlineLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
              // Botón Listo primero
              InkWell(
                onTap:
                    isValid
                        ? () {
                          _executeRegistration(context, ref);
                        }
                        : null,
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isValid
                            ? colorScheme.primary
                            : colorScheme.onSurface.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16.sp,
                        color:
                            isValid
                                ? colorScheme.onPrimary
                                : colorScheme.onSurface.withOpacity(0.38),
                      ),
                      MainDivider(width: 6),
                      Text(
                        'Listo',
                        style: textScheme.labelMedium?.copyWith(
                          color:
                              isValid
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurface.withOpacity(0.38),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MainDivider(height: 8),
          // Subtítulo y badge de fotos
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Captura el momento en imágenes',
                  style: textScheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ),
              MainDivider(width: 8),
              // Badge con contador de fotos
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color:
                      selectedImages.isEmpty
                          ? colorScheme.onSurface.withOpacity(0.08)
                          : colorScheme.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${selectedImages.length} foto${selectedImages.length != 1 ? 's' : ''}',
                  style: textScheme.labelMedium?.copyWith(
                    color:
                        selectedImages.isEmpty
                            ? colorScheme.onSurface.withOpacity(0.5)
                            : colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          MainDivider(height: 28),
          if (selectedImages.isEmpty)
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: colorScheme.surface, // Blanco puro
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.collections_outlined,
                        size: 32.sp,
                        color: colorScheme.primary.withOpacity(0.6),
                      ),
                    ),
                    MainDivider(height: 16),
                    Text(
                      'Agrega tus fotos',
                      style: textScheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.8,
              ),
              itemCount: selectedImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withOpacity(0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        onTap:
                            () => _openGallery(
                              context,
                              selectedImages.map((e) => e.path).toList(),
                              index,
                            ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            selectedImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Botón para eliminar
                    Positioned(
                      top: 4.h,
                      right: 4.w,
                      child: GestureDetector(
                        onTap:
                            () => ref
                                .read(selectedImagesProvider.notifier)
                                .removeImage(index),
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          MainDivider(height: 24),

          // Texto en card blanca
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: TextField(
              onChanged:
                  (value) => ref
                      .read(memoryDescriptionProvider.notifier)
                      .updateDescription(value),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Describe este momento...',
                border: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.all(8.w),
                hintStyle: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.35),
                ),
              ),
              style: textScheme.bodyMedium,
            ),
          ),
          MainDivider(height: 24),

          // Botones refinados
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed:
                      () =>
                          ref
                              .read(selectedImagesProvider.notifier)
                              .pickFromCamera(),
                  icon: Icon(Icons.camera_alt_outlined, size: 20.sp),
                  label: const Text('Cámara'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              MainDivider(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed:
                      () =>
                          ref
                              .read(selectedImagesProvider.notifier)
                              .pickFromGallery(),
                  icon: Icon(Icons.photo_library_outlined, size: 20.sp),
                  label: const Text('Galería'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    elevation: 0,
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openGallery(
    BuildContext context,
    List<String> imageUrls,
    int initialIndex,
  ) {
    if (imageUrls.isEmpty) return;

    final safeIndex = initialIndex.clamp(0, imageUrls.length - 1).toInt();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) =>
                FullScreenGallery(images: imageUrls, initialIndex: safeIndex),
      ),
    );
  }
}
