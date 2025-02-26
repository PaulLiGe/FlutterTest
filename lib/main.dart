import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:test01/pages/homepage.dart';
import 'package:test01/routes/routes.dart';
import 'package:test01/pages/home_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      // onGenerateRoute: Routes.generatedRoute,
      // initialRoute: RoutePath.home,
    );
  }
}

// class FutureBuilderWidget extends StatefulWidget {
//   _FutureBuilderWidgetState createState() => _FutureBuilderWidgetState();
// }

// class _FutureBuilderWidgetState extends State {
//   Dio _dio = Dio();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: FutureBuilder(
//           future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
//           builder: (BuildContext context, AsyncSnapshot snapShot) {
//             if (snapShot.connectionState == ConnectionState.done) {
//               Response response = snapShot.data;
//               if (snapShot.hasError) {
//                 return Text(snapShot.error.toString());
//               }
//               final arr = [...response.data, ...response.data];
//               return ListView(
//                 children: arr
//                     .map<Widget>((e) => ListTile(
//                           title: Text(e["full_name"]),
//                         ))
//                     .toList(),
//               );
//             }
//             return CircularProgressIndicator();
//           }),
//     );
//   }
// }

// class HttpTestRoute extends StatefulWidget {
//   @override
//   _HttpTestRouteState createState() => _HttpTestRouteState();
// }

// class _HttpTestRouteState extends State<HttpTestRoute> {
//   bool _loading = false;
//   String _text = "";

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ElevatedButton(
//               onPressed: _loading ? null : request, child: Text('点击获取百度首页')),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             child: Text(_text.replaceAll(RegExp(r"\s"), "")),
//           ),
//         ],
//       ),
//     );
//   }

//   void request() async {
//     Response response;
//     Dio dio = Dio();
//     response = await dio.get("");

//     try {
//       HttpClient client = HttpClient();
//       HttpClientRequest req =
//           await client.getUrl(Uri.parse('https://www.baidu.com'));
//       req.headers.add("user-agent",
//           "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
//       HttpClientResponse response = await req.close();
//       _text = await response.transform(utf8.decoder).join();
//       print(response.headers);
//       client.close();
//     } catch (e) {
//       _text = "请求失败$e";
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }
// }

// class FileTest extends StatefulWidget {
//   const FileTest({Key? key}) : super(key: key);

//   _FileTesState createState() => _FileTesState();
// }

// class _FileTesState extends State<FileTest> {
//   int _counter = 0;

//   Future<File> _getlocalFile() async {
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     return File('$dir/counter.txt');
//   }

//   Future<int> _readerCounter() async {
//     HttpClient httpClient = HttpClient();
//     Uri uri =
//         Uri(scheme: 'https', host: 'flutterchina.club', queryParameters: {});
//     HttpClientRequest request = await httpClient.getUrl(uri);
//     request.headers.add('user-agent', 'test');
//     request.add(utf8.encode(""));
//     HttpClientResponse response = await request.close();
//     String responseBody = await response.transform(utf8.decoder).join();
//     httpClient.close();

//     try {
//       File file = await _getlocalFile();
//       String contents = await file.readAsString();
//       return int.parse(contents);
//     } on FileSystemException {
//       return 0;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     _readerCounter().then((int count) {
//       setState(() {
//         _counter = count;
//       });
//     });
//   }

//   void _incrementCounter() async {
//     setState(() {
//       _counter++;
//     });
//     (await _getlocalFile()).writeAsString('$_counter');
//   }

//   @override
//   build(BuildContext context) {
//     return Center(
//       child: TextButton(
//           onPressed: _incrementCounter, child: Text('点击了$_counter次')),
//     );
//   }
// }

// class GradientButtonTest extends StatelessWidget {
//   const GradientButtonTest(
//       {super.key,
//       this.colors,
//       this.width,
//       this.height,
//       this.onPressed,
//       this.borderRadius,
//       required this.child});

