import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/Widgets/build_footer.dart';
import 'package:awesome_side_sheet/Widgets/build_header.dart';
import 'package:flutter/material.dart';

class SideSheet extends StatelessWidget {
  // [body] is the main content of the sheet
  final Widget? body;

  // [header] is the top of the sheet
  final Widget? header;

  // [footer] is the bottom of the sheet
  final Widget? footer;

  // [title] is the title of the sheet and is displayed in the header if [header] is null
  final String? title;

  // [showBackButton] shows a back button in the header if [header] is null
  final bool showBackButton;

  // [showCloseButton] shows a close button in the header if [header] is null
  final bool showCloseButton;

  // [showActions] shows the actions in the footer if [footer] is null
  final bool showActions;

  // [showFooterDivider] shows a divider between the body and footer
  final bool showFooterDivider;

  // [showHeaderDivider] shows a divider between the header and body
  final bool showHeaderDivider;

  // [showSideDivider] shows a divider between the sheet and the screen
  final bool showSideDivider;

  // [safeAreaTop] adds a safe area to the top of the sheet
  final bool safeAreaTop;

  // [safeAreaBottom] adds a safe area to the bottom of the sheet
  final bool safeAreaBottom;

  // [confirmActionText] is the text of the confirm action button in the footer if [footer] is null
  final String confirmActionText;

  // [cancelActionText] is the text of the cancel action button in the footer if [footer] is null
  final String cancelActionText;

  // [sheetWidth] is the width of the sheet
  final double sheetWidth;

  // [borderRadius] is the border radius of the sheet Note: if provided, border line will be set to null
  final double? borderRadius;

  // [confirmActionOnPressed] is the onPressed of the confirm action button in the footer if [footer] is null
  final void Function()? confirmActionOnPressed;

  // [cancelActionOnPressed] is the onPressed of the cancel action button in the footer if [footer] is null
  final void Function()? cancelActionOnPressed;

  // [onClose] is the onPressed of the close button in the header if [header] is null
  final void Function()? onClose;

  // [sheetPosition] is the position of the sheet on the screen (left or right)
  final SheetPosition sheetPosition;

  // [headerPadding] is the padding of the header
  final EdgeInsetsGeometry? headerPadding;

  // [footerPadding] is the padding of the footer
  final EdgeInsetsGeometry? footerPadding;

  // Colors
  final Color? backgroundColor,
      surfaceTintColor,
      textColor,
      iconColor,
      dividerColor,
      confirmButtonBgColor,
      confirmButtonTextColor,
      cancelButtonBgColor,
      cancelButtonTextColor;

  const SideSheet({
    Key? key,
    this.body,
    this.header,
    this.footer,
    this.title,
    required this.showBackButton,
    required this.showActions,
    required this.showFooterDivider,
    required this.showHeaderDivider,
    required this.showSideDivider,
    required this.safeAreaTop,
    required this.safeAreaBottom,
    required this.confirmActionOnPressed,
    required this.cancelActionOnPressed,
    required this.confirmActionText,
    required this.cancelActionText,
    required this.showCloseButton,
    required this.onClose,
    required this.sheetWidth,
    required this.sheetPosition,
    this.borderRadius,
    this.backgroundColor,
    this.surfaceTintColor,
    this.textColor,
    this.iconColor,
    this.dividerColor,
    this.confirmButtonBgColor,
    this.confirmButtonTextColor,
    this.cancelButtonBgColor,
    this.cancelButtonTextColor,
    this.headerPadding,
    this.footerPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      elevation: 0,
      color: backgroundColor ?? colorScheme.surface,
      surfaceTintColor: surfaceTintColor ?? colorScheme.surfaceTint,
      borderRadius: borderRadius == null
          ? null
          : BorderRadius.only(
              topLeft: (sheetPosition == SheetPosition.right)
                  ? Radius.circular(borderRadius ?? 0)
                  : Radius.zero,
              bottomLeft: (sheetPosition == SheetPosition.right)
                  ? Radius.circular(borderRadius ?? 0)
                  : Radius.zero,
              topRight: (sheetPosition == SheetPosition.left)
                  ? Radius.circular(borderRadius ?? 0)
                  : Radius.zero,
              bottomRight: (sheetPosition == SheetPosition.left)
                  ? Radius.circular(borderRadius ?? 0)
                  : Radius.zero,
            ),
      child: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        child: Container(
          decoration: BoxDecoration(
            border: showSideDivider && borderRadius == null
                ? Border(
                    left: BorderSide(
                      width: (sheetPosition == SheetPosition.right) ? 1 : 0,
                      color: dividerColor ??
                          (surfaceTintColor != null
                              ? surfaceTintColor!.withOpacity(0.1)
                              : colorScheme.onSurface.withOpacity(0.1)),
                    ),
                    right: BorderSide(
                      width: (sheetPosition == SheetPosition.left) ? 1 : 0,
                      color: dividerColor ??
                          (surfaceTintColor != null
                              ? surfaceTintColor!.withOpacity(0.1)
                              : colorScheme.onSurface.withOpacity(0.1)),
                    ),
                  )
                : null,
          ),
          constraints: BoxConstraints(
            minWidth: 256,
            maxWidth: size.width <= 600 ? size.width : sheetWidth,
            minHeight: size.height,
            maxHeight: size.height,
          ),
          child: Column(
            children: [
              header ??
                  BuildHeader(
                    title: title,
                    showBackButton: showBackButton,
                    showCloseButton: showCloseButton,
                    onClose: onClose,
                    padding: headerPadding,
                  ),
              showHeaderDivider
                  ? Divider(
                      height: 1,
                      thickness: 0.5,
                      color: dividerColor ??
                          (surfaceTintColor != null
                              ? surfaceTintColor!.withOpacity(0.1)
                              : colorScheme.onSurface.withOpacity(0.1)),
                    )
                  : const SizedBox(),
              Expanded(
                child: body!,
              ),
              showFooterDivider
                  ? Divider(
                      height: 1,
                      thickness: 0.5,
                      color: dividerColor ??
                          (surfaceTintColor != null
                              ? surfaceTintColor!.withOpacity(0.1)
                              : colorScheme.onSurface.withOpacity(0.1)),
                    )
                  : const SizedBox(),
              footer ??
                  BuildFooter(
                    cancelActionOnPressed: cancelActionOnPressed,
                    confirmActionOnPressed: confirmActionOnPressed,
                    padding: footerPadding,
                    confirmActionText: confirmActionText,
                    cancelActionText: cancelActionText,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
