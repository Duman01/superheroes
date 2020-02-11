import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class backGround extends StatelessWidget {

  Gradient _gradient = LinearGradient(colors: <Color>[Color(0xFF438ABC),Color(0xFF272C2D)]);
  final Shader linearGradient = LinearGradient(colors: <Color>[Color(0xFF438ABC),Color(0xFF323B3C)],
    ).createShader(Rect.fromLTWH(50.0, 0.0, 300.0, 170.0));


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    gradient: _gradient,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(360))
                  ),
                ),
              ),
              /*Container(
                child: AutoSizeText(
                  'SUPERHEROES',
                  maxLines: 1,
                  style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
                ),
              ),*/
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    gradient: _gradient,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(360))
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
        )
      ],
    );
  }
}