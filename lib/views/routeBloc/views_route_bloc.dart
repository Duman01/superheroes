import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ViewsRouteBloc extends Bloc<ViewsRouteEvent, ViewsRouteState> {
  @override
  ViewsRouteState get initialState => InitialViewsRouteState();

  @override
  Stream<ViewsRouteState> mapEventToState(
    ViewsRouteEvent event,
  ) async* {
    if(event is HomeScreenEvent){
      yield HomeScreenState();
    }
    else if(event is CategoryScreenEvent){
      yield CategoryScreenState();
    }
    else if(event is NewScreenEvent){
      yield NewScreenState();
    }
    else if(event is BestScreenEvent){
      yield BestScreenState();
    }
    else if(event is FullScreenEvent){
      yield FullScreenState(i: event.i, image: event.image);
    }
  }
}
