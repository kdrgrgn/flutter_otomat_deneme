import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/SignIn/Sign_in_page.dart';
import 'package:flutter_otomat_deneme/SignIn/kayit_sayfasi.dart';

// ignore: must_be_immutable
class MyTabBar extends StatefulWidget {

  int ekranSirasi;
  MyTabBar({this.ekranSirasi:0});

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController _scrollViewController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollViewController = new ScrollController();

    tabController = TabController(length: 2, vsync: this,initialIndex: widget.ekranSirasi);

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _scrollViewController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(



      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (context,innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(

              title: Text("Giris/Kayit Sayfasi"),
              pinned: true,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,  //<-- forceElevated to innerBoxIsScrolled
              bottom: myTabBar(),
            // expandedHeight: 0,

            )
          ];
        },
        body: TabBarView(controller: tabController,children: <Widget>[

          GirisSayfasi(),
          KayitSayfasi(),
        ],),
      ),
    );
  }



  TabBar myTabBar() {
    return TabBar(
    //  isScrollable: true,
        unselectedLabelColor: Colors.white38,
        labelColor: Colors.white,
        controller: tabController,

    //  indicatorColor: Colors.purple,
     // indicatorSize: TabBarIndicatorSize.tab,


        tabs: [
      Tab(icon: Icon(Icons.add_to_home_screen), text: "Giris Yap"),
      Tab(icon: Icon(Icons.save), text: "Kayit ol",),

    ]);
  }


}