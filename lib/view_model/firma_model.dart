


import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/Repository/Firma_repository.dart';
import 'package:flutter_otomat_deneme/locator.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/services/firma_db_base.dart';

class FirmaModel with ChangeNotifier implements FirmaDBBase{

  FirmaRepository _firmaRepository=locator<FirmaRepository>();

  @override
  Future<List<Firma>> readFirma() async {
return await _firmaRepository.readFirma();
  }



}