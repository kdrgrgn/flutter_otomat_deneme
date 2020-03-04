
import 'package:flutter_otomat_deneme/Repository/User_repository.dart';
import 'package:flutter_otomat_deneme/services/firebase_auth_service.dart';
import 'package:flutter_otomat_deneme/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(()=>FirebaseAuthService());
  locator.registerLazySingleton(()=>UserRepository());
  locator.registerLazySingleton(()=>FirestroeDbService());
}