import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:superheroes/model/categoryModel.dart';
import 'package:superheroes/model/wallpaperModel.dart';

class wallpaperApi {

  static const wallUrl ="https://www.dumanibrahim.com/apps/Superheroes/api.php?home";
  static const catUrl ="https://www.dumanibrahim.com/apps/Superheroes/api.php?cat_list";
  static const catWallUrl = "https://www.dumanibrahim.com/apps/Superheroes/api.php?cat_id=";
  final http.Client httpClient = http.Client();

  Future<wallpaperList> getWallpaper() async{
    var response = await httpClient.get(wallUrl);

    if(response.statusCode!=200){
      throw Exception("Duvar kağıtları yüklenemedi");
    }
    var data = json.decode(response.body);
    var  wallpapers = wallpaperList.fromJson(data);
    return wallpapers;
  }

  Future<categoryList> getCategory()async{
    var response = await httpClient.get(catUrl);

    if(response.statusCode!=200){
      throw Exception("Kategoriler Yüklenemedi");
    }
    var data = json.decode(response.body);
    var category = categoryList.fromJson(data);
    return category;
  }

  Future<wallpaperList> getCatWallpaperList(String id)async{
    var response = await httpClient.get(catWallUrl+"$id");

    if(response.statusCode!=200){
      throw Exception("Kategoriler Yüklenemedi");
    }
    var data = json.decode(response.body);
    var wallpaper = wallpaperList.fromJson(data);
    return wallpaper;
  }


}

