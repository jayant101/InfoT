import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget{
  @override 
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Text('done'),
          ),

          RaisedButton(
            child: Text('back'),
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/landingpage');
            },
          ),
        ],
      ),
    );
  }
}