import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:test01/pages/homepage.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState1();
}

class HomePageState1 extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              child: _setupBanner(),
              padding: EdgeInsets.all(12),
            ),
            Expanded(
              child: _listView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setupBanner() {
    return Swiper(
      itemCount: 3,
      autoplay: true,
      pagination: SwiperPagination(),
      itemBuilder: (context, index) {
        return Container(
          color: _randomColor(),
        );
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, idx) {
          return Container(
            color: _randomColor(),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                        "https://avatars.githubusercontent.com/u/58611?s=64&v=4"),
                    Text("李哥最大"),
                    Expanded(child: SizedBox()),
                    Text("2025-02-22 12:12"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("测试代码")
                  ],
                )
              ],
            ),
          );
        });
  }

  Color _randomColor() {
    Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }
}
