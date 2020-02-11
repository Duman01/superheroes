import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superheroes/views/routeBloc/bloc.dart';
import 'package:superheroes/views/wallpaperBloc/bloc.dart';

class leftNavBar extends StatefulWidget {
  @override
  _leftNavBarState createState() => _leftNavBarState();
}

class _leftNavBarState extends State<leftNavBar> with TickerProviderStateMixin {
  
  AnimationController _controllerHome, _controllerCat;
  Animation<double> _animationHome, _animationCat;

  @override
  void initState() {
    super.initState();

    _controllerHome = new AnimationController(
		  duration: const Duration(milliseconds: 500),
		  vsync: this,
	  );

    _controllerCat = new AnimationController(
		  duration: const Duration(milliseconds: 500),
		  vsync: this,
	  );

	  _controllerHome.forward().orCancel;

    _animationHome = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(parent: _controllerHome, curve: Curves.decelerate));

    _animationCat = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(parent: _controllerCat, curve: Curves.decelerate));

  }

  @override
  Widget build(BuildContext context) {
    final ViewsRouteBloc _viewRouteBloc = BlocProvider.of<ViewsRouteBloc>(context);
    final WallpaperBloc _wallpaperBloc = BlocProvider.of<WallpaperBloc>(context);
    return Container(
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.only(topRight: Radius.circular(100), bottomRight: Radius.circular(100))
      ),
      child: Builder(
        builder: (context){
          if(_viewRouteBloc.currentState is HomeScreenState){
            _controllerCat.reverse().orCancel;
            _controllerHome.reset();
            _controllerHome.forward().orCancel;
          }
          if(_viewRouteBloc.currentState is CategoryScreenState){
            _controllerHome.reverse().orCancel;
            _controllerCat.reset();
            _controllerCat.forward().orCancel;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector( // refresh buton
                onTap: (){
                  if(_wallpaperBloc.currentState is WallpaperLoadState){
                    _wallpaperBloc.dispatch(WallpaperGetEvent());
                  }
                },
                child: Container(
                  color: Theme.of(context).primaryColorDark,
                  width: 50,
                  child: Tab(
                    child: Text("Mix",style: TextStyle(
                      fontSize: 11,
                      color: Colors.white30
                    )),
                    icon: Icon(Icons.refresh,size: 20,color: Colors.white30,),
                  ),
                ),
              ),//
              Divider(thickness: 2,color: Colors.white30,indent: 10,endIndent: 10),
              _tab("Home",_viewRouteBloc,HomeScreenEvent(),HomeScreenState(),Icons.photo_size_select_actual),
              Padding(padding: EdgeInsets.all(10),),
              Divider(thickness: 2,color: Colors.white,indent: 10,endIndent: 10,),
              Padding(padding: EdgeInsets.all(10),),
              _tab("Cat",_viewRouteBloc,CategoryScreenEvent(),CategoryScreenState(),Icons.category),
            ],
          );
        }
      ),
    );
  }

  Widget _tab(String label, ViewsRouteBloc _bloc, ViewsRouteEvent _event, ViewsRouteState state,IconData icon) {
    return ScaleTransition(
      scale: label == "Home" ? _animationHome : _animationCat,
      child: GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColorDark,
          width: 50,
          child: Tab(
            child: Text("$label",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _bloc.currentState == state ? Theme.of(context).primaryColorLight : Colors.white30
              ),
            ),
            icon: Icon(
              icon,
              size: 35,
              color: _bloc.currentState == state ? Theme.of(context).primaryColorLight : Colors.white30,
            ),
          ),
        ),
        onTap: () {
          _bloc.dispatch(_event);
        },
      ),
    );
  }

}