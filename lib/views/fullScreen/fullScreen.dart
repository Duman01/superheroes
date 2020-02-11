import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superheroes/model/wallpaperModel.dart';
import 'package:superheroes/views/backGround.dart';
import 'package:superheroes/views/fullScreen/bloc.dart';

class fullScreen extends StatefulWidget {
  int i;
  arrayImages image;
  fullScreen({this.image,this.i});

  @override
  _fullScreenState createState() => _fullScreenState();
}

class _fullScreenState extends State<fullScreen> with SingleTickerProviderStateMixin {
  final Shader linearGradient = LinearGradient(colors: <Color>[Colors.black,Colors.white],
    ).createShader(Rect.fromLTWH(50.0, 0.0, 300.0, 170.0));


  @override
  Widget build(BuildContext context) {
    final FullscreenBloc _fullScreenBloc = BlocProvider.of<FullscreenBloc>(context);
    return SafeArea(
      child: BlocBuilder(
        bloc: _fullScreenBloc,
        builder: (context, FullscreenState state){
          return Scaffold(
          body: Stack(
            children: <Widget>[
              backGround(), // background
              Container( // image
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: '${widget.i}',
                        child: FadeInImage(
                          fit: BoxFit.fill,
                          fadeOutDuration: Duration(milliseconds: 300),
                          fadeInDuration: Duration(milliseconds: 300),
                          placeholder: NetworkImage(widget.image.wallpaper_image_thumb),
                          image: NetworkImage(widget.image.wallpaper_image),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Builder(
                builder: (context){
                  print(state);
                  if(state is InitialFullscreenState){
                    return SizedBox();
                  }
                  if(state is FullScreenLoadingState){
                    return Align( // yükleme circulasprogress
                      alignment: Alignment.center,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            color: Colors.black.withOpacity(0.8),
                          ),
                          Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    );
                  }
                  if(state is TaskDoneState){
                    return SizedBox();
                  }
                  else{
                    return SizedBox();
                  }
                },
              ),

              /*Align( // Üst yazı
                alignment: Alignment.topCenter,
                child: Container(
                  child: AutoSizeText(
                    widget.image.category_name,
                    maxLines: 1,
                    style: new TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient
                    ),
                  ),
                ),
              ),*/
              
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white.withOpacity(0.7),
            child: Icon(Icons.add,color: Colors.black,size: 35,),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  return CupertinoAlertDialog(
                    actions: <Widget>[
                      _button("HomeScreen Wallpaper", Icons.wallpaper, 0, _fullScreenBloc),
                      _button("LockScreen Wallpaper", Icons.screen_lock_portrait,1, _fullScreenBloc),
                      _button("BothScreen Wallpaper", Icons.layers, 2, _fullScreenBloc),
                      FlatButton(
                        child: Text("Download"),
                        onPressed: (){
                          _save(_fullScreenBloc);
                        },
                      )
                    ],
                  );
                }
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
        },
      ),
    );
  }

  Widget _button(String label, IconData icon, int i , FullscreenBloc _bloc) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text("$label"),
        onPressed: () {
          Navigator.pop(context);
          _bloc.dispatch(SetWallpaperEvent(url: widget.image.wallpaper_image,i: i));
        },
      ),
    );
  }

  _save(FullscreenBloc _bloc) async {
    Navigator.pop(context);
    _bloc.dispatch(DownloadWallpaperEvent(url: widget.image.wallpaper_image));
  }

}