import 'package:flutter/material.dart';
import 'package:flutter_otomat_deneme/model/firma.dart';
import 'package:flutter_otomat_deneme/model/user.dart';
import 'package:flutter_otomat_deneme/view_model/user_model.dart';
import 'package:provider/provider.dart';

class CrudFonksiyonlari {


 Future<bool> userUpdate({
    @required BuildContext context,
    @required  User user
  /*  @required List telNo,
    @required List adresKisaIsim,
    @required Map adresMap,*/
  }) async {
    final _userModel=Provider.of<UserModel>(context);

   bool sonuc =await _userModel.adresEkle(user: user);
    if(sonuc){
      return true;
    }
    else{
      return false;
    }

  }


  Future<List<Firma>> readFirma(BuildContext context) async {
    final _userModel=Provider.of<UserModel>(context);

    return await _userModel.readFirma();
  }




}
