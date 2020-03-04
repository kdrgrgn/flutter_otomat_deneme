import 'package:flutter/material.dart';

enum TabItem{AnaSayfa,Arama,Profil}

class TabItemData {
  

  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem,TabItemData> tumTablar={
    TabItem.AnaSayfa:TabItemData("AnaSayfa",Icons.home,),
    TabItem.Arama:TabItemData("Ara",Icons.search,),
    TabItem.Profil:TabItemData("Profil",Icons.account_circle),
  };




}
