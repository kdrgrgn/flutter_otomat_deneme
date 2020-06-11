import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/services/auth_base.dart';
import 'package:flutter_otomat_deneme/services/firebase_auth_service.dart';
import 'package:flutter_otomat_deneme/services/firestore_db_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestroeDbService _firestoreDbService = locator<FirestroeDbService>();

  @override
  // ignore: non_constant_identifier_names, missing_return
  Future<User> CreateUserWithEmailAndPassword(
      {@required String isim,
      @required String email,
      @required String sifre,
      @required List telNo,
      @required Map adresMap,
      @required String sehir,
      @required List adresKisaIsim,
      @required String ilce,
      @required String mahalle,
      @required String adresDetay,
      @required String plaka}) async {
    User _user = await _firebaseAuthService.CreateUserWithEmailAndPassword(
        isim: isim,
        email: email,
        sifre: sifre,
        adresMap: adresMap,
        sehir: sehir,
        adresKisaIsim: adresKisaIsim,
        ilce: ilce,
        mahalle: mahalle,
        adresDetay: adresDetay,
        plaka: plaka,
        telNo: telNo);
    bool _sonuc = await _firestoreDbService.SaveUser(_user);
    if (_sonuc) {
      return await _firestoreDbService.readUser(_user.userID);
    } else {
      return null;
    }
  }

  @override
  Future<User> currentUser() async {
    User _user = await _firebaseAuthService.currentUser();
    return await _firestoreDbService.readUser(_user.userID);
  }

  @override
  // ignore: missing_return
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
    User _user =
        await _firebaseAuthService.signInWithEmailAndPassword(email, sifre);
    return await _firestoreDbService.readUser(_user.userID);
  }

  @override
  Future<User> signInWithGoogle() async {
    User _user = await _firebaseAuthService.signInWithGoogle();
    return _user;

    /*  bool _sonuc = await _firestoreDbService.SaveUser(_user);
    if (_sonuc) {
      return await _user;
    } else {
      return null;
    }*/
  }

  @override
  // ignore: missing_return
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }
  // ignore: non_constant_identifier_names, missing_return
  Future<bool> adresEkle({
    @required  User user

/*    @required List telNo,
    @required Map adresMap,
    @required List adresKisaIsim,*/
  }) async {

    bool sonuc= await _firestoreDbService.update(user);
    if(sonuc) {
      return sonuc;
    }
    else{
      return false;
    }
  }

}
