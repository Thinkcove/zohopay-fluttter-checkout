import 'package:flutter/material.dart';
import 'package:flutter_zoho_checkout/flutter_zoho_checkout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoho Checkout Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message = 'Click below to start payment';

  Future<void> _startPayment() async {
    // TODO: Replace with your actual Zoho Checkout URL
    const paymentUrl = 'https://payments.zoho.com/checkout/YOUR_CHECKOUT_ID';
    const successUrl = 'https://yourwebsite.com/success';
    const cancelUrl = 'https://yourwebsite.com/cancel';

    final result = await ZohoCheckout.openCheckout(
      context,
      paymentUrl: paymentUrl,
      successUrl: successUrl,
      cancelUrl: cancelUrl,
      appBarTitle: 'Zoho Payment',
    );

    if (!mounted) return;

    if (result == true) {
      setState(() {
        _message = 'Payment Successful!';
      });
    } else if (result == false) {
      setState(() {
        _message = 'Payment Cancelled.';
      });
    } else {
      setState(() {
        _message = 'Payment Dismissed.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoho Checkout Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startPayment,
              child: const Text('Pay with Zoho'),
            ),
          ],
        ),
      ),
    );
  }
}
