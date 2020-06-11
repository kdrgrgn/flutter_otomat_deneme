import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/SignIn/plaka.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/giris_cikis_fonksiyonlari.dart';
import 'package:flutter_otomat_deneme/model/user.dart';

class KayitSayfasi extends StatefulWidget {
  @override
  _KayitSayfasiState createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  bool gozDurumu = true;
  final _formKey = GlobalKey<FormState>();

  bool sehirListele = false;
  bool ilceListele = false;

  Plaka _plaka = Plaka();
  int sehirPlaka;
  // ignore: non_constant_identifier_names
  int _secilen_ilPlaka = 1;

  bool sehirIlce; //hem secilen sehir hem de secilen ilce nin veya larina bakar.Stack isleminde ona gore sitraya sokar

  String _isim;
  List _telNo=[];
  String _secilenSehir = "Lutfen Sehir Seciniz";
  String _secilenIlce = "Lutfen ilce Seciniz";
  String _secilenPlakaOrta;
  String _secilenPlakaSon;
  String _email;
  String _sifre;
  String _mahalle;
  String _adresDetay;
  List _adresKisaIsim=[];

  SignInOutFonk _fonk = SignInOutFonk();




  @override
  Widget build(BuildContext context) {
    sehirIlce = ilceListele || sehirListele;

    return Scaffold(
      //    backgroundColor: Colors.black12,
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
                      "Kayit Ol",
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(

                  onSaved: (String deger) {
                      _isim = deger;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      labelText: "ad",
                      hintText: "Lutfen Adinizi Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (girilenTelNo) {
_telNo.add(girilenTelNo);
                    //  _telNo[0]=girilenTelNo;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone_android),
                      labelText: "Telefon Numarasi",
                      hintText: "Lutfen Telefon Numaranizi Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: <Widget>[Text("* Adres Bilgileri",style: TextStyle(fontSize: 24),)],),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.brown,width: 2.5),borderRadius: BorderRadius.circular(15)),
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
                                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
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
                          style: TextStyle(fontSize: 20, color: Colors.grey[700]),
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

                        _adresDetay =deger;

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
_adresKisaIsim.add(deger);
                              //_adresKisaIsim[0]=deger;

                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.add_circle_outline),
                              labelText: "Adres kisa ismi",
                              hintText: "Lutfen adresinize kisa isim verin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ],

                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "PLAKA orn:34 AAA 1111",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<int>(
                        items: _plaka.plakaOlustur().map((oAnkiPlaka) {
                          return DropdownMenuItem<int>(
                              child: Text("$oAnkiPlaka"), value: oAnkiPlaka);
                        }).toList(),
                        onChanged: (p) {
                          setState(() {
                            _secilen_ilPlaka = p;
                          });
                        },
                        value: _secilen_ilPlaka,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onSaved: (deger) {

                            _secilenPlakaOrta = deger;

                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Text(
                      "/",
                      style: TextStyle(fontSize: 24),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onSaved: (deger) {

                            _secilenPlakaSon = deger;

                        },
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (deger) {

                      _email = deger;

                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.mail),
                      labelText: "E-Mail",
                      hintText: "Lutfen Mailinizi Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (deger) {

                      _sifre = deger;

                  },
                  obscureText: gozDurumu,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(gozDurumu == true
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            gozDurumu = !gozDurumu;
                          });
                        },
                      ),
                      labelText: "Sifre ",
                      hintText: "Lutfen Sifrenizi Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                SizedBox(
                  height: 20,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(),
                          Text(
                            "Kayit ol",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      color: Colors.green,
                      onPressed: () {
                        _kayitOl(context);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(),
                          Text(
                            "Google ile Kayit ol",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Image.asset("images/google-logo.png"),
                        ],
                      ),
                      color: Colors.white,
                      onPressed: () {
                        _googleIleGirisYap(context);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Map<String ,String> adresMapOlustur(){
    return {"${_adresKisaIsim[0]}" : "$_adresDetay , $_mahalle , $_secilenIlce/$_secilenSehir, \n ${_telNo[0].toString()}"};

  }

  Future<void> _kayitOl(BuildContext context) async {
    _formKey.currentState.save();

    debugPrint("kisa isim= ${_adresKisaIsim.toString()} ,  tel no = ${_telNo
        .toString()}");
    try {
     

        User _user = await _fonk.kayitOl(
          context: context,
          isim: _isim,
          email: _email,
          sifre: _sifre,
          adresKisaIsim: _adresKisaIsim,
          adresMap: adresMapOlustur(),
          sehir: _secilenSehir,
          ilce: _secilenIlce,
          mahalle: _mahalle,
          adresDetay: _adresDetay,
          plaka: "${_secilen_ilPlaka
              .toString()}-$_secilenPlakaOrta-$_secilenPlakaSon",
          telNo: _telNo);

      if (_user != null) {
        Navigator.of(context).pop();
      }
    }
    catch(e){
      debugPrint("Hata var kirve = $e");
    }
  }

  Future<void> _googleIleGirisYap(context) async {
    User _user = await _fonk.googleIleGirisYap(context: context);

    if (_user != null) {
      Navigator.of(context).pop();
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
                                  title: Text("${sehir[index]['il']}")
                                  ),
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
