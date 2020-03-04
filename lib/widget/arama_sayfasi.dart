import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/widget/Firma_detay.dart';

class AramaSayfasi extends StatefulWidget {
  @override
  _AramaSayfasiState createState() => _AramaSayfasiState();
}

class _AramaSayfasiState extends State<AramaSayfasi> {
  final _formKey = GlobalKey<FormState>();

  var _width = 0.0;
  var _height = 0.0;
  var yazi;
ScrollController _scrollController;
@override
  void initState() {

_scrollController=FixedExtentScrollController(initialItem: 2);
    super.initState();
  }

  @override
  void dispose() {
_scrollController.dispose();
super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    debugPrint("deger = $yazi");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 11),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (deger) {
                      setState(() {
                        yazi=deger;
                        _width = MediaQuery.of(context).size.width;
                        _height = MediaQuery.of(context).size.height;
                      });
                    },
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Aramak istediginizi girin",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: _height,
                  width: _width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: _height == 0.0 ? null:ListWheelScrollView.useDelegate(
                    controller: _scrollController,
                      diameterRatio: 3,
                      itemExtent: 100,
                      childDelegate: ListWheelChildBuilderDelegate(
                          builder: _oncekiHizmetler, childCount: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _oncekiHizmetler(BuildContext context, int index) {
    // ignore: missing_return
    return  Card(
      elevation: 5,
      child: ListTile(
       onTap: (){
          Navigator.of( context)
              .push(MaterialPageRoute(builder: (BuildContext context) => FirmaDetay()));
        },
        title: Text("Kdrgrgn oto yikama"),
        subtitle: Text("ic-dis yikama"),
        trailing: Text("38 ₺"),
      ),
    );




    /*ListView.builder(
      controller: _scrollController,
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text("Kdrgrgn oto yikama"),
                subtitle: Text("ic-dis yikama"),
                trailing: Text("38 ₺"),
              ),
              Divider(
                height: 2,
                thickness: 3,
              )
            ],
          );
        });*/






    /*Column(
      children: <Widget>[
        Card(
          elevation: 4,
          child: ListTile(
            title: Text("Kdrgrgn oto yikama"),
            subtitle: Text("ic-dis yikama"),
            trailing: Text("38 ₺"),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: Text("Kdrgrgn oto yikama"),
            subtitle: Text("ic-dis yikama"),
            trailing: Text("38 ₺"),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: Text("Kdrgrgn oto yikama"),
            subtitle: Text("ic-dis yikama"),
            trailing: Text("38 ₺"),
          ),
        ),
      ],
    );*/
  }

}
