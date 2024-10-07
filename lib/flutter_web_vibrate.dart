library flutter_web_vibrate;

import 'dart:html' as html;
import 'dart:js' as js;

class FlutterWebVibrate {
  /// Injects the JavaScript vibration code into the HTML page.
  static void injectJavaScript() {
    String jsCode = """
    function vibratePhone(duration) {
      if (navigator.vibrate) {
        navigator.vibrate(duration);
      } else {
        console.log("Vibration API not supported");
      }
    }
    """;
    final script = html.ScriptElement()..innerHtml = jsCode;
    html.document.body?.append(script);
  }

  /// Vibrates the device for the given [duration] in milliseconds.
  /// Only works if the browser supports the Vibration API.
  static void vibrate(int duration) {
    if (isVibrationSupported()) {
      js.context.callMethod('vibratePhone', [duration]);
    } else {
      print('Vibration API not supported on this device.');
    }
  }

  /// Checks if the device supports the Vibration API.
  static bool isVibrationSupported() {
    return js.context.hasProperty('navigator') &&
        js.context['navigator'].hasProperty('vibrate');
  }
}
