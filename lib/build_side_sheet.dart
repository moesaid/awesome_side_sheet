import 'package:flutter/material.dart';

class SideSheet extends StatelessWidget {
  final Widget? body;
  final Widget? header;
  final Widget? footer;
  final String? title;
  final bool showBackButton;
  final bool showCloseButton;
  final bool showActions;
  final bool showDivider;
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
    required this.showDivider,
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
        minimum: EdgeInsets.only(top: showBackButton ? 16 : 24),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 256,
            maxWidth: size.width <= 600 ? size.width : sheetWidth,
            minHeight: size.height,
            maxHeight: size.height,
          ),
          child: Column(
            children: [
              _buildHeader(textTheme, context),
              Expanded(
                child: body!,
              ),
              Visibility(
                visible: showActions,
                child: _buildFooter(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(showBackButton ? 16 : 24, 0, 16, 16),
      child: Row(
        children: [
          Visibility(
            visible: showBackButton,
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {
                  if (onClose == null) {
                    Navigator.pop(context);
                  } else {
                    onClose!();
                  }
                },
                tooltip: backButtonTooltip,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleSmall,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(width: showCloseButton ? 12 : 8),
          ),
          Visibility(
            visible: showCloseButton,
            child: IconButton(
              onPressed: () {
                if (onClose == null) {
                  Navigator.pop(context);
                } else {
                  onClose!();
                }
              },
              tooltip: closeButtonTooltip,
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: showDivider,
          child: const Divider(
            indent: 24,
            endIndent: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 16, 24, 24),
          child: Row(
            children: [
              FilledButton(
                onPressed: confirmActionOnPressed,
                child: Text(confirmActionText),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {
                  if (cancelActionOnPressed == null) {
                    Navigator.pop(context);
                  } else {
                    cancelActionOnPressed!();
                  }
                },
                child: Text(cancelActionText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
