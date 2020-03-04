
import 'package:flutter/material.dart';
class AdresEkle extends StatefulWidget {
  @override
  _AdresEkleState createState() => _AdresEkleState();
}

class _AdresEkleState extends State<AdresEkle> {

  final _formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Adres Ekle"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(

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
                      height: 20,
                    ),

                    TextFormField(

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
          ),
        ),
      ),
    );
  }
}
