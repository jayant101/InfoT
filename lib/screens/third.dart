
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Third extends StatefulWidget {
  var name;
  Third({this.name});
  @override
  ThirdState createState() => new ThirdState();
}

class ThirdState extends State<Third> {
  
  int photoIndex = 0;
  List<String> photos = [
    'assets/f4.jpg',
    'assets/f5.jpg',
    'assets/f7.jpg',
    'assets/f8.jpg'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController year = TextEditingController();

  getData(name,year)async{
    var firestore = Firestore.instance;
    QuerySnapshot url = await firestore.collection(name+' n '+year).getDocuments();

      return url.documents;
  }

  var _year = ['your year','1st year','2nd year','3rd year','4th year'];
  var _currentItemSelected = 'your year';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
              children:<Widget>[ 
                 Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/f1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0,
        ),
        child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),),
        width: 400.0,
      ),   
                
                
                Column(
          children:<Widget>[

            SizedBox(height: 50.0,),
            Text('PROFILE PAGE',style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.w900,letterSpacing: 8.0),),

              SizedBox(height: 60.0,),

               Container(
                      height: 30.0,
                      width: 280.0,
                      child: TextField(
                        
                        cursorColor: Colors.grey[200],
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          
                          
                          hintText: 'Enter the name of student',
                          hintStyle: TextStyle(color:Colors.grey[200])
                        ),
                      controller: name,
                    ),

                   
                    ),

                    SizedBox(height: 25.0,),




               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                   

                     DropdownButton<String>(
                underline: Container(),
                items: _year.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem,style: TextStyle(color: Colors.black),),
                          );
                }).toList(),
                
                onChanged: (String newValueSelected) {
                          setState(() {
                           this._currentItemSelected = newValueSelected ; 
                          });

                },
                value: _currentItemSelected,

                ),

                    

                   
                      SizedBox(width: 150.0,),

                    Container(
                      height: 30.0,
                      width: 80.0,
                      child: RaisedButton(
                        onPressed: (){

                          if(
                            name.text == null||_currentItemSelected=='your year'
                          ){

                             showDialog(
                                    context: context,
                                    builder: (builder){
                                      return Center(
                                       child: Material(
                                            child: Container(
                                          height: 300.0,
                                          width: 300.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.black),
                                          ),
                                          child: Column(children: <Widget>[

                                            SizedBox(height: 50.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Error',style: TextStyle(color: Colors.red,decoration: TextDecoration.none),),
                                              ],),

                                              SizedBox(height: 20.0,),

                                              Text('please enter valid value\n     or select image',style:TextStyle(fontSize: 12.0,decoration:TextDecoration.none,color: Colors.grey))
,                                             
                                              SizedBox(height: 80.0,),

                                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height: 1.0,
                                                  width: 30.0,
                                                  color: Colors.grey,
                                                ),

                                                Text("  try again  ",style: TextStyle(color: Colors.grey,fontSize: 10.0),),

                                                Container(
                                                  height: 1.0,
                                                  width: 30.0,
                                                  color: Colors.grey,
                                                ),
                                              ],),

                                            
                                          
                                          ],),
                                          
                                        ),
                                                                        ),
                                      );
                                    }
                                  );
                          }

                          else  {


                          showModalBottomSheet(
                            isScrollControlled: true,
                            
                            context: context,
                            builder: (context){
                              return Card(
                                  child: Container(
                                    height: 550.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: 
                          FutureBuilder(
                            future: getData(name.text,_currentItemSelected),
                            builder: (context,snapshot){
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  
                                  return Center(child: Text('Loading...'),);
                                  
                                }
                               
                                else if(snapshot.data.length>=1){
                                  print('fir yhi aaya');
                                  print(snapshot.data.length);
                                  
                                  return Card(
                                      child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.0),
                                        
                                      ),
                                      child: ListView(
          shrinkWrap: true,
          children: <Widget>[

            SizedBox(height: 20.0,),
            Column(
              children: <Widget>[

              
                Stack(
                  children: <Widget>[
                    Card(
                          child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                          height: 210.0,
                         

                         child: Carousel(
                           images: [
                             Image.asset('assets/s1.jpg',fit: BoxFit.cover,),
                             Image.asset('assets/s2.jpg',fit: BoxFit.cover,),
                             Image.asset('assets/s3.jpg',fit: BoxFit.cover,),
                             Image.asset('assets/s6.jpg',fit: BoxFit.cover,),
                           ],
                           showIndicator: false,
                            borderRadius: true,
                            moveIndicatorFromBottom: 180.0,
                            noRadiusForIndicator: true,
                            overlayShadow: true,
                            overlayShadowColors: Colors.black,
                            overlayShadowSize: 0.7,
                         ),           
                        ),
                      ),
                    ),
                   
                   
                  
                  ],
                ),
              
                
              

                SizedBox(height: 5.0),



                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Information Technology',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15.0),
                       Text(
                          snapshot.data[0].data['name'],
                          style: TextStyle(
                                color: Colors.black,
                                fontSize: 27.0,
                                letterSpacing: 3.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                        ),
                          
                     
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'UIT RGPV',
                            style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5.0),
                          Icon(Icons.location_on),
                          SizedBox(width: 5.0),
                          Text(
                            'BHOPAL',
                            style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.wifi, color: Colors.green),
                          SizedBox(width: 4.0),
                          Text(
                            '...',
                            style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'YOUR UPLOADS',
                        style: TextStyle(
                            letterSpacing: 2.0,
                            color: Colors.grey,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),

                Container(
                  height: snapshot.data.length*125.0,
                  width: 400.0,
                
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      return Container(
                        height: 121.0,
                       
                       
      child: Container(
        height: 121.0,
        width: 400.0,
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data[index].data.length-3,
          itemBuilder: (contex,ind){
            return  Container(
              child: Column(
          children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                children: <Widget>[
                  Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                       
                        child: Center(child: 
                        Image.network(snapshot.data[index].data['url${ind+1}'],),
                       //decoration: BoxDecoration(
                        /* image: DecorationImage(
                            image: AssetImage(picture),
                            fit: BoxFit.cover
                          ),*/
                          
                      //    borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                      height: 100.0,
                      width:250.0,
                      
                      child: ListView(
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        
                                    Text(snapshot.data[index].data['subject'],
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(snapshot.data[index].data['year'],
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontFamily: 'Montserrat',
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                    ),
                                    Text('by '+snapshot.data[index].data['name'],
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontFamily: 'Montserrat',
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),),
                                    SizedBox(height: 10.0),
                                    Text('Successfully uploaded',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green
                                    ),)
                                  ],
                      ),
                  )
                ],
              )
          ],
        ),
            );
          },
        ),
        
        
        
        
        
      ),
    );
                    },
                  ),
                ),
                


              //  _buildListItem(snapshot.data[0].data['url1'],snapshot.data[0].data['name']),
                SizedBox(height: 10.0),
               // _buildListItem(photos[1],snapshot.data[0].data['name']),
               // SizedBox(height: 10.0),
                //_buildListItem(photos[2],snapshot.data[0].data['name']),
              //  SizedBox(height: 10.0),
                //_buildListItem(photos[3],snapshot.data[0].data['name']),
              ],
            )
          ],
        ),
                                    ),
                                  );
                                } 

                                 else {
                                  return Center(child: Image.asset('assets/nn5.jpg'),);
                                }

                                
                               
                            },
                          ),
                                ),
                              );
                            }
                          );
                          }


                        },
                        color: Colors.deepOrange,
                        elevation: 20.0,
                        child: Text('Done'),),)
                    
                  ],
                ),
          ]
        ),
              ]
      ),
    );
  }

  Widget _buildListItem(String picture,name) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left:20.0),
                  child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Center(child: 
                  Image.network(picture),),
                  decoration: BoxDecoration(
                  /*  image: DecorationImage(
                      image: AssetImage(picture),
                      fit: BoxFit.cover
                    ),*/
                    
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                              Text('Mathematics-I',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              SizedBox(height: 5.0),
                              Text('First year',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontFamily: 'Montserrat',
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                              ),
                              Text('by '+name,
                              style: TextStyle(
                                fontSize: 11.0,
                                fontFamily: 'Montserrat',
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),),
                              SizedBox(height: 10.0),
                              Text('Successfully uploaded',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.green
                              ),)
                            ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}