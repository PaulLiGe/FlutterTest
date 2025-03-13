import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/routes.dart';

class WebViewPage extends StatefulWidget {
  String? title;
  final String url;
  WebViewPage({super.key, this.title, required this.url});

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        var name = map['name'];
        widget.title = name;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "无标题"),
        ),
        body: SafeArea(
            child: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("我是是返回好用不"),
          ),
        )));
  }
}
