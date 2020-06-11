
import 'package:flutter_otomat_deneme/model/user.dart';

abstract class DbBase{

  // ignore: non_constant_identifier_names
  Future<bool> SaveUser(User user);
  // ignore: non_constant_identifier_names
  Future<User> readUser(String userID);



}