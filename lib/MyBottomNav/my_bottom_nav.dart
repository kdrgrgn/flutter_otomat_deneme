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
