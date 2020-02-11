import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:superheroes/model/categoryModel.dart';
import 'package:superheroes/views/routeBloc/bloc.dart';
import 'package:superheroes/views/wallpaperBloc/bloc.dart';

class categoryScreen extends StatefulWidget {
  @override
  _categoryScreenState createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  
  @override
  Widget build(BuildContext context) {
    final WallpaperBloc _wallpaperBloc = BlocProvider.of<WallpaperBloc>(context);
    final ViewsRouteBloc _viewsRouteBloc = BlocProvider.of<ViewsRouteBloc>(context);
    return Container(
      padding: EdgeInsets.all(5),
      child: BlocBuilder(
        bloc: _wallpaperBloc,
        builder: (context, WallpaperState state){
          if(state is WallpaperLoadState){
            _wallpaperBloc.dispatch(CategoryGetEvent());
            return Text("Please Wait");
          }
          if(state is InitialWallpaperState){
            _wallpaperBloc.dispatch(CategoryGetEvent());
            return Text("Please Wait.");
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if(state is ErrorState){
            return Center(
              child: Icon(Icons.error_outline,size: 200,color: Colors.white,),
            );
          }
          if(state is CategoryLoadState){
            final list = state.category.listCategory;
            return categoryScreenItem(list: list, wallpaperBloc: _wallpaperBloc, viewsRouteBloc: _viewsRouteBloc);
          }
          return null;
        },
      ),
    );
  }
}

class categoryScreenItem extends StatelessWidget {
  const categoryScreenItem({
    Key key,
    @required this.list,
    @required WallpaperBloc wallpaperBloc,
    @required ViewsRouteBloc viewsRouteBloc,
  }) : _wallpaperBloc = wallpaperBloc, _viewsRouteBloc = viewsRouteBloc, super(key: key);

  final List<arrayImagesCategory> list;
  final WallpaperBloc _wallpaperBloc;
  final ViewsRouteBloc _viewsRouteBloc;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: list.length,
      crossAxisCount: 1,
      staggeredTileBuilder: (i) => StaggeredTile.count(1, 0.3),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      itemBuilder: (context, i){
        return GestureDetector(
          onTap: () {
            _wallpaperBloc.dispatch(CategoryWallpaperGetEvent(id:list[i].cid));
            _viewsRouteBloc.dispatch(HomeScreenEvent());
          },
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    fadeInDuration: Duration(milliseconds: 350),
                    fadeOutDuration: Duration(milliseconds: 350),
                    placeholder: AssetImage("assets/images/loading.gif"),
                    image: NetworkImage('${list[i].category_image_thumb}'),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5)
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${list[i].category_name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

