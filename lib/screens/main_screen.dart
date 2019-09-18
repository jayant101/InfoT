import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infotech/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infotech/screens/third.dart';

import 'dart:async';



import './fabwithicon.dart';
import './fabBottomapp.dart';
import './anchoredoverlay.dart';
import './second.dart';
import 'dart:io';

import 'dart:async';

import 'fourth.dart';


class MainScreen extends StatefulWidget {
  int i;
  var name;
  MainScreen({this.i,this.name});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  File sampleImage;
 

  Future getImage(int index) async{
    if(index==1)
    {

      _pageController.jumpToPage(1);






  }
  else{
    var temp = await ImagePicker.pickImage(source: ImageSource.camera);


    var result = await FlutterImageCompress.compressAndGetFile(
        temp.path,
        temp.path,
        quality: 95,
        
    );


    setState(() {
      sampleImage = result;
      print(sampleImage.lengthSync());
    });
  }
     

  }

   String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';

    });

    

    if(index == 0){
      _pageController.jumpToPage(0);
    }

    if(index == 1){
      _pageController.jumpToPage(1);
    }

    if(index == 2){
      _pageController.jumpToPage(2);
    }

    if(index == 3){
      _pageController.jumpToPage(3);
    }


  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  ScrollController scrollController;
  bool dialVisible = true;


  @override
  void initState(){
    super.initState();
     _pageController = PageController();
    
      Widget _buildFab(BuildContext context) {
    final icons = [ Icons.camera_alt, Icons.photo_library, ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: navi,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
    
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection == ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(i:widget.i,name:widget.name),
          Second(sampleImage: sampleImage,),
          Third(name:widget.name),
          Fourth(),
          Home(i:widget.i),
        ],
      ),

      bottomNavigationBar:  FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.home,text: ''),
          FABBottomAppBarItem(iconData: Icons.label,text: ''),
          FABBottomAppBarItem(iconData: Icons.notifications,text: ''),
          FABBottomAppBarItem(iconData: Icons.person,text: ''),
        ],
      ),


      
      
      
      
        /*BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width:7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(0),
            ),

            IconButton(
              icon:Icon(
                Icons.label,
                size: 24.0,
              ),
              color: _page == 1
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=> _pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.add,
                size: 24.0,
                color: Theme.of(context).primaryColor,
              ),
              color: _page == 2
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed:   ()=>   _pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24.0,
              ),
              color: _page == 3
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(3),
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 4
                  ? Theme.of(context).accentColor
                  : Theme
                  .of(context)
                  .textTheme.caption.color,
              onPressed: ()=>_pageController.jumpToPage(4),
            ),

            SizedBox(width:7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),

      ), */

      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
     // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    
      
      floatingActionButton:   buildSpeedDial()    //_buildFab( context),
       /* FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: (){ 
          getImage();
          
          _pageController.jumpToPage(2);
        }
      
      ),*/
    ); 
  }

     SpeedDial buildSpeedDial() {
    return SpeedDial(
      backgroundColor: Colors.red,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.photo_library, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () { 
            print('FIRST CHILD');
            getImage(1);
            


             
          },
          label: 'Gallery',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.deepOrangeAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.camera_alt, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () { 
            print('SECOND CHILD');
            getImage(0);
             _pageController.jumpToPage(1);
          },
          label: 'Camera',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
        
      ],
    );
  }








      Widget _buildFab(BuildContext context) {
    final icons = [ Icons.camera_alt, Icons.photo_library, ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: navi,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { 
          _pageController.jumpToPage(2);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
    
  }
  
   /*  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.camera_alt, Icons.photo_library, ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: navi,
          ),
        );
      },
      child: Text('h')
    );
  }*/


      

    void navi(int index){
     
      if(index==1){
        getImage(1);
      }
      if(index == 0){
        getImage(0);
      }
      
      
      _pageController.jumpToPage(1);
      

    }



  void navigationTapped(int page,) {
    _pageController.jumpToPage(page);
  }

 

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
