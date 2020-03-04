import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/services/auth_base.dart';
import 'package:flutter_otomat_deneme/services/firestore_db_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirestroeDbService _firestoreDbService = locator<FirestroeDbService>();

  User _userFromFirebase(
      {@required FirebaseUser user,
      String isim,
      List telNo,
      Map adresMap,
      String sehir,
      List adresKisaIsim,
      String ilce,
      String mahalle,
      String adresDetay,
      String plaka}) {
    if (isim != null) {
      if (user == null) return null;
      return User(
          userID: user.uid,
          email: user.email,
          name: isim,
          plaka: plaka,
          adresMap: adresMap,
          sehir: sehir,
          adresKisaIsim: adresKisaIsim,
          ilce: ilce,
          mahalle: mahalle,
          adresDetay: adresDetay,
          telNo: telNo);
    } else {
      if (user == null) return null;

      return User(userID: user.uid, email: user.email, name: user.displayName);
    }
  }

  @override
  // ignore: non_constant_identifier_names, missing_return
  Future<User> CreateUserWithEmailAndPassword(
      {@required String isim,
      @required String email,
      @required String sifre,
      @required List telNo,
      @required List adresKisaIsim,
      @required Map adresMap,
      @required String sehir,
      @required String ilce,
      @required String mahalle,
      @required String adresDetay,
      @required String plaka}) async {
    AuthResult sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: sifre);

    return _userFromFirebase(
      user: sonuc.user,
      isim: isim,
      adresMap: adresMap,
      sehir: sehir,
      ilce: ilce,
      adresKisaIsim: adresKisaIsim,
      mahalle: mahalle,
      adresDetay: adresDetay,
      plaka: plaka,
      telNo: telNo,
    );
  }

  @override
  // ignore: missing_return
  Future<User> currentUser() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();

      return _userFromFirebase(user: user);
    } catch (e) {
      print("hata cikti" + e.toString());
      return null;
    }
  }

  @override
  // ignore: missing_return
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
    try {
      AuthResult sonuc = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: sifre);
      return _userFromFirebase(user: sonuc.user);
    } catch (e) {
      debugPrint("firebase authservice email giris hata var " + e.toString());
      return null;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;

      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        AuthResult sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        FirebaseUser _firebaseUser = sonuc.user;

        User _user = await _firestoreDbService.ReadUser(_firebaseUser.uid);
        if (_user == null) {
          _user = _userFromFirebase(user: _firebaseUser);
          bool _sonuc = await _firestoreDbService.SaveUser(_user);
          _user = await _firestoreDbService.ReadUser(_user.userID);
          return _user;
        } else {
          return _user;
        }
//
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  // ignore: missing_return
  Future<bool> signOut() async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();

      await _firebaseAuth.signOut();

      return true;
    } catch (e) {
      print("Sign out hata=" + e.toString());
      return false;
    }
  }
}
