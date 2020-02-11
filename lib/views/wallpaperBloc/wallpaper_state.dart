import 'package:equatable/equatable.dart';
import 'package:superheroes/model/categoryModel.dart';
import 'package:superheroes/model/wallpaperModel.dart';

abstract class WallpaperState extends Equatable {
  WallpaperState([List props = const <dynamic>[]]) : super(props);
}

class InitialWallpaperState extends WallpaperState {}
class LoadingState extends WallpaperState{}
class ErrorState extends WallpaperState{}

class WallpaperLoadState extends WallpaperState{
  wallpaperList wallpaper;
  WallpaperLoadState({this.wallpaper}):super([wallpaper]);
}
class CategoryLoadState extends WallpaperState{
  categoryList category;
  CategoryLoadState({this.category}):super([category]);
}
