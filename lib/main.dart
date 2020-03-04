import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/landing_page.dart';
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';

import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            canvasColor: Colors.white60,
            primarySwatch: Colors.brown,
          ),
          home: LandingPage() //LandingPage(),
          ),
    );
  }
}
