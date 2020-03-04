import 'package:flutter/material.dart';

class FirmaDetay extends StatefulWidget {
  @override
  _FirmaDetayState createState() => _FirmaDetayState();
}

class _FirmaDetayState extends State<FirmaDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Kdrgrgn oto yikama"),
              actions: <Widget>[

              ],
              pinned: true,
              floating: true,
              snap: true,

            ),

            SliverList(delegate: SliverChildBuilderDelegate(_firmaDetay,childCount: 12)),


            //Alt Bosluk
            SliverList(delegate: SliverChildListDelegate(_bosluk())),

          ],
        )

    );

  }

  Widget _firmaDetay(BuildContext context, int index) {
    return Card(
      elevation: 8,
      child: ListTile(
        title: Text("Kdrgrgn Oto yikama"),
        subtitle: Text("ic-dis yikama  "),
        trailing: Text("35" +" ₺"),

      ),

    );
  }

  List<Widget> _bosluk() {
    return [
      SizedBox(
        height: 60,
      )
    ];
  }
}
