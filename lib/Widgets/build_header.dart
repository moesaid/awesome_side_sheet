import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  final void Function()? onClose;
  final String? backButtonTooltip;
  final String? title;
  final String? closeButtonTooltip;
  final bool? showBackButton;
  final bool? showCloseButton;
  final EdgeInsetsGeometry? padding;

  const BuildHeader({
    super.key,
    this.showBackButton,
    this.onClose,
    this.backButtonTooltip,
    this.title,
    this.showCloseButton,
    this.closeButtonTooltip,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: padding ?? EdgeInsets.all(width * 0.005),
      child: Row(
        children: [
          Visibility(
            visible: showBackButton ?? true,
            child: IconButton(
              onPressed: () {
                if (onClose == null) {
                  Navigator.pop(context);
                } else {
                  onClose!();
                }
              },
              tooltip: backButtonTooltip,
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          Text(
            title ?? 'Title',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: width * 0.014,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Flexible(
            fit: FlexFit.tight,
            child: SizedBox(width: 8),
          ),
          Visibility(
            visible: showCloseButton ?? true,
            child: IconButton(
              onPressed: () {
                if (onClose == null) {
                  Navigator.pop(context);
                } else {
                  onClose!();
                }
              },
              tooltip: closeButtonTooltip,
              icon: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