//   final List<Color>? colors;
//   final double? width;
//   final double? height;
//   final BorderRadius? borderRadius;
//   final GestureTapCallback? onPressed;
//   final Widget child;

//   void tapAction() {}

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     List<Color> colors =
//         colors ?? [theme.primaryColor, theme.primaryColorDark];
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: colors),
//         borderRadius: borderRadius,
//       ),
//       child: Material(
//         type: MaterialType.transparency,
//         child: InkWell(
//           splashColor: colors.last,
//           highlightColor: Colors.transparent,
//           borderRadius: borderRadius,
//           onTap: tapAction,
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tightFor(height: height, width: width),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(38),
//                 child: DefaultTextStyle(
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                     child: child),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _GestureRecognizerTest extends StatefulWidget {
//   @override
//   _GestureState createState() => _GestureState();
// }

// class _GestureState extends State<_GestureRecognizerTest> {
//   bool changeColor = false;
//   TapGestureRecognizer _tapGesture = TapGestureRecognizer();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Text.rich(
//       TextSpan(
//         children: [
//           TextSpan(text: "你好时间"),
//           TextSpan(
//             text: "点我变色",
//             style: TextStyle(
//               fontSize: 30.0,
//               color: changeColor ? Colors.red : Colors.blue,
//             ),
//             recognizer: _tapGesture
//               ..onTap = () {
//                 setState(() {
//                   changeColor = !changeColor;
//                 });
//               },
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class _Drag extends StatefulWidget {
//   @override
//   _DragState createState() => _DragState();
// }

// class _DragState extends State<_Drag> {
//   double _top = 0.0;
//   double _left = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Positioned(
//           top: _top,
//           left: _left,
//           child: GestureDetector(
//             onPanDown: (DragDownDetails e) {
//               print('用户收按下位置:${e.globalPosition}');
//             },
//             onPanUpdate: (DragUpdateDetails e) {
//               setState(() {
//                 _left += e.delta.dx;
//                 _top += e.delta.dy;
//               });
//             },
//             onPanEnd: (DragEndDetails e) {
//               print(e.velocity);
//             },
//             child: CircleAvatar(
//               child: Text("ddd"),
//             ),
//           )),
//     );
//   }
// }

// Future<String> mockNetworkData() async {
//   return Future.delayed(Duration(seconds: 2), () => '请求回来的数据');
// }

// class ReqTestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试一下'),
//       ),
//       body: Center(
//         child: FutureBuilder(
//             future: mockNetworkData(),
//             builder: (context, snapShot) {
//               if (snapShot.connectionState == ConnectionState.done) {
//                 if (snapShot.hasError) {
//                   return Text('报错了Error: ${snapShot.error}');
//                 }
//                 return Text('Contents:${snapShot.data}');
//               }
//               return CircularProgressIndicator();
//             }),
//       ),
//     );
//   }
// }

// class ValueListenableRoute extends StatelessWidget {
//   ValueNotifier _counter = ValueNotifier<int>(0);
//   @override
//   Widget build(BuildContext context) {
//     print('测试2');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('value list 测试'),
//       ),
//       body: Center(
//         child: ValueListenableBuilder(
//             valueListenable: _counter,
//             child: Text('点击了'),
//             builder: (context, value, child) {
//               print('测试');
//               return Row(
//                 children: [
//                   child!,
//                   Text(
//                     '$value次',
//                     textScaler: TextScaler.linear(1.5),
//                   ),
//                 ],
//               );
//             }),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             _counter.value += 1;
//           }),
//     );
//   }
// }

// class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
//   ChangeNotifierProvider({Key? key, required this.data, this.child});

//   final T data;
//   final Widget? child;

//   static T of<T>(BuildContext context) {
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
//     return provider.data;
//   }

//   @override
//   _ChangeNotifierProviderState createState() => _ChangeNotifierProviderState();
// }

// class _ChangeNotifierProviderState<T extends ChangeNotifier>
//     extends State<ChangeNotifierProvider> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

// }

// class InheritedProvider<T> extends InheritedWidget {
//   InheritedProvider({Key? key, required this.data, required Widget child})
//       : super(key: key, child: child);

//   final T data;

//   @override
//   bool updateShouldNotify(InheritedProvider<T> old) {
//     return true;
//   }
// }

// class ChangeNotifier implements Listenable {
//   List listeners = [];

//   @override
//   void addListener(VoidCallback listener) {
//     listeners.add(listener);
//   }

//   @override
//   void removeListener(VoidCallback listener) {
//     listeners.remove(listener);
//   }

//   void notifyListeners() {
//     listeners.forEach((item) => item());
//   }
// }

// class InheritedWidgetTestWidget extends StatefulWidget {
//   _InheritedWidgetTestWidget createState() => _InheritedWidgetTestWidget();
// }

// class _InheritedWidgetTestWidget extends State<InheritedWidgetTestWidget> {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 100),
//             child: ShareDataWidget(data: _count, child: _TestWidget()),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _count++;
//                 });
//               },
//               child: Text('点击增加')),
//         ],
//       ),
//     );
//   }
// }

// class ShareDataWidget extends InheritedWidget {
//   ShareDataWidget({Key? key, required this.data, required Widget child})
//       : super(key: key, child: child);

//   final int data;

//   static ShareDataWidget? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
//   }

//   @override
//   bool updateShouldNotify(ShareDataWidget old) {
//     return old.data != data;
//   }
// }

// class _TestWidget extends StatefulWidget {
//   @override
//   _TestWidgetState createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<_TestWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Text(ShareDataWidget.of(context)!.data.toString());
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     print('cao ni ma');
//   }
// }

// class InheritedProvider<T> extends InheritedWidget {
//   InheritedProvider({Key? key, required this.data, required Widget child})
//       : super(key: key, child: child);

//   final T data;

//   @override
//   bool updateShouldNotify(InheritedProvider<T> old) {
//     return true;
//   }
// }

// class ChangeNotifier implements Listenable {
//   List listeners = [];

//   @override
//   void addListener(VoidCallback listener) {
//     listeners.add(listener);
//   }

//   @override
//   void removeListener(VoidCallback listener) {
//     listeners.remove(listener);
//   }

//   void notifyListeners() {
//     listeners.forEach((each) => each());
//   }
// }

// class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
//   ChangeNotifierProvider({Key? key, required this.data, required this.child});

//   final T data;
//   final Widget child;

//   static T of<T>(BuildContext context) {
//     final type = _typeOf<InheritedProvider<T>>();
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
//     return provider.data;
//   }

//   @override
//   _ChangeNotifierProviderState createState() => _ChangeNotifierProviderState();
// }

// class _ChangeNotifierProviderState extends State<ChangeNotifierProvider> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class InheritedWidgetTestRoute extends StatefulWidget {
//   @override
//   _InheritedWidgetTestRouteState createState() =>
//       _InheritedWidgetTestRouteState();
// }

// class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ShareDataWidget(
//           data: count,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: _TestWidget(),
//               ),
//               ElevatedButton(
//                   onPressed: () => {
//                         setState(() {
//                           count++;
//                         })
//                       },
//                   child: Text('增加')),
//             ],
//           )),
//     );
//   }
// }

// class ShareDataWidget extends InheritedWidget {
//   ShareDataWidget({Key? key, required this.data, required Widget child})
//       : super(key: key, child: child);
//   final int data;

//   static ShareDataWidget? of(BuildContext context) {
//     return context
//         .getElementForInheritedWidgetOfExactType<ShareDataWidget>()!
//         .widget as ShareDataWidget;
//   }

//   @override
//   bool updateShouldNotify(ShareDataWidget old) {
//     return old.data != data;
//   }
// }

// class _TestWidget extends StatefulWidget {
//   @override
//   _TestWidgetState createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<_TestWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // return Text('测试代码哈哈');
//     return Text(ShareDataWidget.of(context)!.data.toString());
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     print('denpendencier change');
//   }
// }
// class TestCustomScrollView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             expandedHeight: 250,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('demo'),
//               background: Container(
//                 color: Colors.red,
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(8),
//             sliver: SliverGrid(
//               delegate: SliverChildBuilderDelegate((context, idx) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.cyan[100 * (idx % 9)],
//                   child: Text('grid item $idx'),
//                 );
//               }, childCount: 20),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 4),
//             ),
//           ),
//           SliverFixedExtentList(
//               delegate: SliverChildBuilderDelegate((context, idx) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: Colors.lightBlue[100 * (idx % 9)],
//                   child: Text('list item $idx'),
//                 );
//               }, childCount: 20),
//               itemExtent: 50),
//         ],
//       ),
//     );
//   }
// }

// class TestCustomScrollView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var listView = SliverFixedExtentList(
//         delegate: SliverChildBuilderDelegate(childCount: 15, (context, index) {
//           return ListTile(
//             title: Text("$index"),
//           );
//         }),
//         itemExtent: 30);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('两个ListView'),
//         ),
//         body: CustomScrollView(
//           slivers: [listView, listView],
//         ));
//   }
// }

// class TabViewRouteWidge extends StatefulWidget {
//   @override
//   _TabViewRouteState createState() => _TabViewRouteState();
// }

// class _TabViewRouteState extends State<TabViewRouteWidge>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List tabs = ['新闻', '历史', '图片'];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: tabs.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试tabbar'),
//         bottom: TabBar(
//             controller: _tabController,
//             tabs: tabs
//                 .map((e) => Tab(
//                       text: e,
//                     ))
//                 .toList()),
//       ),
//       body: TabBarView(
//           controller: _tabController,
//           children: tabs.map((e) {
//             return Container(
//               alignment: Alignment.center,
//               child: DefaultTabController(length: length, child: child)
//             );
//           }).toList()),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }

// class Page extends StatelessWidget {
//   const Page({Key? key, required this.text}) : super(key: key);

//   final String text;
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     print('build ${text}');
//     return Center(
//       child: Text(
//         text,
//         textScaler: TextScaler.linear(1.2),
//       ),
//     );
//   }
// }

// class TestPageViewWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var children = <Widget>[];
//     for (int i = 0; i < 6; i++) {
//       children.add(Page(text: "$i"));
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//       ),
//       body: Container(
//         child: PageView(
//           children: children,
//         ),
//       ),
//     );
//   }
// }

// class TestGridWidget extends StatefulWidget {
//   @override
//   _TestGridWidget createState() => _TestGridWidget();
// }

// class _TestGridWidget extends State<TestGridWidget> {
//   List<IconData> _icons = [];

//   @override
//   void initState() {
//     super.initState();
//     requestData();
//   }

//   void requestData() {
//     Future.delayed(Duration(milliseconds: 300)).then((e) {
//       setState(() {
//         _icons.addAll(
//             [Icons.ac_unit, Icons.airport_shuttle, Icons.all_inclusive]);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试'),
//       ),
//       body: Container(
//         child: GridView.builder(
//             itemCount: _icons.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, childAspectRatio: 1.0),
//             itemBuilder: (context, index) {
//               if (index == _icons.length - 1 && _icons.length < 200) {
//                 requestData();
//               }
//               return Icon(_icons[index]);
//             }),
//       ),
//     );
//   }
// }

// class TestGridViewWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试'),
//       ),
//       body: Container(
//         child: GridView.extent(
//           maxCrossAxisExtent: 120,
//           childAspectRatio: 2,
//           children: [
//             Icon(Icons.ac_unit),
//             Icon(Icons.airport_shuttle),
//             Icon(Icons.all_inclusive),
//             Icon(Icons.beach_access),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TestGridViewWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('标题'),
//       ),
//       body: Container(
//         child: GridView(
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200, childAspectRatio: 1),
//           children: [
//             Icon(Icons.ac_unit),
//             Icon(Icons.airport_shuttle),
//             Icon(Icons.all_inclusive),
//             Icon(Icons.beach_access),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ScrollNotificationTestRoute extends StatefulWidget {
//   @override
//   _ScrollNotificationTestRouteState createState() =>
//       _ScrollNotificationTestRouteState();
// }

// class _ScrollNotificationTestRouteState
//     extends State<ScrollNotificationTestRoute> {
//   String _progress = "%0";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试Progress'),
//       ),
//       body: Container(
//         child: NotificationListener(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               ListView.builder(
//                   itemCount: 50,
//                   itemExtent: 50,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text("$index"),
//                     );
//                   }),
//               CircleAvatar(
//                 radius: 30,
//                 child: Text(_progress),
//                 backgroundColor: Colors.red,
//               )
//             ],
//           ),
//           onNotification: (ScrollNotification notification) {
//             double progress = notification.metrics.pixels /
//                 notification.metrics.maxScrollExtent;
//             setState(() {
//               _progress = "${(progress * 100).toInt()}%";
//             });
//             print("BottomEdge: ${notification.metrics.extentAfter == 0}");
//             return false;
//           },
//         ),
//       ),
//     );
//   }
// }

// class ScrolControllerTestRoute extends StatefulWidget {
//   @override
//   _ScrollControllerTestWigetState createState() =>
//       _ScrollControllerTestWigetState();
// }

// class _ScrollControllerTestWigetState extends State<ScrolControllerTestRoute> {
//   ScrollController _controller = ScrollController();
//   bool showToTopBtn = false;

//   @override
//   void initState() {
//     super.initState();

//     _controller.addListener(() {
//       print(_controller.offset);
//       if (_controller.offset < 1000 && showToTopBtn) {
//         setState(() {
//           showToTopBtn = false;
//         });
//       } else if (_controller.offset >= 1000 && showToTopBtn == false) {
//         setState(() {
//           showToTopBtn = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试代码'),
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text("$index"),
//             );
//           },
//           itemCount: 50,
//           itemExtent: 80,
//           controller: _controller,
//         ),
//       ),
//       floatingActionButton: !showToTopBtn
//           ? null
//           : FloatingActionButton(
//               onPressed: () {
//                 _controller.jumpTo(00);
//                 // _controller.animateTo(0,
//                 //     duration: Duration(milliseconds: 200), curve: Curves.ease);
//               },
//               child: Icon(Icons.arrow_upward),
//             ),
//     );
//   }
// }

// class InfiniteListView extends StatefulWidget {
//   @override
//   _InfiniteListViewState createState() => _InfiniteListViewState();
// }

// class _InfiniteListViewState extends State<InfiniteListView> {
//   static const loadingTag = "##loading##";
//   var _words = <String>[loadingTag];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('InfiniteListView'),
//       ),
//       body: Container(
//           child: ListView.separated(
//               itemBuilder: (context, index) {
//                 if (_words[index] == loadingTag) {
//                   if (_words.length - 1 < 100) {
//                     _requestData();
//                     return Container(
//                       padding: const EdgeInsets.all(16),
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         '没有更多了',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     );
//                   }
//                 } else {
//                   return ListTile(
//                     title: Text(_words[index]),
//                   );
//                 }
//               },
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   height: 1,
//                 );
//               },
//               itemCount: _words.length)),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _requestData();
//   }

