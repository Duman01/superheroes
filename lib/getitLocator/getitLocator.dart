import 'package:get_it/get_it.dart';
import 'package:superheroes/onlineData/wallpaperApi.dart';
import 'package:superheroes/onlineData/wallpaperRepo.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(()=>wallpaperRepo());
  locator.registerLazySingleton(()=>wallpaperApi());
}