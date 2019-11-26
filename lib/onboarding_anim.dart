import 'dart:async';

import 'package:flutter/services.dart';

class OnboardingAnim {
  static const MethodChannel _channel =
      const MethodChannel('onboarding_anim');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
