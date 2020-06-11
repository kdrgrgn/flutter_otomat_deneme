

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/services/firma_db_base.dart';

class FirestoreFirmaDBService implements FirmaDBBase{

  Firestore _firestore=Firestore.instance;

  @override
  Future<List<Firma>> readFirma() async {
try{

    QuerySnapshot _querySnapshot;
    List<Firma> _tumFirmalar=[];


      print("Ilk defa firmalar getirilyor");
      _querySnapshot = await _firestore
          .collection("Firma")
          .orderBy("firmaAdi")
          .getDocuments();

    for (DocumentSnapshot snap in _querySnapshot.documents) {
      Firma _tekFirma = Firma.fromMap(snap.data);
      _tumFirmalar.add(_tekFirma);
      debugPrint("GETIRILEN FIRMA " + _tekFirma.firmaAdi);
    }


return _tumFirmalar;

}
catch(e){
  debugPrint("readFirmada hata var= "+e);
  return null;
}


  }




}