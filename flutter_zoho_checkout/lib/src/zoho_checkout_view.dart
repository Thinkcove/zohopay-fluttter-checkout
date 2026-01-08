import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A widget that handles the Zoho Checkout process using a WebView.
class ZohoCheckoutView extends StatefulWidget {
  /// The Zoho Checkout URL (Payment Link).
  final String paymentUrl;

  /// The URL to redirect to upon successful payment.
  /// The plugin will listen for this URL to determine success.
  final String successUrl;

  /// The URL to redirect to upon cancellation.
  /// The plugin will listen for this URL to determine cancellation.
  final String cancelUrl;

  /// Callback when payment is successful.
  /// If not provided, [Navigator.pop] is called with `true`.
  final ValueChanged<String>? onSuccess;

  /// Callback when payment is cancelled.
  /// If not provided, [Navigator.pop] is called with `false`.
  final VoidCallback? onCancel;

  /// Custom title for the AppBar.
  final String? appBarTitle;

  const ZohoCheckoutView({
    super.key,
    required this.paymentUrl,
    required this.successUrl,
    required this.cancelUrl,
    this.onSuccess,
    this.onCancel,
    this.appBarTitle,
  });

  @override
  State<ZohoCheckoutView> createState() => _ZohoCheckoutViewState();
}

class _ZohoCheckoutViewState extends State<ZohoCheckoutView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.successUrl)) {
              if (widget.onSuccess != null) {
                widget.onSuccess!(request.url);
              } else {
                if (mounted) Navigator.of(context).pop(true);
              }
              return NavigationDecision.prevent;
            } else if (request.url.startsWith(widget.cancelUrl)) {
              if (widget.onCancel != null) {
                widget.onCancel!();
              } else {
                if (mounted) Navigator.of(context).pop(false);
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle ?? 'Checkout'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
