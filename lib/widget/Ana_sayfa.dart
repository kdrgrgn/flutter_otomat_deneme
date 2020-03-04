import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/SignIn/Tab_bar.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/Firma_detay.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/adres_sonuc.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/kayitli_adres_sayfasi.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    return _userModel.user!=null?Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Ana Sayfa"),
            actions: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Text(
                      "${_userModel.user.name.toLowerCase()}",
                  style: TextStyle(fontSize: 20),
                ),
              ))
            ],
            pinned: true,
            floating: true,
            snap: true,
          ),
          SliverList(delegate: SliverChildListDelegate(_ustAdresButon())),

          SliverList(
              delegate: SliverChildListDelegate(
                  _baslik(baslik: "Onceki Hizmetlerim"))),

          SliverList(
              delegate:
                  SliverChildBuilderDelegate(_oncekiHizmetler, childCount: 3)),

          SliverList(
              delegate: SliverChildListDelegate(
                  _baslik(baslik: "Favorilerim", icon: Icons.star))),

          SliverList(
              delegate: SliverChildBuilderDelegate(_favoriler, childCount: 5)),

          //Alt Bosluk
          SliverList(delegate: SliverChildListDelegate(_bosluk())),
        ],
      )),
    ): RaisedButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar()));
    },child: Text("Once bir giris yap sana ne gosterecem"),color: Colors.yellow,);

  }

  Widget _oncekiHizmetler(BuildContext context, int index) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FirmaDetay()));
        },
        title: Text("Kdrgrgn oto yikama"),
        subtitle: Text("ic-dis yikama"),
        trailing: Text("38 ₺"),
      ),
    );
  }

  Widget _favoriler(BuildContext context, int index) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FirmaDetay()));
        },
        title: Text("Kdrgrgn oto yikama"),
        subtitle: Text("ic-dis yikama"),
        trailing: Text("38 ₺"),
      ),
    );
  }

  List<Widget> _ustAdresButon() {
    final _userModel = Provider.of<UserModel>(context);

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => KayitliAdresSayfasi()));
                  },
                  child: Container(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(" " + "${_userModel.user.adresKisaIsim[0]}"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(
                        MaterialPageRoute(builder: (context) => AdresSonuc()));
                  },
                  child: Container(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          " adresi icin hizmetleri goruntule",
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      )
    ];
  }

  List<Widget> _baslik({IconData icon, @required String baslik}) {
    return [
      Row(
        children: <Widget>[
          icon == null ? Text(" ") : Icon(icon),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              baslik,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _bosluk() {
    return [
      SizedBox(
        height: 60,
      )
    ];
  }
}
