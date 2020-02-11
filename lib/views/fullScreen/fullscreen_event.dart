import 'package:equatable/equatable.dart';

abstract class FullscreenEvent extends Equatable {
  FullscreenEvent([List props = const <dynamic>[]]) : super(props);
}

class SetWallpaperEvent extends FullscreenEvent{
  String url;
  int i;
  SetWallpaperEvent({this.url,this.i}):super([url,i]);
}

class DownloadWallpaperEvent extends FullscreenEvent{
  String url;
  DownloadWallpaperEvent({this.url}):super([url]);
}
