// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memories_app/app/features/home/presentation/home_states.dart';
import 'package:memories_app/app/shared/presentation/others/full_screen_gallery.dart';
import 'package:memories_app/core/utils/parser.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final memoriesList = ref.watch(homeMemoriesListStateProvider);

    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: memoriesList.length,
      itemBuilder: (context, index) {
        final memory = memoriesList[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                if (index < memoriesList.length - 1)
                  Container(
                    width: 2.w,
                    height: 180.h,
                    color: colorScheme.primary.withOpacity(0.2),
                  ),
              ],
            ),
            SizedBox(width: 16.w),
            // Card content
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Parser.formatDateDDMMAA(memory.createdAt),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Imágenes horizontales
                    SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: memory.imageUrls.length,
                        itemBuilder: (context, imgIndex) {
                          return Container(
                            width: 100.w,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: colorScheme.primary.withOpacity(0.05),
                            ),
                            child: GestureDetector(
                              onTap:
                                  () => _openGallery(
                                    context,
                                    memory.imageUrls,
                                    imgIndex,
                                  ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                // ==================== OPCIÓN 1: SHIMMER (ACTIVO) ====================
                                // child: CachedNetworkImage(
                                //   imageUrl: memory.imageUrls[imgIndex],
                                //   fit: BoxFit.cover,
                                //   placeholder:
                                //       (context, url) => Shimmer.fromColors(
                                //         baseColor: colorScheme.primary
                                //             .withOpacity(0.1),
                                //         highlightColor: colorScheme.primary
                                //             .withOpacity(0.2),
                                //         child: Container(color: Colors.white),
                                //       ),
                                //   errorWidget:
                                //       (context, url, error) => Icon(
                                //         Icons.image,
                                //         color: colorScheme.primary.withOpacity(
                                //           0.3,
                                //         ),
                                //       ),
                                // ),

                                // ==================== OPCIÓN 2: SKELETONIZER (COMENTADO) ====================
                                child: CachedNetworkImage(
                                  imageUrl: memory.imageUrls[imgIndex],
                                  fit: BoxFit.cover,
                                  placeholder:
                                      (context, url) => Skeletonizer(
                                        enabled: true,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: colorScheme.primary
                                                .withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) => Icon(
                                        Icons.image,
                                        color: colorScheme.primary.withOpacity(
                                          0.3,
                                        ),
                                      ),
                                ),

                                // ==================== OPCIÓN 3: FLUTTER_SPINKIT (COMENTADO) ====================
                                // child: CachedNetworkImage(
                                //   imageUrl: memory.imageUrls[imgIndex],
                                //   fit: BoxFit.cover,
                                //   placeholder:
                                //       (context, url) => Container(
                                //         color: colorScheme.primary.withOpacity(
                                //           0.05,
                                //         ),
                                //         child: Center(
                                //           child: SpinKitFadingCircle(
                                //             color: colorScheme.primary,
                                //             size: 30.sp,
                                //           ),
                                //         ),
                                //       ),
                                //   errorWidget:
                                //       (context, url, error) => Icon(
                                //         Icons.image,
                                //         color: colorScheme.primary.withOpacity(
                                //           0.3,
                                //         ),
                                //       ),
                                // ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      memory.description,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
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
  // ==================== OPCIÓN 6: STAGGERED GRID CON OVERLAY ====================
  // Grid desordenado con info sobre la imagen
  // Widget _option6(BuildContext context, List<Map<String, dynamic>> memories) {
  //   final theme = Theme.of(context);
  //   final colorScheme = theme.colorScheme;

  //   return GridView.builder(
  //     padding: EdgeInsets.all(12.w),
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 12.w,
  //       mainAxisSpacing: 12.h,
  //       childAspectRatio: 0.7,
  //     ),
  //     itemCount: memories.length,
  //     itemBuilder: (context, index) {
  //       final memory = memories[index];
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(20.r),
  //         child: Stack(
  //           fit: StackFit.expand,
  //           children: [
  //             // Imagen de fondo
  //             Image.network(
  //               memory['images'][0],
  //               fit: BoxFit.cover,
  //               errorBuilder:
  //                   (_, __, ___) => Container(
  //                     color: colorScheme.primary.withOpacity(0.1),
  //                     child: Icon(
  //                       Icons.image,
  //                       size: 48.sp,
  //                       color: colorScheme.primary.withOpacity(0.3),
  //                     ),
  //                   ),
  //             ),
  //             // Gradiente overlay
  //             Container(
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter,
  //                   colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
  //                 ),
  //               ),
  //             ),
  //             // Info
  //             Positioned(
  //               bottom: 0,
  //               left: 0,
  //               right: 0,
  //               child: Padding(
  //                 padding: EdgeInsets.all(16.w),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.calendar_today,
  //                           size: 12.sp,
  //                           color: Colors.white.withOpacity(0.8),
  //                         ),
  //                         SizedBox(width: 6.w),
  //                         Text(
  //                           memory['date'],
  //                           style: theme.textTheme.labelSmall?.copyWith(
  //                             color: Colors.white.withOpacity(0.8),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 8.h),
  //                     Text(
  //                       memory['description'],
  //                       style: theme.textTheme.bodySmall?.copyWith(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     if (memory['images'].length > 1) ...[
  //                       SizedBox(height: 8.h),
  //                       Container(
  //                         padding: EdgeInsets.symmetric(
  //                           horizontal: 8.w,
  //                           vertical: 4.h,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: Colors.white.withOpacity(0.2),
  //                           borderRadius: BorderRadius.circular(12.r),
  //                         ),
  //                         child: Text(
  //                           '+${memory['images'].length - 1}',
  //                           style: theme.textTheme.labelSmall?.copyWith(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // ==================== OPCIÓN 8: MINIMAL BLUR BACKGROUND ====================
  // Cards minimalistas con fondo blur de la imagen
  // Widget _option8(BuildContext context, List<Map<String, dynamic>> memories) {
  //   final theme = Theme.of(context);
  //   final colorScheme = theme.colorScheme;

  //   return ListView.builder(
  //     padding: EdgeInsets.all(20.w),
  //     itemCount: memories.length,
  //     itemBuilder: (context, index) {
  //       final memory = memories[index];
  //       return Container(
  //         margin: EdgeInsets.only(bottom: 24.h),
  //         height: 200.h,
  //         child: Stack(
  //           children: [
  //             // Fondo blur
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(24.r),
  //                 color: colorScheme.primary.withOpacity(0.05),
  //               ),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(24.r),
  //                 child: Stack(
  //                   fit: StackFit.expand,
  //                   children: [
  //                     Image.network(
  //                       memory['images'][0],
  //                       fit: BoxFit.cover,
  //                       errorBuilder: (_, __, ___) => Container(),
  //                     ),
  //                     Container(color: colorScheme.surface.withOpacity(0.85)),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             // Contenido
  //             Padding(
  //               padding: EdgeInsets.all(20.w),
  //               child: Row(
  //                 children: [
  //                   // Miniatura
  //                   Container(
  //                     width: 120.w,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(16.r),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: colorScheme.primary.withOpacity(0.2),
  //                           blurRadius: 16,
  //                           offset: const Offset(0, 4),
  //                         ),
  //                       ],
  //                     ),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(16.r),
  //                       child: Image.network(
  //                         memory['images'][0],
  //                         fit: BoxFit.cover,
  //                         errorBuilder:
  //                             (_, __, ___) => Container(
  //                               color: colorScheme.primary.withOpacity(0.1),
  //                               child: Icon(
  //                                 Icons.image,
  //                                 color: colorScheme.primary,
  //                               ),
  //                             ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(width: 20.w),
  //                   // Info
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           memory['date'],
  //                           style: theme.textTheme.labelLarge?.copyWith(
  //                             color: colorScheme.primary,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                         SizedBox(height: 8.h),
  //                         Text(
  //                           memory['description'],
  //                           style: theme.textTheme.bodyMedium,
  //                           maxLines: 4,
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                         if (memory['images'].length > 1) ...[
  //                           SizedBox(height: 12.h),
  //                           Row(
  //                             children: List.generate(
  //                               memory['images'].length.clamp(0, 3),
  //                               (i) => Container(
  //                                 margin: EdgeInsets.only(right: 4.w),
  //                                 width: 6.w,
  //                                 height: 6.h,
  //                                 decoration: BoxDecoration(
  //                                   color: colorScheme.primary,
  //                                   shape: BoxShape.circle,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
