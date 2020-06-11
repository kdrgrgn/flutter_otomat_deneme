import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/SignIn/Tab_bar.dart';
import 'package:flutter_otomat_deneme/basitFonksiyonlar/giris_cikis_fonksiyonlari.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'package:provider/provider.dart';

class HesabimMenu extends StatefulWidget {
  @override
  _HesabimMenuState createState() => _HesabimMenuState();
}

class _HesabimMenuState extends State<HesabimMenu> {
  SignInOutFonk _fonk=SignInOutFonk();

final TextStyle yaziStil=TextStyle(fontSize: 20,fontWeight: FontWeight.w400);

final Color borderColor=Colors.grey[400];
final Color decorationColor=Colors.white;

  @override
  Widget build(BuildContext context) {
    final _usermodel=Provider.of<UserModel>(context);
    ViewState _state=ViewState.Busy;

    return _usermodel.state==_state?Container(color:Colors.white,child: Center(child: CircularProgressIndicator(),)):Scaffold(
backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Hesabim"),
      ),
      body: ListView(




        children: <Widget>[
          Container(

            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,color: borderColor))
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Hesabim",style: TextStyle(fontSize: 35,fontStyle: FontStyle.italic),),
            ),
          ),
          _usermodel.user==null?Column(
            children: <Widget>[
              Container(
                //   height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(width: 2,color: borderColor))
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                  title: Text("Giris Yap",style: yaziStil),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar()));

                  },
                ),
              ),
              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(width: 2,color: borderColor))
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
                  title: Text("Kayit Ol",style: yaziStil,),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar(ekranSirasi: 1,)));

                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(width: 2,color: borderColor)),
                ),
                child: ListTile(
                  trailing: Image.asset("images/google-logo.png"),
                  title: Text("Google ile giris yap",style: yaziStil,),
                  onTap: ()=>googleIleGiris(context),


                ),
              ),

            ],
          ):Column(
            children: <Widget>[
              Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(width: 2,color: borderColor))
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
                  title: Text("Profilim",style: yaziStil,),
                  onTap: (){

                  },
                ),
              ),
              Container(

                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border(bottom: BorderSide(width: 2,color: borderColor))
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
                  title: Text("Cikis Yap",style: yaziStil,),
                  onTap: (){
                    cikisYap(context);

                  },
                ),
              ),
            ],
          ),
          

          SizedBox(
            height: 50,
            child: Container(color: Colors.black12,),
          ),




          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,color: borderColor))
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Yardim",style: TextStyle(fontSize: 35,fontStyle: FontStyle.italic),),
            ),
          ),

    Container(

    decoration: BoxDecoration(
    color: Colors.white,
    border: Border(bottom: BorderSide(width: 2,color: borderColor))
    ),
    child: ListTile(
    trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
    title: Text("Sik Sorulan Sorular",style: yaziStil,),
    onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar(ekranSirasi: 1,)));

    },
    ),
    ),

          Container(

            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,color: borderColor))
            ),
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
              title: Text("Iletisim",style: yaziStil,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar(ekranSirasi: 1,)));

              },
            ),
          ),

          Container(

            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,color: borderColor))
            ),
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
              title: Text("Kampanyalar",style: yaziStil,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyTabBar(ekranSirasi: 1,)));

              },
            ),
          ),
          Container(

            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 2,color: borderColor))
            ),
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black,),
              title: Text("Onerileriniz",style: yaziStil,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(fullscreenDialog:false,builder: (context)=>MyTabBar(ekranSirasi: 1,)));

              },
            ),
          ),



        ],
      ),
    );
  }

Future<void> googleIleGiris(BuildContext  context) async{
   _fonk.googleIleGirisYap(context: context);

  }

  Future<void> cikisYap(BuildContext context) async{
    _fonk.cikisYap(context: context);

  }
}
