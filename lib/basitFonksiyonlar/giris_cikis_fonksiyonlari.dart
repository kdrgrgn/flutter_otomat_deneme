import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'package:provider/provider.dart';

class SignInOutFonk {



  Future<User> googleIleGirisYap({@required BuildContext context}) async {
    final _userModel = Provider.of<UserModel>(context);

    User user = await _userModel.signInWithGoogle();
    return user;
  }

  Future<bool> cikisYap({@required BuildContext context}) async {
    final _userModel = Provider.of<UserModel>(context);

    return await _userModel.signOut();
  }

  Future<User> girisYap(
      {@required BuildContext context,
      @required String email,
      @required String sifre}) async {
    final _userModel = Provider.of<UserModel>(context);

    return await _userModel.signInWithEmailAndPassword(email, sifre);
  }

  Future<User> kayitOl(
      {@required String isim,
      @required String email,
      @required String sifre,
      @required BuildContext context,
      @required List telNo,
      @required List adresKisaIsim,
      @required Map adresMap,
      @required String sehir,
      @required String ilce,
      @required String mahalle,
      @required String adresDetay,
      @required String plaka}) async {
    final _userModel = Provider.of<UserModel>(context);
    User user = await _userModel.CreateUserWithEmailAndPassword(
        isim: isim,
        email: email,
        sifre: sifre,
        adresKisaIsim: adresKisaIsim,
        adresMap: adresMap,
        sehir: sehir,
        ilce: ilce,
        mahalle: mahalle,
        adresDetay: adresDetay,
        plaka: plaka,
        telNo: telNo);
    return user;
  }
}
