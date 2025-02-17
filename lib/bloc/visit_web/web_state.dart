import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nusantara_news_app/pages/comment_page.dart';
import 'package:nusantara_news_app/styles/colors.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String selectedUrl;
  final String filtering;
  final String category;

  const WebViewPage({
    Key? key,
    required this.title,
    required this.selectedUrl,
    required this.filtering,
    required this.category,
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
        actions: [
          IconButton(
            icon: const Icon(
                Icons.insert_comment_sharp), // Choose the icon you want
            color: kBlack, // Set the color of the icon
            onPressed: () {
              // Define the action when the icon is pressed
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      //builder: (context) => CommentScreen()), // Example page
                      builder: (context) => CommentSection(
                            category: widget.category,
                            title: widget.title,
                          )));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.selectedUrl)),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStop: (controller, url) async {
              await controller.evaluateJavascript(
                  source:
                      "a = document.querySelectorAll('*');for (let i = 0; i < a.length; i++) {${widget.filtering}{a[i].style.display = 'none';}};");
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading)
            const Center(
                child: CircularProgressIndicator(
              color: kBlueRibbon,
            )),
        ],
      ),
    );
  }
}
