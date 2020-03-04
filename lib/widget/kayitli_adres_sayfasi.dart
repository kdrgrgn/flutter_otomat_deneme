import 'package:flutter/material.dart';
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
    final _userModel=Provider.of<UserModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdresEkle()));

      },child: Icon(Icons.add),),
       body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Kayitli Adresler"),
              actions: <Widget>[

              ],
              pinned: true,
              floating: true,
              snap: true,

            ),

            SliverList(delegate: SliverChildBuilderDelegate(_kayitliAdresler,childCount:_userModel.user.adresMap.length)),

          ],
        )

    );
  }

  Widget _kayitliAdresler(BuildContext context,int index) {
    final _userModel=Provider.of<UserModel>(context);
List _adresIsimleri=_userModel.user.adresKisaIsim;
Map _adresDetay =_userModel.user.adresMap;
String _telNo =_userModel.user.telNo[0];
    return Card(
      elevation: 8,
      child: ListTile(
        title: Text("${_adresIsimleri[index]}"),
        subtitle: Text("${_adresDetay[_adresIsimleri[index]]}"),
        trailing: Icon(Icons.edit),
      ),
    );
  }

}
