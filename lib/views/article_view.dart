import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? postUrl;
  const ArticleView({super.key, required this.postUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  var controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = WebViewController()..loadRequest(Uri.parse(widget.postUrl!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      appBar: AppBar(
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Icon(Icons.share),
            ),
          )
        ],
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "AajTak",
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            ),
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child: WebViewWidget(controller: controller),
      ),
    );
  }
}
