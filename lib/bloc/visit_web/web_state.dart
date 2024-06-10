import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nusantara_news_app/pages/comment.dart';
import 'package:nusantara_news_app/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String title;
  final String selectedUrl;
  final String filtering;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewPage({
    required this.title,
    required this.selectedUrl,
    required this.filtering,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.insert_comment_sharp), // Choose the icon you want
            color: kBlack, // Set the color of the icon
            onPressed: () {
              // Define the action when the icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommentScreen()), // Example page
              );
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: selectedUrl,
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
          if (request.url != selectedUrl) {
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
                filtering +
                "{"
                    "a[i].style.display = 'none';"
                    "}"
                    "};");
          });
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}
