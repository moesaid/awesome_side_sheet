# Awesome Side Sheet

![moesaid - mohamed s abdrabou - flutter awesome side sheet - sidesheet](https://i.ibb.co/58yPR74/Thumbnail.jpg)

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Awesome Side Sheet is a Flutter package that provides a flexible and customizable side sheet implementation for your Flutter applications. It allows you to easily integrate a sliding panel or drawer with various features and customization options.

## Features

- Slide-in side sheet with configurable width and position.
- Customizable appearance with options for background color, text color, button colors, and more.
- Support for header, body, and footer sections within the side sheet.
- Optional actions, back button, close button, and dividers for improved flexibility.
- Smooth transition animations for a polished user interface.

## Getting Started

To use this package in your Flutter project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  awesome_side_sheet: ^latest_version
```

Then, run:

```bash
$ flutter pub get
```

For detailed information on how to integrate packages into your Flutter project, refer to the [Flutter documentation on dependencies](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Usage

Here is a simple example demonstrating how to use the Awesome Side Sheet:

```dart
import 'package:awesome_side_sheet/awesome_side_sheet.dart';

aweSideSheet(context: context);
```

For more detailed examples and use cases, check the /example folder in the package repository.

## exposed api

```dart
  // required
  required BuildContext context,
  required SheetPosition sheetPosition,

  // widgets
  Widget? body,
  Widget? footer,
  Widget? header,

  // bools
  bool barrierDismissible = true,
  bool showBackButton = true,
  bool showCloseButton = true,
  bool showActions = true,
  bool showFooterDivider = true,
  bool showHeaderDivider = true,
  bool showSideDivider = true,
  bool safeAreaTop = true,
  bool safeAreaBottom = true,

  // strings
  String confirmActionText = 'Save',
  String cancelActionText = 'Cancel',
  String? title,

  // duration
  Duration? transitionDuration,

  // doubles
  double sheetWidth = 400 <- default,
  double? borderRadius,

  // Colors
  Color? backgroundColor,
  surfaceTintColor,
  textColor,
  iconColor,
  dividerColor,
  confirmButtonBgColor,
  confirmButtonTextColor,
  cancelButtonBgColor,
  cancelButtonTextColor,

  // callbacks
  void Function()? onConfirm,
  void Function()? onCancel,
  void Function()? onDismiss,
  void Function()? onClose,
```

## Additional Information

- If you encounter any issues or have suggestions for improvement, please file an issue.
- Contributions are welcome! Feel free to open pull requests to help enhance this package.
- Enjoy using the Awesome Side Sheet in your Flutter applications!

## License

awesome_side_sheet is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

## credits

awesome_side_sheet created by [Mohamed S Abdrabou](https://github.com/moesaid)
