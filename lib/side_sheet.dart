library side_sheet;

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/build_side_sheet.dart';
import 'package:flutter/material.dart';

Future<void> aweSideSheet({
  required BuildContext context,
  required SheetPosition sheetPosition,
  Widget? body,
  Widget? footer,
  Widget? header,
  String? title,
  bool barrierDismissible = false,
  bool showBackButton = false,
  bool showCloseButton = true,
  bool showActions = true,
  bool showFooterDivider = true,
  bool showHeaderDivider = true,
  bool showSideDivider = true,
  bool safeAreaTop = true,
  bool safeAreaBottom = false,
  String confirmActionText = 'Save',
  String cancelActionText = 'Cancel',
  String? closeButtonTooltip = 'Close',
  String? backButtonTooltip = 'Back',
  void Function()? onConfirm,
  void Function()? onCancel,
  void Function()? onDismiss,
  void Function()? onClose,
  Duration? transitionDuration,
  double sheetWidth = 400,
  double? borderRadius,
}) async {
  await showGeneralDialog(
    context: context,
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 500),
    barrierDismissible: barrierDismissible,
    barrierColor: Theme.of(context).colorScheme.scrim.withOpacity(0.3),
    barrierLabel: 'Material 3 side sheet',
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween(
          begin: (sheetPosition == SheetPosition.right)
              ? const Offset(1, 0)
              : const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      );
    },
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: (sheetPosition == SheetPosition.right)
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: SideSheet(
          sheetPosition: sheetPosition,
          title: title,
          body: body ?? const SizedBox(),
          footer: footer,
          header: header,
          showFooterDivider: showFooterDivider,
          showHeaderDivider: showHeaderDivider,
          showSideDivider: showSideDivider,
          showBackButton: showBackButton,
          showActions: showActions,
          safeAreaTop: safeAreaTop,
          safeAreaBottom: safeAreaBottom,
          confirmActionOnPressed: onConfirm,
          cancelActionOnPressed: onCancel,
          confirmActionText: confirmActionText,
          cancelActionText: cancelActionText,
          showCloseButton: showCloseButton,
          onClose: onClose,
          sheetWidth: sheetWidth,
          borderRadius: borderRadius,
        ),
      );
    },
  ).then(
    (value) {
      if (!barrierDismissible) return;
      onDismiss?.call();
    },
  );
}
