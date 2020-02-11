import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superheroes/getitLocator/getitLocator.dart';
import 'package:superheroes/views/viewsRoute.dart';

import 'views/routeBloc/bloc.dart';
import 'views/wallpaperBloc/bloc.dart';


void main() {

  setupLocator();

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ViewsRouteBloc>(
            builder: (context) => ViewsRouteBloc(),
          ),
          BlocProvider<WallpaperBloc>(
            builder: (context) => WallpaperBloc(),
          )
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marvel Wallpapers',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColorLight: Color(0xFF438ABC),
          primaryColorDark: Color(0xFF272C2D)
        ),
        home: viewsRoute()
    );
  }
}