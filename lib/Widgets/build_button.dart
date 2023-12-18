import 'package:flutter/material.dart';

/// A button widget that can be used to build buttons with custom child widgets.
///
/// The [BuildButton] widget is a convenience widget that wraps the [ElevatedButton]
/// widget and provides an optional [onPressed] callback and a required [child] widget.
/// It can be used to create buttons with custom child widgets.
///
/// Example usage:
///
/// ```dart
/// BuildButton(
///   onPressed: () {
///     // Perform some action when the button is pressed
///   },
///   child: Text('Click me'),
/// )
/// ```
///

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
