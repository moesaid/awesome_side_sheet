import 'package:flutter/material.dart';

/// A widget that builds the header for a side sheet.
///
/// The header includes a back button, a title, and a close button.
/// The back button is optional and can be shown or hidden using the [showBackButton] parameter.
/// The title is optional and defaults to 'Title' if not provided.
/// The close button is optional and can be shown or hidden using the [showCloseButton] parameter.
/// The [onClose] callback is called when the close button is pressed or when the back button is pressed and [onClose] is null.
/// The [backButtonTooltip] and [closeButtonTooltip] parameters can be used to provide tooltips for the back and close buttons, respectively.
/// The [padding] parameter can be used to specify the padding around the header.
///

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
