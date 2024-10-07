A Flutter web plugin to enable vibration functionality in web applications.

This package allows you to vibrate a device via the Vibration API if the browser supports it.
It provides methods to inject JavaScript, vibrate the device, and check for vibration support.

## Features

- Vibrate the device for a given duration (in milliseconds).
- Check if the device supports the Vibration API.
- Inject the required JavaScript into the HTML page automatically.

## Getting Started

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_web_vibrate: ^last_version
```

Then, import the package in your Dart file:

```dart
import 'package:flutter_web_vibrate/flutter_web_vibrate.dart';
```

## Usage

### Inject JavaScript

You need to inject the JavaScript code into the HTML page before using the vibration functionality.
Call the `injectJavaScript()` method in your main function:

```dart
void main() {
  FlutterWebVibrate.injectJavaScript();
  runApp(MyApp());
}
```

### Vibrate the Device

You can use the `vibrate()` method to make the device vibrate for a specified duration:

```dart
FlutterWebVibrate.vibrate(200); // Vibrates for 200 milliseconds.
```

### Check if Vibration is Supported

You can check if the Vibration API is supported by the current browser:

```dart
bool isSupported = FlutterWebVibrate.isVibrationSupported();
if (isSupported) {
  print('Vibration is supported on this device.');
} else {
  print('Vibration is not supported on this device.');
}
```

## Example

Here is a complete example of how to use the `flutter_web_vibrate` package:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_web_vibrate/flutter_web_vibrate.dart';

void main() {
  FlutterWebVibrate.injectJavaScript();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Web Vibrate Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              if (FlutterWebVibrate.isVibrationSupported()) {
                FlutterWebVibrate.vibrate(200); // Vibrates for 200 milliseconds
              } else {
                print('Vibration not supported on this device.');
              }
            },
            child: Text('Vibrate Device'),
          ),
        ),
      ),
    );
  }
}
```

## Additional Information

- This package relies on the `Vibration API`, which is not supported by all browsers.
- It is recommended to use the `isVibrationSupported()` method before calling `vibrate()` to ensure compatibility.
