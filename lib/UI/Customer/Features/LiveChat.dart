import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveChat extends StatefulWidget {
  const LiveChat({Key? key}) : super(key: key);

  @override
  _LiveChatState createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  final String title = 'Online Agent';
  final String selectedUrl = "";

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  int position = 1;

  final key = UniqueKey();

  doneLoading(String A){
    setState(() {
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Live Chat',),
      backgroundColor: kStyleBackground,
      body: IndexedStack(index: position, children: [
        WebView(
          initialUrl:'https://tawk.to/chat/625666177b967b11798a7a90/1g0gntjvk',
          javascriptMode: JavascriptMode.unrestricted,
          key: key,
          onPageFinished: doneLoading,
          onPageStarted: startLoading,
        ),
        Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator(),),
        )
      ],),
    );
  }
}
