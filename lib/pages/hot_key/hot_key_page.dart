import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/pages/hot_key/hot_key_vm.dart';
import 'package:test01/pages/web_page.dart';

class HotKeyPage extends StatefulWidget {
  @override
  State<HotKeyPage> createState() => _HotKeyPageState();
}

class _HotKeyPageState extends State<HotKeyPage> {
  final viewModel = HotKeyVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getHotListData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotKeyVM>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            this.runtimeType.toString(),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1, color: Colors.blue),
                  bottom: BorderSide(width: 1, color: Colors.black),
                  left: BorderSide(width: 1, color: Colors.black),
                  right: BorderSide(width: 1, color: Colors.black),
                )),
                child: Row(
                  children: [
                    Text('搜索哈哈'),
                    Expanded(child: SizedBox()),
                    Icon(Icons.search),
                  ],
                ),
              ),
              Consumer<HotKeyVM>(builder: (context, vm, child) {
                return _grideViewWidget();
              }),
            ],
          ),
        )),
      ),
    );
  }

  Widget _grideViewWidget() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: viewModel.keys?.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2),
        itemBuilder: (context, idx) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebViewPage(
                  url: "www.baidu.com",
                  title: viewModel.keys?[idx].name,
                );
              }));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Text(viewModel.keys?[idx].name ?? ""),
            ),
          );
        });
  }
}
