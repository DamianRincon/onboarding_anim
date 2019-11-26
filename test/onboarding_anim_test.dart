import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_anim/onboarding_anim.dart';

void main() {
  const MethodChannel channel = MethodChannel('onboarding_anim');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await OnboardingAnim.platformVersion, '42');
  });
}
