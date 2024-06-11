import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nusantara_news_app/pages/comment.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        /*
      body: WebView(
        initialUrl: widget.selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageStarted: (String url) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Loading..')));
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url != widget.selectedUrl) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageFinished: (String url) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.green,
            ));
          _controller.future.then((controller) {
            controller.runJavascript("a = document.querySelectorAll('*');"
                    "for (let i = 0; i < a.length; i++) {" +
                widget.filtering +
                "{"
                    "a[i].style.display = 'none';"
                    "}"
                    "};");
          });
        },
        gestureNavigationEnabled: true,*/
      ),
    );
  }
}
