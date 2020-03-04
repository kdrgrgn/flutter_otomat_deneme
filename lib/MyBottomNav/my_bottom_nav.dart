import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/MyBottomNav/tab_items.dart';

class BottomNavMenu extends StatefulWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlusturucu;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;



  BottomNavMenu(
      {Key key,
       // this.initialIndex:0,
        @required this.currentTab,
        @required this.onSelectedTab,
        @required this.sayfaOlusturucu,
        @required this.navigatorKeys,})
      : super(key: key);

  @override
  _BottomNavMenuState createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [

          _navItemOlustur(TabItem.AnaSayfa),
          _navItemOlustur(TabItem.Arama),
          _navItemOlustur(TabItem.Profil),
        ],
        onTap: (index) => widget.onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: widget.navigatorKeys[gosterilecekItem],
          builder: (context) {
            return widget.sayfaOlusturucu[gosterilecekItem];
          },
        );
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(olusturulacakTab.icon),
      title: Text(olusturulacakTab.title),
    );
  }
}























/*


import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/Ana_sayfa.dart';
import 'package:flutter_otomat_deneme/SignIn/Sign_in_page.dart';
enum TabItem{AnaSayfa,Profil}

class MyBottomNav extends StatefulWidget {
  @override
  _MyBottomNavState createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  TabItem _currentTab=TabItem.AnaSayfa;

  @override
  Widget build(BuildContext context) {
    return
     Theme(

        data:ThemeData(
            primarySwatch: Colors.blueGrey
        ) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              //  height: 30,

              color: Colors.white,




              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.home), iconSize: 30,onPressed: (){
                    _currentTab=TabItem.AnaSayfa;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnaSayfa()));
                  },color:_currentTab==TabItem.AnaSayfa?Colors.black:Colors.grey[600]),

                  IconButton(icon: Icon(Icons.account_circle), iconSize: 30,onPressed: (){
                    _currentTab=TabItem.Profil;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GirisSayfasi()));

                  }, color:_currentTab==TabItem.Profil?Colors.black:Colors.grey[600],),


                ],
              ),



            ),
          ],
        ),

      );
      
  }

  


  }


*/


