import 'package:flutter/material.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/Ana_sayfa.dart';
import 'package:flutter_otomat_deneme/SignIn/Hesabim_menu_sayfasi.dart';
import 'package:flutter_otomat_deneme/MyBottomNav/my_bottom_nav.dart';
import 'package:flutter_otomat_deneme/MyBottomNav/tab_items.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/arama_sayfasi.dart';

class LandingPage extends StatefulWidget {

  
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  TabItem currentTab=TabItem.AnaSayfa;




  Map<TabItem,GlobalKey<NavigatorState>> navigatorKeys={
    TabItem.AnaSayfa:GlobalKey<NavigatorState>(),
    TabItem.Arama:GlobalKey<NavigatorState>(),
    TabItem.Profil:GlobalKey<NavigatorState>(),
  };


  Map<TabItem,Widget> tumSayfalar(){
    return {
      TabItem.AnaSayfa:AnaSayfa(),
      TabItem.Arama:AramaSayfasi(),
      TabItem.Profil:HesabimMenu()

    };
  }




  @override
  Widget build(BuildContext context) {




    return WillPopScope(
      onWillPop: () async =>!await navigatorKeys[currentTab].currentState.maybePop(),

      child:  BottomNavMenu(navigatorKeys: navigatorKeys,sayfaOlusturucu: tumSayfalar(),currentTab: currentTab, onSelectedTab: (secilenTab){

        if(secilenTab==currentTab){
         // navigatorKeys[secilenTab].currentState.popUntil((route)=>route);
          navigatorKeys[secilenTab].currentState.maybePop();
        }
        else{
          setState(() {
            currentTab=secilenTab;
          });


        }



      },),

    );



  }

  

}
