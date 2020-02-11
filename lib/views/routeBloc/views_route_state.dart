import 'package:equatable/equatable.dart';
import 'package:superheroes/model/wallpaperModel.dart';

abstract class ViewsRouteState extends Equatable {
  ViewsRouteState([List props = const <dynamic>[]]) : super(props);
}

class InitialViewsRouteState extends ViewsRouteState {}

class HomeScreenState extends ViewsRouteState{}

class CategoryScreenState extends ViewsRouteState{}

class NewScreenState extends ViewsRouteState{}

class BestScreenState extends ViewsRouteState{}

class FullScreenState extends ViewsRouteState{
  int i;
  arrayImages image;
  FullScreenState({this.i,this.image});
}

