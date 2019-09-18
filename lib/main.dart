import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart';
import 'package:infotech/screens/main_screen.dart';
import 'package:infotech/screens/phoneverification.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:infotech/util/const.dart';
import './screens/homepage.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_){
     runApp(
    MaterialApp(
      title: 'InfoT',
      home: MyApp(),
      routes: <String,WidgetBuilder>{
        '/homepage':(BuildContext context)=> DashBoard(),
        '/landingpage':(BuildContext context) => MyApp()
      },
    )
  );
  });
  
}




class MyApp extends StatefulWidget {
  var name;
  int i;
  MyApp({this.i,this.name});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark?Brightness.light:Brightness.dark,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: Scaffold
      (body: DoubleBackToCloseApp(child: MainScreen(i:widget.i,name:widget.name),
      snackBar: const SnackBar(
        content: Text('Tap again to leave'),
      ),
      )),
    );
  }
}

class Image extends StatefulWidget{
  @override 
  ImageState createState() => ImageState();
}

class ImageState extends State<Image>{

  
  Uint8List imagefile;

  StorageReference photoreference = FirebaseStorage.instance.ref();

  getPhoto(){
    int Max = 7*1024*1024;

    photoreference.child('my.jpg').getData(Max).then((data){

      this.setState((){
        imagefile = data;
      });
    }).catchError((e)=>print(e));
  }

 

  @override 
  void initState(){
    super.initState();
    getPhoto();
   
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Center(
        child: imagefile == null ? Center(child: Text('no data'),):prefix0.Image.memory(imagefile,fit: BoxFit.cover,),
        
      ),

    ); 
  }
}