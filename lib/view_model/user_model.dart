import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/Repository/Firma_repository.dart';
import 'package:flutter_otomat_deneme/Repository/User_repository.dart';
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  FirmaRepository _firmaRepository=locator<FirmaRepository>();
  User _user;




  User get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("View model current user da hata var" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

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
    try {
      state = ViewState.Busy;
      _user = await _userRepository.CreateUserWithEmailAndPassword(
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

      return _user;
    } catch (e) {
      debugPrint(
          "View model kullanici olusutrrmada  da hata var" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  // ignore: missing_return
  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailAndPassword(email, sifre);

      return _user;
    } catch (e) {
      debugPrint("View model email giris hata var " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      return _user;
    } catch (e) {
      debugPrint("View model google  giris hata var " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  // ignore: missing_return
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;

      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("View model current user da hata var" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  // ignore: non_constant_identifier_names, missing_return
  Future<bool> adresEkle({
    @required  User user

    /*   @required List telNo,
    @required Map adresMap,
    @required List adresKisaIsim,*/
  }) async {
    try {
      state = ViewState.Busy;
     bool sonuc = await _userRepository.adresEkle(
        user:user);
         /* adresKisaIsim: adresKisaIsim, adresMap: adresMap, telNo: telNo*/

      return sonuc;
    } catch (e) {
      debugPrint(
          "View model kullanici olusutrrmada  da hata var" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }


  Future<List<Firma>> readFirma() async {
    try {
      state = ViewState.Busy;

      return await _firmaRepository.readFirma();
    }
    catch(e){
      print("usermodel readfirma da hata var= $e");
      return null;
    }
    finally{
      state=ViewState.Idle;
    }
  }




}
