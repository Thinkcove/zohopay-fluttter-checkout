import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_zoho_checkout_platform_interface.dart';

/// An implementation of [FlutterZohoCheckoutPlatform] that uses method channels.
class MethodChannelFlutterZohoCheckout extends FlutterZohoCheckoutPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_zoho_checkout');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
