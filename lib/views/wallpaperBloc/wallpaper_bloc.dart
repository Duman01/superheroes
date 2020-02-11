import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:superheroes/getitLocator/getitLocator.dart';
import 'package:superheroes/model/categoryModel.dart';
import 'package:superheroes/model/wallpaperModel.dart';
import 'package:superheroes/onlineData/wallpaperRepo.dart';
import './bloc.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {

  final wallpaperRepo _wallpaperRepo = locator<wallpaperRepo>();
  
  @override
  WallpaperState get initialState => InitialWallpaperState();

  @override
  Stream<WallpaperState> mapEventToState(
    WallpaperEvent event,
  ) async* {
    if(event is WallpaperGetEvent){
      yield LoadingState();
      try{
        final wallpaperList _wallpaper = await _wallpaperRepo.getWallpaper();
        yield WallpaperLoadState(wallpaper: _wallpaper);
      }catch(_){
        yield ErrorState();
      }
    }
    if(event is CategoryWallpaperGetEvent){
      yield LoadingState();
      try{
        final wallpaperList _wallpaper = await _wallpaperRepo.getCatWallList(event.id);
        yield WallpaperLoadState(wallpaper:_wallpaper);
      }catch(_){
        yield ErrorState();
      }
    }
    if(event is CategoryGetEvent){
      yield LoadingState();
      try{
        final categoryList _category = await _wallpaperRepo.getCategory();
        yield CategoryLoadState(category: _category);
      }catch(_){
        yield ErrorState();
      }
    }
  }
}
