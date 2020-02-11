import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WallpaperEvent extends Equatable {
  WallpaperEvent([List props = const <dynamic>[]]) : super(props);
}

class WallpaperGetEvent extends WallpaperEvent{}

class CategoryGetEvent extends WallpaperEvent{}

class CategoryWallpaperGetEvent extends WallpaperEvent{
  String id;
  CategoryWallpaperGetEvent({@required this.id}):super([id]);
}
