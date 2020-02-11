import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:superheroes/views/backGround.dart';
import 'package:superheroes/views/drawer/leftNavBar.dart';
import 'package:superheroes/views/fullScreen/fullScreen.dart';
import 'package:superheroes/views/homeScreen/homeScreen.dart';
import 'package:superheroes/views/routeBloc/bloc.dart';
import 'categoryScreen/categoryScreen.dart';

class viewsRoute extends StatefulWidget {
  @override
  _viewsRouteState createState() => _viewsRouteState();
}

class _viewsRouteState extends State<viewsRoute> {

  @override
  void initState() {
    super.initState();
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final ViewsRouteBloc _viewsRouteBloc = BlocProvider.of<ViewsRouteBloc>(context);
    return BlocBuilder(
      bloc: _viewsRouteBloc,
      builder: (context, ViewsRouteState state) =>
      SafeArea(
        child: Scaffold(
          body: Row(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    backGround(),
                    leftNavBar(),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Builder(
                        builder: (context){
                          if(state is InitialViewsRouteState){
                            _viewsRouteBloc.dispatch(HomeScreenEvent());
                            return Center(child: CircularProgressIndicator());
                          }
                          else if(state is HomeScreenState){
                            return homeScreen();
                          }
                          else if(state is CategoryScreenState){
                            return categoryScreen();
                          }
                          else if(state is FullScreenState){
                            return fullScreen(image: state.image, i: state.i,);//kullanılmıyo
                          }
                          else {
                            _viewsRouteBloc.dispatch(HomeScreenEvent());
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
 
}


