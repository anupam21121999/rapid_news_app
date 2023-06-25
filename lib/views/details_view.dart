import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailsViewScreen extends StatefulWidget {
  String newsUrl;
  DetailsViewScreen({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<DetailsViewScreen> createState() => _DetailsViewScreenState();
}

class _DetailsViewScreenState extends State<DetailsViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http") ? widget.newsUrl.replaceAll("http:", "https:") : widget.newsUrl;
    });
  }

  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Snack"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: WebView(
          initialUrl: widget.newsUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
          },
        ),
      )
    );
  }
}
