import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String userID;

  String email;
  DateTime createdAt;
  String name;
  List telNo;
  String plaka;
  Map adresMap;
  Map<String, String> bosMap = {' ': ' '};

  String sehir;
  List adresKisaIsim;
  String ilce;
  String mahalle;
  String adresDetay;
  List bosadresKisaIsim=[""];
  List bosTelNo=[""];


  User({
    @required this.userID,
    @required this.email,
    @required this.name,
    this.adresKisaIsim,
    this.telNo,
    this.adresMap,
    this.sehir,
    this.ilce,
    this.mahalle,
    this.adresDetay,
    this.plaka,
  });


  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'adresMap': adresMap != null ? adresMap : bosMap,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'name': name != null ? name : '',
      'plaka': plaka != null ? plaka : '',
      'adresKisaIsim':adresKisaIsim==null?bosadresKisaIsim:adresKisaIsim ,
      'il': sehir != null ? sehir : '',
      'ilce': ilce != null ? ilce : '',
      'telNo': telNo != null ? telNo : bosTelNo,
      'mahalle': mahalle != null ? mahalle : '',
      'adresDetay': adresDetay != null ? adresDetay : ''
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        name = map['name'],
        adresMap = map['adresMap'],
        plaka = map['plaka'],
        adresKisaIsim = map['adresKisaIsim'],
        sehir = map['il'],
        ilce = map['ilce'],
        telNo = map['telNo'],
        mahalle = map['mahalle'],
        adresDetay = map['adresDetay'];

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, createdAt: $createdAt, name: $name, plaka: $plaka, adresMap: $adresMap, bosMap: $bosMap, sehir: $sehir, ilce: $ilce, mahalle: $mahalle, adresDetay: $adresDetay}';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
