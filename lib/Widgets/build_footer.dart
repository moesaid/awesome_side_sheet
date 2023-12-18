import 'package:awesome_side_sheet/Widgets/build_button.dart';
import 'package:flutter/material.dart';

class BuildFooter extends StatelessWidget {
  final void Function()? confirmActionOnPressed;
  final void Function()? cancelActionOnPressed;
  final bool? showDivider;
  final String confirmActionText;
  final String cancelActionText;
  final EdgeInsetsGeometry? padding;
  const BuildFooter({
    super.key,
    this.showDivider,
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
