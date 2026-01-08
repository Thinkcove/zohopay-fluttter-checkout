# Flutter Zoho Checkout Plugin

A Flutter plugin to integrate Zoho Checkout (Payments) into your Flutter application using a WebView.

## Features

- Opens Zoho Checkout pages securely within the app.
- Detects successful payments and redirects.
- Detects cancellations and redirects.
- Customizable AppBar title.

## Getting Started

### 1. Add Dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_zoho_checkout:
    path: ./ # Or git/pub url
```

### 2. Import

```dart
import 'package:flutter_zoho_checkout/flutter_zoho_checkout.dart';
```

### 3. Usage

Call `ZohoCheckout.openCheckout` with your Zoho Checkout URL.

```dart
final result = await ZohoCheckout.openCheckout(
  context,
  paymentUrl: 'https://payments.zoho.com/checkout/YOUR_CHECKOUT_ID',
  successUrl: 'https://yourwebsite.com/success',
  cancelUrl: 'https://yourwebsite.com/cancel',
  appBarTitle: 'Pay Now',
);

if (result == true) {
  // Payment Successful
} else if (result == false) {
  // Payment Cancelled
}
```

## Android Configuration

Ensure your `minSdkVersion` is at least 19 in `android/app/build.gradle`.

## License

MIT
