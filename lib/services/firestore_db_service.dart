
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/services/database_base.dart';

class FirestroeDbService implements DbBase {
final Firestore _firestoreDB=Firestore.instance;

  @override
  // ignore: non_constant_identifier_names

  Future<User> readUser(String userID) async{
    try {
      DocumentSnapshot _okunanUser = await _firestoreDB.document(
          "Users/$userID").get();
//_okunanUser.data[]
      Map<String, dynamic> _okunanUserBilgileriMap = _okunanUser.data;

      User _okunanUserBilgileriNesne = User.fromMap(_okunanUserBilgileriMap);
      print("Okunan user nesnesi=" + _okunanUserBilgileriNesne.toString());
      return _okunanUserBilgileriNesne;
    }
    catch(e){
      debugPrint("read user da hata var = $e");
      return null;

    }

  }

  @override
  // ignore: non_constant_identifier_names
  Future<bool> SaveUser(User user) async {
    
    await _firestoreDB.collection("Users").document(user.userID).setData(user.toMap());

    DocumentSnapshot _okunanUser=await _firestoreDB.document("Users/${user.userID}").get();

    Map _okunanUserBilgileriMap=_okunanUser.data;

    User _okunanUserBilgileriNesne= User.fromMap(_okunanUserBilgileriMap);

    print("kaydeduilen User nesnesi= "+ _okunanUserBilgileriNesne.toString());

    return true;



  }

  Future update(User user) async{
    try {
      await _firestoreDB.collection("Users").document(user.userID).updateData(
          user.toMap());
      DocumentSnapshot _okunanUser = await _firestoreDB.document(
          "Users/${user.userID}").get();
      Map _okunanUserBilgileriMap = _okunanUser.data;
      User _okunanUserBilgileriNesne = User.fromMap(_okunanUserBilgileriMap);
      print(
          "guncellenen User nesnesi= " + _okunanUserBilgileriNesne.toString());
      return true;
    }
    catch(e){
      debugPrint("firestroe db service hata var = $e");
    }


  }



}