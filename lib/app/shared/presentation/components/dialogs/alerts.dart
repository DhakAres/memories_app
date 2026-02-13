import 'package:flutter/material.dart';
import 'package:memories_app/app/shared/presentation/components/dialogs/primary_dialog.dart';

class Alerts {
  static Future<void> getDialog(
    BuildContext context,
    Widget child, {
    bool? barrierDismissible,
  }) async {
    showDialog(
      barrierDismissible: barrierDismissible ?? false,
      context: context,
      builder: ((context) => PrimaryDialog(child: child)),
    );
  }

  static Future<void> showBottomSheet(
    BuildContext context, {
    required Widget child,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return child;
          },
        );
      },
    );
  }

  // static Future<void> showBottomSheet(
  //   BuildContext context, {
  //   required Widget content,
  //   bool isDismissible = true,
  //   bool isScrollControlled = false,
  // }) async {
  //   await showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: isScrollControlled,
  //     context: context,
  //     elevation: 0.0,
  //     isDismissible: isDismissible,
  //     builder: (context) {
  //       return Consumer(builder: (context, ref, _) {
  //         final colors = ref.watch(colorsStateProvider);
  //         return SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: const BorderRadius.only(
  //                 topLeft: Radius.circular(16.0),
  //                 topRight: Radius.circular(16.0),
  //               ),
  //               color: colors[ColorsName.whiteBg],
  //             ),
  //             padding: EdgeInsets.only(
  //                 bottom: MediaQuery.of(context).viewInsets.bottom, top: 3.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     SizedBox(width: 33.w, height: 6.h),
  //                     Container(
  //                       width: 33.w,
  //                       height: 6.h,
  //                       margin: EdgeInsets.only(bottom: 10.h),
  //                       decoration: BoxDecoration(
  //                         color: const Color.fromRGBO(213, 243, 255, 1),
  //                         borderRadius: BorderRadius.circular(10.r),
  //                       ),
  //                     ),
  //                     IconWrapper(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: const Icon(Icons.close,
  //                             color: Colors.transparent))
  //                   ],
  //                 ),
  //                 Container(
  //                   width: double.infinity,
  //                   padding: const EdgeInsets.symmetric(
  //                     horizontal: 25.0,
  //                   ),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SafeArea(child: content),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }
}
