import 'dart:async';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import './bloc.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  @override
  FullscreenState get initialState => InitialFullscreenState();

  @override
  Stream<FullscreenState> mapEventToState(
    FullscreenEvent event,
  ) async* {
    if(event is SetWallpaperEvent){
      yield FullScreenLoadingState();
      await Future.delayed(Duration(milliseconds: 350));
      try{
        var progressString=Wallpaper.ImageDownloadProgress(event.url);
          progressString.listen((data){
          },onDone: ()async{
            if(event.i==0) await Wallpaper.homeScreen();
            else if(event.i==1) await Wallpaper.lockScreen();
            else { 
              await Wallpaper.homeScreen();await Wallpaper.lockScreen();
            }
          }
        );
        yield TaskDoneState();
      }catch(_){
        yield FullScreenErrorState();
      }
    }
    if(event is DownloadWallpaperEvent){
      yield FullScreenLoadingState();
      try{
        var response = await Dio().get(event.url,options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
        yield TaskDoneState();
      }catch(_){
        yield FullScreenErrorState();
      }
    }
  }

}
