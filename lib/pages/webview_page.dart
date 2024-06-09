/*
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KementrianWebpage extends StatefulWidget {
  KementrianWebpage({Key? key, required this.selectedUrl, required this.title}) : super(key: key);

  final String title;
  final String selectedUrl;

  @override
  State<KementrianWebpage> createState() => _KementrianWebpageState();
}

class _KementrianWebpageState extends State<KementrianWebpage> {
  late WebViewController controller;
  
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(selectedUrl),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TextConstants.appBarTitle),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
*/
