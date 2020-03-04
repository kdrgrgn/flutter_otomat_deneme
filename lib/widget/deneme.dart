/*
NestedScrollView(
controller: _scrollViewController,
headerSliverBuilder: (context,innerBoxIsScrolled){
return <Widget>[
SliverAppBar(
title: Text("Ana Sayfa"),
actions: <Widget>[
Center(
child: Padding(
padding: const EdgeInsets.only(right: 3),
child: Text(
"Abdulkadir gorgun",
style: TextStyle(fontSize: 20),
),
))
],
//  title: ekranBaslik(),
pinned: true,
floating: true,
snap: true,
forceElevated: innerBoxIsScrolled,  //<-- forceElevated to innerBoxIsScrolled

)
];
},
body: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,

children: <Widget>[
Row(

children: <Widget>[
Expanded(
flex: 1,
child: FlatButton(
padding: EdgeInsets.all(0),
color: Colors.yellow,
onPressed: () {},
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

children: <Widget>[
Text(" "+"Evimaa"),

Icon(Icons.arrow_drop_down)
],
),
),
),

Expanded(
flex: 3,
child: FlatButton(
padding: EdgeInsets.all(0),

onPressed: () {},
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Text(
" adresi icin hizmetleri goruntule",
),
Icon(Icons.search)
],
),
color: Colors.white,
),
),
],
),


Padding(
padding: const EdgeInsets.all(4.0),
child: Text(
"Onceki Hizmetler",
style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
),
),
SliverList(delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,childCount: 3))


],
),
)*/
