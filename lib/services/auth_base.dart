import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/model/user.dart';

abstract class AuthBase {
  Future<User> currentUser();

  Future<bool> signOut(); //ok
  Future<User> signInWithGoogle(); //ok
  Future<User> signInWithEmailAndPassword(String email, String sifre); //ok
// ignore: non_constant_identifier_names
  Future<User> CreateUserWithEmailAndPassword({
    @required String isim,
    @required String email,
    @required String sifre,
/*    @required String telNo,
    @required String sehir,
    @required String ilce,
    @required String mahalle,
    @required String adresDetay,*/
    @required String plaka
  }); //ok

}
