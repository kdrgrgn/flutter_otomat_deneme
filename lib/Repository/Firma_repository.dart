
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/services/firestore_firmaDB_service.dart';
import 'package:flutter_otomat_deneme/services/firma_db_base.dart';

class FirmaRepository implements FirmaDBBase{
  FirestoreFirmaDBService _firestoreFirmaDBService=locator<FirestoreFirmaDBService>();

  @override
  Future<List<Firma>> readFirma() async {
return await _firestoreFirmaDBService.readFirma();

  }


}