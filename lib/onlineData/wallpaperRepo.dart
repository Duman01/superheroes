import 'package:superheroes/getitLocator/getitLocator.dart';
import 'package:superheroes/model/categoryModel.dart';
import 'package:superheroes/model/wallpaperModel.dart';
import 'package:superheroes/onlineData/wallpaperApi.dart';

class wallpaperRepo{

  wallpaperApi _wallpaperApi = locator<wallpaperApi>();

  Future<wallpaperList> getWallpaper()async{
    return await _wallpaperApi.getWallpaper();
  }

  Future<categoryList> getCategory()async{
    return await _wallpaperApi.getCategory();
  }

  Future <wallpaperList> getCatWallList(String id)async{
    return await _wallpaperApi.getCatWallpaperList(id);
  }


}