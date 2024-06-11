import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String selectedUrl;
  final String filtering;

  const WebViewPage({
    Key? key,
    required this.title,
    required this.selectedUrl,
    required this.filtering,
  }) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.selectedUrl)),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStop: (controller, url) async {
              // Execute your JavaScript here to get the data you need
              await controller.evaluateJavascript(
                  source: "a = document.querySelectorAll('*');"
                          "for (let i = 0; i < a.length; i++) {" +
                      widget.filtering +
                      "{"
                          "a[i].style.display = 'none';"
                          "}"
                          "};");
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
