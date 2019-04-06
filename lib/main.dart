import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp3_app/buttom_controls.dart';
import 'package:mp3_app/songs.dart';
import 'package:mp3_app/theme.dart';
import 'dart:io';

void main()
{

  runApp(
    new  MyApp()
  );
}

class MyApp  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
   _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(

        backgroundColor: Colors.black54,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
          ),
          color: const Color(0xEEDDDDDD),
          onPressed: () {},
        ),
        title: new Text("MP3 Player",
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.menu,
            ),
            color:const Color(0xEEDDDDDD),
            onPressed: () {},
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          //seck bar
          new Expanded(
            child: new Center(
              child: new Container(
                width: 125.0,
                height: 125.0,
                child: new ClipOval(
                  clipper: new CircleClipper(),
                  child: new Image.network(
                      demoPlaylist.songs[0].albumArtUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ),
          ),

          //visualizer
         new Container(
           width: double.infinity,
           height: 125.0,
         ),

          //song title,artist name,controls
        new ButtomControl(),

        ],
      )
    );
  }
}



class CircleClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromCircle(
      center: new Offset(size.width/2,size.height/2),
      radius: min(size.width,size.height)/2
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }

}