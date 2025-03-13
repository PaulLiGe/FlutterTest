import 'package:flutter/material.dart';
import 'package:test01/pages/homepage.dart';
import 'package:test01/pages/web_page.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(
            WebViewPage(
              title: "title",
              url: "",
            ),
            settings: settings);
    }
    return pageRoute(Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('404出错了,${settings.name}不好用'),
      )),
    ));
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? requestFocus,
    bool? maintainState,
  }) {
    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings,
        // fullscreenDialog: fullscreenDialog ?? false,
        requestFocus: requestFocus,
        maintainState: maintainState ?? true);
  }
}

class RoutePath {
  static const String home = "/";
  static const String webViewPage = "/web_view.page";
}
