import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _header(),
          _itemView("我的收藏", () {}),
          _itemView("我的收藏", () {}),
          _itemView("我的测试", () {}),
        ],
      )),
    );
  }

  Widget _header() {
    const String avatar =
        "https://i0.hdslb.com/bfs/face/85960a5bde9436c9ebc96c1ef3beb3b9e010fec3.jpg@96w_96h_1c_1s_!web-avatar.avif";
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.green[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              avatar,
              width: 80,
              height: 80,
              // color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('未登录')
        ],
      ),
    );
  }

  Widget _itemView(String? title, GestureTapCallback? callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: double.infinity,
        height: 40,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title ?? "没有"),
            Icon(Icons.arrow_circle_right),
          ],
        ),
      ),
    );
  }
}
