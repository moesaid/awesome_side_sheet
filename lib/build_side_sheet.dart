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

  // [confirmActionOnPressed] is the onPressed of the confirm action button in the footer if [footer] is null
  final void Function()? confirmActionOnPressed;

  // [cancelActionOnPressed] is the onPressed of the cancel action button in the footer if [footer] is null
  final void Function()? cancelActionOnPressed;

  // [onClose] is the onPressed of the close button in the header if [header] is null
  final void Function()? onClose;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      elevation: 1,
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.surfaceTint,
      child: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        child: Container(
          decoration: BoxDecoration(
            border: showSideDivider
                ? Border(
                    left: BorderSide(
                      width: 1,
                      color: colorScheme.onSurface.withOpacity(0.1),
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
              header ?? const BuildHeader(),
              showHeaderDivider
                  ? Divider(
                      height: 1,
                      thickness: 0.5,
                      color: colorScheme.onSurface.withOpacity(0.1),
                    )
                  : const SizedBox(),
              Expanded(
                child: body!,
              ),
              showFooterDivider
                  ? Divider(
                      height: 1,
                      thickness: 0.5,
                      color: colorScheme.onSurface.withOpacity(0.1),
                    )
                  : const SizedBox(),
              footer ??
                  BuildFooter(
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