//   void _requestData() {
//     Future.delayed(Duration(seconds: 2)).then((e) {
//       setState(() {
//         _words.insertAll(_words.length - 1,
//             generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
//       });
//     });
//   }
// }
// class TestListWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget div1 = Divider(
//       color: Colors.blue,
//     );
//     Widget div2 = Divider(
//       color: Colors.red,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ListView测试'),
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text('$index'),
//             );
//           },
//           prototypeItem: ListTile(
//             title: Text('88'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TestSingleChildScrollViewWidget extends StatelessWidget {
//   final String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//   final arr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//       .split('')
//       .map((c) => Text(
//             c,
//             textScaler: TextScaler(2.0),
//           ))
//       .toList();
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(children: arr),
//       ),
//     );
//   }
// }

// class TestScaffoldWidget extends StatefulWidget {
//   @override
//   _TestScaffoldState createState() => _TestScaffoldState();
// }

// class _TestScaffoldState extends State<TestScaffoldWidget> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My name"),
//         actions: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.shape_line)),
//         ],
//         leading: Builder(builder: (context) {
//           return IconButton(
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               icon: Icon(
//                 Icons.dashboard,
//                 color: Colors.blue,
//               ));
//         }),
//       ),
//       drawer: MYDrawer(),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.red,
//         shape: CircularNotchedRectangle(),
//         child: Row(
//           children: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.home)),
//             SizedBox(),
//             IconButton(onPressed: () {}, icon: Icon(Icons.business)),
//           ],
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: [
//       //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.business), label: "business"),
//       //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
//       //   ],
//       //   currentIndex: _selectedIndex,
//       //   fixedColor: Colors.blue,
//       //   onTap: (idx) {
//       //     setState(() {
//       //       _selectedIndex = idx;
//       //     });
//       //   },
//       // ),
//       floatingActionButton:
//           FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
//     );
//   }

//   void _onAdd() {}
// }

// class MYDrawer extends StatelessWidget {
//   const MYDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//               padding: EdgeInsets.only(top: 100),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18),
//                     child: ClipOval(
//                       child: Icon(
//                         Icons.holiday_village,
//                         size: 80,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '我曹',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )),
//           Expanded(
//               child: ListView(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.add),
//                 title: const Text('Add account'),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings),
//                 title: const Text('Manage accounts'),
//               )
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }

// class TestAlignWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试align'),
//       ),
//       body: Container(
//         height: 120,
//         width: 220,
//         color: Colors.red,
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           widthFactor: 4,
//           heightFactor: 4,
//           child: FlutterLogo(
//             size: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TestConstrainedBoxWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试Stack'),
//       ),
//       body: ConstrainedBox(
//         constraints: BoxConstraints.expand(),
//         child: Stack(
//           alignment: Alignment.center,
//           fit: StackFit.expand,
//           children: [
//             Positioned(
//               child: Text('i`m jack'),
//               left: 18,
//             ),
//             Container(
//               color: Colors.red,
//               child: Text("第二个"),
//             ),
//             Positioned(top: 18, child: Text('第三个')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TestContainerWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试container'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(19),
//             color: Colors.red,
//             child: Text('hello world'),
//           ),
//           Container(
//             color: Colors.red,
//             padding: EdgeInsets.all(19),
//             child: Text('hello world'),
//           )
//         ],
//       ),
//     );
//   }
// }

// class TestDecoratedBoxWidget extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('测试box组件'),
//       ),
//       body: DecoratedBox(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
//           borderRadius: BorderRadius.circular(3),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black54,
//               offset: Offset(2.0, 2.0),
//               blurRadius: 4.0
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
//           child: Text('login', style: TextStyle(color: Colors.purple, backgroundColor: Colors.black),),
//         ),
//       ),
//     );
//   }
// }

// class TestPaddingWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Padding测试'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(padding: EdgeInsets.only(left: 30), child: Text('测试1'),),
//             Padding(padding: EdgeInsets.all(40), child: Text('测试2'),),
//             Padding(padding: EdgeInsets.fromLTRB(80, 20, 10, 100), child: Text('测试3'),),
//             Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('测试4'),),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TipRoute extends StatelessWidget {
//   const TipRoute({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('提示'),
//       ),
//       body: Container(
//         child: Padding(
//           padding: EdgeInsets.all(18),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(title),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, '我返回了1000');
//                   },
//                    child: Text('返回'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have clicked the btimes:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
