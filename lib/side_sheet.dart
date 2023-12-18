library side_sheet;

import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/build_side_sheet.dart';
import 'package:flutter/material.dart';

/// Displays a side sheet dialog with customizable options.
///
/// The [aweSideSheet] function displays a side sheet dialog with various customizable options such as the sheet position,
/// widgets for the body, footer, and header, bool values to control the visibility of certain elements, strings for
/// confirm and cancel action texts, duration for the transition animation, dimensions for the sheet width and border radius,
/// colors for different UI elements, and callback functions for various events.
///
/// The [context] parameter is required and specifies the build context for the dialog.
/// The [sheetPosition] parameter is required and specifies the position of the side sheet (either left or right).
///
/// The [body], [footer], and [header] parameters are optional and allow you to provide custom widgets for the corresponding sections of the side sheet.
///
/// The bool parameters such as [barrierDismissible], [showBackButton], [showCloseButton], [showActions], [showFooterDivider],
/// [showHeaderDivider], [showSideDivider], [safeAreaTop], and [safeAreaBottom] control the visibility and behavior of certain elements in the side sheet.
///
/// The string parameters [confirmActionText], [cancelActionText], and [title] allow you to customize the text displayed in the side sheet.
///
/// The [transitionDuration] parameter allows you to specify the duration of the transition animation when showing or hiding the side sheet.
///
/// The [sheetWidth] parameter determines the width of the side sheet, while the [borderRadius] parameter allows you to specify the border radius of the side sheet.
///
/// The color parameters such as [backgroundColor], [surfaceTintColor], [textColor], [iconColor], [dividerColor], [confirmButtonBgColor],
/// [confirmButtonTextColor], [cancelButtonBgColor], and [cancelButtonTextColor] allow you to customize the colors of different UI elements in the side sheet.
///
/// The callback parameters such as [onConfirm], [onCancel], [onDismiss], and [onClose] allow you to specify custom behavior for various events in the side sheet.
///
/// Example usage:
/// ```dart
/// aweSideSheet(
///   context: context,
///   sheetPosition: SheetPosition.right,
///   body: Container(
///     child: Text('This is the body of the side sheet'),
///   ),
///   title: 'Side Sheet',
///   onConfirm: () {
///     // Perform save action
///   },
///   onCancel: () {
///     // Perform cancel action
///   },
/// );
/// ```

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
