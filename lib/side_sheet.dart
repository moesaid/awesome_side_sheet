library side_sheet;

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/build_side_sheet.dart';
import 'package:flutter/material.dart';

Future<void> aweSideSheet({
  // required
  required BuildContext context,
  required SheetPosition sheetPosition,

  // widgets
  Widget? body,
  Widget? footer,
  Widget? header,

  // bools
  bool barrierDismissible = true,
  bool showBackButton = true,
  bool showCloseButton = true,
  bool showActions = true,
  bool showFooterDivider = true,
  bool showHeaderDivider = true,
  bool showSideDivider = true,
  bool safeAreaTop = true,
  bool safeAreaBottom = true,

  // strings
  String confirmActionText = 'Save',
  String cancelActionText = 'Cancel',
  String? closeButtonTooltip = 'Close',
  String? backButtonTooltip = 'Back',
  String? title,

  // duration
  Duration? transitionDuration,

  // doubles
  double sheetWidth = 400,
  double? borderRadius,

  // Colors
  Color? backgroundColor,
  surfaceTintColor,
  textColor,
  iconColor,
  dividerColor,
  confirmButtonBgColor,
  confirmButtonTextColor,
  cancelButtonBgColor,
  cancelButtonTextColor,

  // callbacks
  void Function()? onConfirm,
  void Function()? onCancel,
  void Function()? onDismiss,
  void Function()? onClose,
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
          // enums
          sheetPosition: sheetPosition,
          // strings
          title: title,
          // widgets
          body: body ?? const SizedBox(),
          footer: footer,
          header: header,
          // doubles
          sheetWidth: sheetWidth,
          borderRadius: borderRadius,
          // bools
          showFooterDivider: showFooterDivider,
          showHeaderDivider: showHeaderDivider,
          showSideDivider: showSideDivider,
          showBackButton: showBackButton,
          showActions: showActions,
          safeAreaTop: safeAreaTop,
          safeAreaBottom: safeAreaBottom,
          // callbacks
          confirmActionOnPressed: onConfirm,
          cancelActionOnPressed: onCancel,
          confirmActionText: confirmActionText,
          cancelActionText: cancelActionText,
          showCloseButton: showCloseButton,
          onClose: onClose,
          // Colors
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          textColor: textColor,
          iconColor: iconColor,
          dividerColor: dividerColor,
          confirmButtonBgColor: confirmButtonBgColor,
          confirmButtonTextColor: confirmButtonTextColor,
          cancelButtonBgColor: cancelButtonBgColor,
          cancelButtonTextColor: cancelButtonTextColor,
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
