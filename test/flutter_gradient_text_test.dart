import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/src/gradient_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterGradientTextPlatform with MockPlatformInterfaceMixin {}

void main() {
  var gt = const GradientText(Text("test"), colors: [Colors.red, Colors.blue]);
  test('check data of gradient text', () => {expect('test' == gt.text.data, true)});
}
