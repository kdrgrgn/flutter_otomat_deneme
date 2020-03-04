import 'package:flutter/material.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/Firma_detay.dart';

class AdresSonuc extends StatefulWidget {
  @override
  _AdresSonucState createState() => _AdresSonucState();
}

class _AdresSonucState extends State<AdresSonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: 
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Hizmetinizdekiler"),
              actions: <Widget>[

              ],
              pinned: true,
              floating: true,
              snap: true,

            ),

            SliverList(delegate: SliverChildBuilderDelegate(_adresSonuc,childCount: 5)),


          ],
        )

        );
  }

  Widget _adresSonuc(BuildContext context, int index) {
    return 

    Card(
      elevation: 8,
      child: ListTile(
        title: Text("Kdrgrgn Oto yikama"),
        subtitle: Text("min 25 ₺ "),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FirmaDetay()));
        },
      ),
    );
  }
}
