import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:test01/pages/home_model.dart';
import 'package:test01/pages/home_view_model.dart';
import 'package:test01/pages/web_page.dart';
import 'package:test01/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getBanner();
    viewModel.getHomeList();
    // initBannerData();
  }

  // void initBannerData() async {
  //   bannerList = await HomeViewModel.getBanner();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('顶部nav'),
        ),
        body: Container(
          // color: Colors.gr,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _banner(),
                _listView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      print('_listView刷新了');
      return ListView.builder(
        itemCount: vm.listDatas?.length ?? 0,
        itemBuilder: (context, index) {
          return _listItemView(index);
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    });
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        print('banner刷新');

        return Container(
          width: double.infinity,
          height: 150,
          child: Swiper(
            indicatorLayout: PageIndicatorLayout.COLOR,
            pagination: SwiperPagination(),
            control: SwiperControl(),
            autoplay: true,
            itemCount: vm.bannerList?.length ?? 0,
            itemBuilder: (context, idxd) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Colors.lightBlue,
                child: Image.network(
                  vm.bannerList?[idxd].imagePath ?? "",
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _listItemView(int index) {
    var name;
    if (viewModel.listDatas?[index].author?.isNotEmpty == true) {
      name = viewModel.listDatas?[index].author ?? "";
    } else {
      print('为空了');
      name = viewModel.listDatas?[index].shareUser ?? "";
    }
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, RoutePath.webViewPage);
        Navigator.pushNamed(context, RoutePath.webViewPage,
            arguments: {"name": "沃日你姐"});
      },
      child: Container(
        // height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 119, 102, 102),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/58611?s=64&v=4',
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Text(
                  viewModel.listDatas?[index].niceDate ?? "",
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  '置顶',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 30),
                ),
              ],
            ),
            Text(
              viewModel.listDatas?[index].title ?? "",
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Text(
                  viewModel.listDatas?[index].chapterName ?? "",
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                Expanded(child: SizedBox()),
                Image.asset(
                  'lib/assets/images/test_collect@2x.png',
                  width: 30,
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
