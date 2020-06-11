import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/crud_islemleri.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'package:flutter_otomat_deneme/widget/Adres_ekle.dart';
import 'package:provider/provider.dart';

class KayitliAdresSayfasi extends StatefulWidget {
  @override
  _KayitliAdresSayfasiState createState() => _KayitliAdresSayfasiState();
}

class _KayitliAdresSayfasiState extends State<KayitliAdresSayfasi> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    User _user = _userModel.user;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AdresEkle()));
          },
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Kayitli Adresler"),
              actions: <Widget>[],
              pinned: true,
              floating: true,
              snap: true,
            ),
            _user.adresMap.isEmpty
                ?
            SliverList(
                delegate: SliverChildListDelegate(
                    yazi(baslik: "Kayitli Adres Yok Lutfen adres ekleyiniz")))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(_kayitliAdresler,
                        childCount: _user.adresMap.length)),
          ],
        ));
  }

  Widget _kayitliAdresler(BuildContext context, int index) {
    final _userModel = Provider.of<UserModel>(context);
    List _adresIsimleri = _userModel.user.adresKisaIsim;
    Map _adresDetay = _userModel.user.adresMap;
    //String _telNo = _userModel.user.telNo[0];
    CrudFonksiyonlari _fonk = CrudFonksiyonlari();
    return Dismissible(
      key: Key(index.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _adresDetay.remove(_adresIsimleri[index]);
        _adresIsimleri.removeAt(index);
        _userModel.user.adresKisaIsim = _adresIsimleri;
        _userModel.user.adresMap = _adresDetay;
        _fonk.userUpdate(context: context, user: _userModel.user);
      },
      child: Card(
        elevation: 8,
        child: ListTile(
          title: Text("${_adresIsimleri[index]}"),
          subtitle: Text("${_adresDetay[_adresIsimleri[index]]}"),
          trailing: Icon(Icons.edit),
        ),
      ),
    );
  }
  List<Widget> yazi({IconData icon, @required String baslik}) {
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

}
