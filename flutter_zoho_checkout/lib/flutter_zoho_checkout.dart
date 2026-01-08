
import 'package:flutter/material.dart';
import 'src/zoho_checkout_view.dart';

export 'src/zoho_checkout_view.dart';

class ZohoCheckout {
  /// Opens the Zoho Checkout view.
  /// 
  /// Returns `true` if the payment was successful, `false` if cancelled or failed,
  /// and `null` if the user dismissed the view without completing.
  static Future<bool?> openCheckout(
    BuildContext context, {
    required String paymentUrl,
    required String successUrl,
    required String cancelUrl,
    String? appBarTitle,
  }) {
    return Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => ZohoCheckoutView(
          paymentUrl: paymentUrl,
          successUrl: successUrl,
          cancelUrl: cancelUrl,
          appBarTitle: appBarTitle,
        ),
      ),
    );
  }
}
