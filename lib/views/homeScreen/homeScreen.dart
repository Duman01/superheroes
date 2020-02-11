import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superheroes/model/wallpaperModel.dart';
import 'package:superheroes/views/fullScreen/bloc.dart';
import 'package:superheroes/views/fullScreen/fullScreen.dart';
import 'package:superheroes/views/wallpaperBloc/bloc.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    final WallpaperBloc _wallpaperBloc = BlocProvider.of<WallpaperBloc>(context);
    return Container(
      padding: EdgeInsets.all(5),
      child: BlocBuilder(
        bloc: _wallpaperBloc,
        builder: (context, WallpaperState state){
          if(state is InitialWallpaperState){
            _wallpaperBloc.dispatch(WallpaperGetEvent());
            return Center(child: CircularProgressIndicator());
          }
          else if(state is LoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is WallpaperLoadState){
            final list = state.wallpaper.listWallpaper;
            return homeScreenItem(list: list);
          }
          else if(state is ErrorState){
            return Center(
              child: Icon(Icons.error_outline,size: 200,color: Colors.white,),
            );
          }
          else{
            _wallpaperBloc.dispatch(WallpaperGetEvent());
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class homeScreenItem extends StatelessWidget {
  const homeScreenItem({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<arrayImages> list;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: list.length,
      crossAxisCount: 3,
      staggeredTileBuilder: (i) => StaggeredTile.count(1, i.isEven ? 1.8 : 1.8),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      itemBuilder: (context,i){
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return BlocProvider(
                builder: (context)=>FullscreenBloc(),
                child: fullScreen(image: list[i], i: i)
              );
            }));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: '$i',
              child: FadeInImage(
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
                placeholder: AssetImage("assets/images/loading.gif"),
                image: NetworkImage('${list[i].wallpaper_image_thumb}',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

