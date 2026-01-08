import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoho_checkout/flutter_zoho_checkout.dart';
import 'package:flutter_zoho_checkout/flutter_zoho_checkout_platform_interface.dart';
import 'package:flutter_zoho_checkout/flutter_zoho_checkout_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterZohoCheckoutPlatform
    with MockPlatformInterfaceMixin
    implements FlutterZohoCheckoutPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterZohoCheckoutPlatform initialPlatform = FlutterZohoCheckoutPlatform.instance;

  test('$MethodChannelFlutterZohoCheckout is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterZohoCheckout>());
  });

  test('getPlatformVersion', () async {
    FlutterZohoCheckout flutterZohoCheckoutPlugin = FlutterZohoCheckout();
    MockFlutterZohoCheckoutPlatform fakePlatform = MockFlutterZohoCheckoutPlatform();
    FlutterZohoCheckoutPlatform.instance = fakePlatform;

    expect(await flutterZohoCheckoutPlugin.getPlatformVersion(), '42');
  });
}
