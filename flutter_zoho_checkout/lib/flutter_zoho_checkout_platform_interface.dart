import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_zoho_checkout_method_channel.dart';

abstract class FlutterZohoCheckoutPlatform extends PlatformInterface {
  /// Constructs a FlutterZohoCheckoutPlatform.
  FlutterZohoCheckoutPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterZohoCheckoutPlatform _instance = MethodChannelFlutterZohoCheckout();

  /// The default instance of [FlutterZohoCheckoutPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterZohoCheckout].
  static FlutterZohoCheckoutPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterZohoCheckoutPlatform] when
  /// they register themselves.
  static set instance(FlutterZohoCheckoutPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
