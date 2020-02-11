import 'package:equatable/equatable.dart';
import 'package:superheroes/model/wallpaperModel.dart';

abstract class ViewsRouteEvent extends Equatable {
  ViewsRouteEvent([List props = const <dynamic>[]]) : super(props);
}

class HomeScreenEvent extends ViewsRouteEvent{}

class CategoryScreenEvent extends ViewsRouteEvent{}

class NewScreenEvent extends ViewsRouteEvent{}

class BestScreenEvent extends ViewsRouteEvent{}

class FullScreenEvent extends ViewsRouteEvent{
  int i;
  arrayImages image;
  FullScreenEvent({this.i,this.image});
}