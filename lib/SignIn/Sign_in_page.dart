import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otomat_deneme/SignIn/kayit_sayfasi.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/giris_cikis_fonksiyonlari.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  bool gozDurumu=true;
  String _email;
  String _sifre;

SignInOutFonk _fonk=SignInOutFonk();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:Padding(
          padding: const EdgeInsets.all(20.0),

      child: Container(
        child: SingleChildScrollView(
            child: Form(
              child: Column(




                mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

Row(
  children: <Widget>[
          Text("Giris Yap",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
  ],
),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    onChanged: (deger){
                      setState(() {
                        _email=deger;
                      });
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
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (deger){
                      setState(() {
                        _sifre=deger;
                      });
                    },
                    obscureText: gozDurumu,
                    decoration: InputDecoration(

                        suffixIcon: IconButton(icon: Icon(gozDurumu==false?Icons.visibility:Icons.visibility_off),onPressed: (){
                          setState(() {
                            gozDurumu= !gozDurumu;
                          });
                        },),
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
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(),

                            Text("Giris Yap",style: TextStyle(fontSize: 18,),),
                            Icon(Icons.arrow_forward),

                          ],
                        ),
                        color: Colors.green,

                        onPressed: (){
girisYap(context);
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
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(),

                            Text("Google ile Giris Yap",style: TextStyle(fontSize: 18,),),

                            Image.asset("images/google-logo.png"),

                          ],
                        ),
                        color: Colors.white,

                        onPressed: (){
_googleIleGirisYap(context);
                        },
                      ),
                    ),
                  ) ,
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:Text("Sifremi Unuttum!"),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>KayitSayfasi()));

                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
      ),
      )



    );
  }

  Future<void> _googleIleGirisYap(context) async{
    User _user=await _fonk.googleIleGirisYap(context: context);

    if(_user!=null){
      Navigator.of(context).pop();

    }

  }

  Future<void> girisYap(BuildContext context) async {
    User _user=await _fonk.girisYap(context: context  , email: _email, sifre: _sifre);

    if(_user!=null){
      Navigator.of(context).pop();

    }
  }
}
