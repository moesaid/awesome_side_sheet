import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const BuildButton({Key? key, this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
