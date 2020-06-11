import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/crud_islemleri.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'package:provider/provider.dart';

class AdresEkle extends StatefulWidget {
  @override
  _AdresEkleState createState() => _AdresEkleState();
}

class _AdresEkleState extends State<AdresEkle> {
  final _formKey = GlobalKey<FormState>();
  final _dialogFormKey = GlobalKey<FormState>();

  bool sehirListele = false;
  bool ilceListele = false;

  int sehirPlaka;

  bool
      sehirIlce; //hem secilen sehir hem de secilen ilce nin veya larina bakar.Stack isleminde ona gore sitraya sokar

  String _secilenSehir = "Lutfen Sehir Seciniz";
  String _secilenIlce = "Lutfen ilce Seciniz";
  String _mahalle;
  String _adresDetay;
  List _adresKisaIsim;
  String secilenDeger;
  String simdikiAdresIsmi;

  CrudFonksiyonlari _fonk = CrudFonksiyonlari();
  bool dialogCikar=false;


  @override
  Widget build(BuildContext context) {
    sehirIlce = ilceListele || sehirListele;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Stack(
              children: sehirIlce == false
                  ? <Widget>[
                      il_ilceGoruntule(context),
                      kayitSayfam(context),
                    ]
                  : <Widget>[
                      kayitSayfam(context),
                      il_ilceGoruntule(context),
                    ])),
    );
  }

  Padding kayitSayfam(BuildContext context) {
    final _usermodel = Provider.of<UserModel>(context);
    _adresKisaIsim = _usermodel.user.adresKisaIsim;
  List  _telNo = _usermodel.user.telNo;
    if(_usermodel.user.telNo.isEmpty){
        dialogCikar=true;

    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Adres Ekle",
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                dialogCikar == true
                    ? Form(
                  key: _dialogFormKey,
                      child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.phone_android),
                                    labelText: "Telefon Numarasi",
                                    hintText: "Lutfen Telefon numaranizi giriniz",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                onSaved: (deger) {
                                  _telNo.add(deger);


                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                      icon: Icon(Icons.save), onPressed: (){
                                        _dialogFormKey.currentState.save();
                                        _usermodel.user.telNo=_telNo;

                                        debugPrint(_telNo.toString());
                                        setState(() {
                                          dialogCikar=false;
                                        });


                                  }),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    icon: Icon(Icons.subdirectory_arrow_left), onPressed: (){
                                      setState(() {
                                        dialogCikar=false;
                                      });

                                }),
                              ),
                            )
                          ],
                        ),
                    )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Tel No",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.white,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    items: _usermodel.user.telNo.map((oAnTel) {
                                      return DropdownMenuItem<String>(
                                          child: Container(
                                              color: Colors.white,
                                              child: Text("$oAnTel")),
                                          value: oAnTel);
                                    }).toList(),
                                    onChanged: (p) {
                                      setState(() {
                                        secilenDeger = p;
                                      });
                                    },
                                    value: secilenDeger,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        dialogCikar = true;
                                      });
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                Row(
                  children: <Widget>[
                    Text(
                      "* Adres Bilgileri",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown, width: 2.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Sehir",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    sehirListele = !sehirListele;
                                  });
                                },
                                child: Text("$_secilenSehir"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                "ilce",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_secilenSehir != "Lutfen Sehir Seciniz") {
                                    setState(() {
                                      ilceListele = !ilceListele;
                                    });
                                  }
                                },
                                child: Text("$_secilenIlce"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (deger) {
                            _mahalle = deger;
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.location_on),
                              labelText: "Mahalle Ismi",
                              hintText: "Lutfen Mahalle ismini giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (deger) {
                            _adresDetay = deger;
                          },
                          maxLines: 3,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.location_city),
                              labelText: "Adres detaylari",
                              hintText:
                                  "Lutfen girdiginiz bilgiler haricinde adresinizin detayini giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onSaved: (deger) {
                            /*   int index= _usermodel.user.adresKisaIsim.length;
                            _adresKisaIsim.insert(index, deger);*/
                            simdikiAdresIsmi = deger;
                            _adresKisaIsim.add(deger);
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.add_circle_outline),
                              labelText: "Adres kisa ismi",
                              hintText: "Lutfen adresinize kisa isim verin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(),
                                  Text(
                                    "Adresi kayit et",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                              color: Colors.green,
                              onPressed: () {
                                _adresEkle(context);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, String> adresMapOlustur() {
    return {
      "$simdikiAdresIsmi":
          "$_adresDetay , $_mahalle , $_secilenIlce/$_secilenSehir, \n $secilenDeger"
    };
  }

  Future<void> _adresEkle(context) async {
    _formKey.currentState.save();
    final _usermodel = Provider.of<UserModel>(context);
    _usermodel.user.adresKisaIsim = _adresKisaIsim;
    User _user = _usermodel.user;
    _user.adresMap.addAll(adresMapOlustur());

    bool sonuc = await _fonk.userUpdate(context: context, user: _user);
    if (sonuc) {
      Navigator.of(context).pop();
    } else {
      debugPrint("en basta hata var");
    }
  }

  // ignore: non_constant_identifier_names
  il_ilceGoruntule(BuildContext context) {
    List sehir;
    List ilceler;

    if (sehirListele == true) {
      return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          setState(() {
            sehirListele = false;
          });
        },
        child: Opacity(
          opacity: 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/il.json"),
                  builder: (context, cevap) {
                    sehir = json.decode(cevap.data.toString());
                    return ListView.builder(
                        itemCount: sehir == null ? 0 : sehir.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: Card(
                              child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      _secilenSehir =
                                          sehir[index]['il'].toString();
                                      sehirPlaka = sehir[index]['plaka'];
                                      sehirListele = false;
                                      debugPrint(
                                          "sehir=$_secilenSehir, plaka = $sehirPlaka");
                                    });
                                  },
                                  title: Text("${sehir[index]['il']}")),
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ),
        ),
      );
    } else if (ilceListele == true) {
      return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          setState(() {
            ilceListele = false;
          });
        },
        child: Opacity(
          opacity: 0.9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Container(
              color: Colors.white,
              child: Center(
                child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/ilceler.json"),
                  builder: (context, cevap) {
                    if (cevap.connectionState == ConnectionState.done) {
                      sehir = json.decode(cevap.data.toString());
                      ilceler = ilceListeleme(sehir, ilceler);
                    }
                    // ignore: missing_return
                    return ilceler == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: ilceler.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        _secilenIlce = ilceler[index];
                                        ilceListele = false;
                                      });
                                    },
                                    title: Text("${ilceler[index]}")),
                              );
                            });
                  },
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  List ilceListeleme(List sehir, List ilceler) {
    for (var i = 0; i < 81; i++) {
      // ignore: missing_return
      if (sehir[i]['plaka'] == sehirPlaka) {
        ilceler = sehir[i]['ilceleri'];

        debugPrint("$ilceler");
      } else {
        continue;
      }
    }
    return ilceler;
  }
}
