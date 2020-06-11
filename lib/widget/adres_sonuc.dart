import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/crud_islemleri.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'file:///D:/flutterProjesi/flutter_canli_sohbet/flutter_otomat_deneme/lib/widget/Firma_detay.dart';
import 'package:provider/provider.dart';

class AdresSonuc extends StatefulWidget {

  @override
  _AdresSonucState createState() => _AdresSonucState();

}

class _AdresSonucState extends State<AdresSonuc> {
  CrudFonksiyonlari _fonk = CrudFonksiyonlari();
  List<Firma> _firmalar=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getFirma();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Firmalar"),
        actions: <Widget>[
          FlatButton(
            child: Text("getir"),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: _adresSonuc(),
    );
  }

  Widget _adresSonuc() {

    final _firmaModel = Provider.of<UserModel>(context);

    return _firmaModel.state == ViewState.Idle
        ? ListView.builder(
            itemCount: _firmalar.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                child: ListTile(
                  title: Text(_firmalar[index].firmaAdi),
                  subtitle: Text("min 25 ₺ "),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FirmaDetay()));
                  },
                ),
              );
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Future<void> getFirma()  async {
_firmalar.addAll(await _fonk.readFirma(context));

  }
}
