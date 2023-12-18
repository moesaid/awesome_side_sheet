import 'package:awesome_side_sheet/Widgets/build_button.dart';
import 'package:flutter/material.dart';

/// A widget that builds the footer section of a side sheet.
///
/// The footer section typically contains buttons for confirming and canceling actions.
class BuildFooter extends StatelessWidget {
  final void Function()? confirmActionOnPressed;
  final void Function()? cancelActionOnPressed;
  final String confirmActionText;
  final String cancelActionText;
  final EdgeInsetsGeometry? padding;

  /// Creates a [BuildFooter] widget.
  ///
  /// The [confirmActionOnPressed] and [cancelActionOnPressed] are optional callbacks
  /// that will be invoked when the corresponding buttons are pressed.
  ///
  /// The [confirmActionText] and [cancelActionText] are the texts displayed on the buttons.
  ///
  /// The [padding] is the amount of space to surround the footer section.
  const BuildFooter({
    super.key,
    this.confirmActionOnPressed,
    this.cancelActionOnPressed,
    this.padding,
    required this.confirmActionText,
    required this.cancelActionText,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: padding ??
              EdgeInsets.all(
                width * 0.013,
              ),
          child: Row(
            children: [
              BuildButton(
                onPressed: confirmActionOnPressed ??
                    () => debugPrint('on confirm action pressed'),
                child: Text(confirmActionText),
              ),
              SizedBox(width: width * 0.01),
              BuildButton(
                onPressed: cancelActionOnPressed,
                child: Text(cancelActionText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
