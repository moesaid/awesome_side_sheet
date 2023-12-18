import 'package:awesome_side_sheet/Widgets/build_footer.dart';
import 'package:awesome_side_sheet/Widgets/build_header.dart';
import 'package:flutter/material.dart';

class SideSheet extends StatelessWidget {
  final Widget? body;
  final Widget? header;
  final Widget? footer;
  final String? title;
  final bool showBackButton;
  final bool showCloseButton;
  final bool showActions;

  // dividers
  // [showFooterDivider] shows a divider between the body and footer
  final bool showFooterDivider;
  // [showHeaderDivider] shows a divider between the header and body
  final bool showHeaderDivider;
  // [showSideDivider] shows a divider between the sheet and the screen
  final bool showSideDivider;

  final bool safeAreaTop;
  final bool safeAreaBottom;
  final String confirmActionText;
  final String cancelActionText;
  final String? closeButtonTooltip;
  final String? backButtonTooltip;

  final void Function()? confirmActionOnPressed;
  final void Function()? cancelActionOnPressed;
  final void Function()? onClose;
  final double sheetWidth;

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
    required this.closeButtonTooltip,
    required this.backButtonTooltip,
    required this.showCloseButton,
    required this.onClose,
    required this.sheetWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
              footer ?? const BuildFooter()
            ],
          ),
        ),
      ),
    );
  }
}
