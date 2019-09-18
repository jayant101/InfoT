import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as prefix1;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:infotech/main.dart';
import 'package:infotech/screens/homepage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PhoneSignInSection extends StatefulWidget{
  int i;
  File sampleImage;
  File sampleImage0;
  File sampleImage1;
  File sampleImage2;
  File sampleImage3;
  String yearss;
  String subject;
  PhoneSignInSection({this.sampleImage,this.yearss,this.subject,this.sampleImage0,this.sampleImage1,this.sampleImage2,this.sampleImage3,this.i});
  
  @override 
  PhoneSignInSectionState createState() => PhoneSignInSectionState();
}

class PhoneSignInSectionState extends State<PhoneSignInSection>{
  TextEditingController name= TextEditingController();
  TextEditingController year= TextEditingController();

//  PageController _pageController=PageController

Future<bool>pops(){
 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyApp()));
}

  
   saveToDb(url1,url2,url3,url4,name,year,a,sem){
   
   if(a == 1){
     print(year);

    Firestore.instance.collection(widget.yearss+" n "+widget.subject).add({"url1":url1,'name':name,'year':year,'sem':sem});

    Firestore.instance.collection(name+ ' n '+ year).add({'name':name,'year':widget.yearss,"url1":url1,'subject':widget.subject});

   

   }
   if(a == 2){
    Firestore.instance.collection(widget.yearss+" n "+widget.subject).add({"url1":url1,"url2":url2,'name':name,'year':year,'sem':sem});
    
    Firestore.instance.collection(name + ' n ' + year).add({'name':name,'year':widget.yearss,"url1":url1,"url2":url2,'subject':widget.subject});
   }
   if(a == 3){
    Firestore.instance.collection(widget.yearss+" n "+widget.subject).add({"url1":url1,"url2":url2,"url3":url3,'name':name,'year':year,'sem':sem});
    
     Firestore.instance.collection(name + ' n ' + year).add({'name':name,'year':widget.yearss,"url1":url1,"url2":url2,"url3":url3,'subject':widget.subject});
   }

  if(a==4){
    Firestore.instance.collection(widget.yearss+" n "+widget.subject).add({"url1":url1,"url2":url2,"url3":url3,"url4":url4,'name':name,'year':year,'sem':sem});
  
    Firestore.instance.collection(name + ' n ' + year).add({'name':name,'year':widget.yearss,"url1":url1,"url2":url2,"url3":url3,"url4":url4,'subject':widget.subject});
  
  }

  }



String url;
String url1;
String url2;
String url3;
String url4;


   putData(a)async{
     var timeKey = new DateTime.now();

      StorageReference reference = FirebaseStorage.instance.ref().child('image').child(widget.yearss).child(widget.subject);
                          // StorageUploadTask task = reference.putFile(widget.sampleImage);
                           


       if(a == 1){
          { StorageUploadTask task1 = await reference.child(timeKey.toString()+'1' +'.jpg').putFile(widget.sampleImage0);
                           print(widget.sampleImage0.lengthSync());

                             var imageurl1 = await(await task1.onComplete).ref.getDownloadURL();
                           print('url1 = $imageurl1');

                           
                           

                            url1 = imageurl1.toString();

                            saveToDb(url1,url2,url3,url4,name.text,_currentItemSelected,widget.i,_currentItemSelectedsem);
                           }

                       

       }         

       if(a == 2){


           StorageUploadTask task1 = await reference.child(timeKey.toString()+'1' +'.jpg').putFile(widget.sampleImage0);
                           print(widget.sampleImage0.lengthSync());

                             var imageurl1 = await(await task1.onComplete).ref.getDownloadURL();
                           print('url1 = $imageurl1');
                            
                           

                            url1 = imageurl1.toString();

                            
                           

         //   var imageurl = await(await task.onComplete).ref.getDownloadURL();

                        
                           

                            StorageUploadTask task2 = await  reference.child(timeKey.toString()+'2'+'.jpg').putFile(widget.sampleImage1);
                           print(widget.sampleImage1.lengthSync());

                           var imageurl2 = await(await task2.onComplete).ref.getDownloadURL();
                           print('url2 = $imageurl2');
                            

                           url2 = imageurl2.toString();

                           saveToDb(url1,url2,url3,url4,name.text,_currentItemSelected,widget.i,_currentItemSelectedsem);



                           



       }           

       if(a == 3){
           StorageUploadTask task1 = await reference.child(timeKey.toString()+'1' +'.jpg').putFile(widget.sampleImage0);
                           print(widget.sampleImage0.lengthSync());

                             var imageurl1 = await(await task1.onComplete).ref.getDownloadURL();
                           print('url1 = $imageurl1');
                            
                           

                            url1 = imageurl1.toString();
                           

              StorageUploadTask task2 = await  reference.child(timeKey.toString()+'2'+'.jpg').putFile(widget.sampleImage1);
                           print(widget.sampleImage1.lengthSync());

                           var imageurl2 = await(await task2.onComplete).ref.getDownloadURL();
                           print('url2 = $imageurl2');

                           url2 = imageurl2.toString();



                                          


           StorageUploadTask task3 = await reference.child(timeKey.toString()+'3'+'.jpg').putFile(widget.sampleImage2);
                           print(widget.sampleImage2.lengthSync());

                           var imageurl3 = await(await task3.onComplete).ref.getDownloadURL();
                           print('url3 = $imageurl3');

                           url3 = imageurl3.toString();

                          saveToDb(url1,url2,url3,url4,name.text,_currentItemSelected,widget.i,_currentItemSelectedsem);

                   

       }
                           


             if(a == 4){
                 StorageUploadTask task1 = await reference.child(timeKey.toString()+'1' +'.jpg').putFile(widget.sampleImage0);
                           print(widget.sampleImage0.lengthSync());

                             var imageurl1 = await(await task1.onComplete).ref.getDownloadURL();
                           print('url1 = $imageurl1');
                            

                            url1 = imageurl1.toString();
                           

                            StorageUploadTask task2 = await  reference.child(timeKey.toString()+'2'+'.jpg').putFile(widget.sampleImage1);
                           print(widget.sampleImage1.lengthSync());

                           var imageurl2 = await(await task2.onComplete).ref.getDownloadURL();
                           print('url2 = $imageurl2');

                           url2 = imageurl2.toString();



                                   
                

                 StorageUploadTask task3 = await reference.child(timeKey.toString()+'3'+'.jpg').putFile(widget.sampleImage2);
                           print(widget.sampleImage2.lengthSync());

                           var imageurl3 = await(await task3.onComplete).ref.getDownloadURL();
                           print('url3 = $imageurl3');

                           url3 = imageurl3.toString();

                          

                            StorageUploadTask task4 =  await reference.child(timeKey.toString()+'4'+'.jpg').putFile(widget.sampleImage3);
                           print(widget.sampleImage3.lengthSync());

                            var imageurl4 = await(await task4.onComplete).ref.getDownloadURL();
                           print('url4 = $imageurl4');

                            url4 = imageurl4.toString();

                           saveToDb(url1,url2,url3,url4,name.text,_currentItemSelected,widget.i,_currentItemSelectedsem);
                           
                    



             }              
                           
                           
                          
                          



                        
                           


                         

                          
                           

                         

                           

                           
                          
                          

                        //   url = imageurl.toString();
                          
                           
                           
                          
                            
                            print('image url is = $url1 2 =$url2 3 = $url3 4 =$url4');


   }

    var _year = ['your year','1st year','2nd year','3rd year','4th year'];
  var _currentItemSelected = 'your year';
   var sem = ['select exam type','mid sem','end sem'];
  var _currentItemSelectedsem = 'select exam type';

   
  @override
   Widget build(BuildContext context){
     return WillPopScope(
       onWillPop: pops,
            child: Scaffold(
           body: Stack(
               children: <Widget>[
                          Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/cm1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0,
        ),
        child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),),
        width: 400.0,
      ),   

              
                 
                 ListView(
                   children: <Widget>[

                     SizedBox(height: 25.0,),
                  Text('  UPLOAD IMAGE',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 30.0),),
                   SizedBox(height: 5.0,),
                   Text('        --to IT Database--',style: prefix0.TextStyle(fontSize: 12.0,color: Colors.grey[200]),),

                     SizedBox(height: 10.0,),               
                      
                     Padding(
                       
                       padding: EdgeInsets.all(10.0),
                       child: Card(
                         elevation: 28.0,
                           child: Container(
                           decoration: BoxDecoration(
                            // border: Border.all(width: 2.0),
                             
                             borderRadius: BorderRadius.circular(15.0)
                           ),
                           child: Column(
                             children: <Widget>[
                               SizedBox(height: 10.0,), 
                               
                               Row(
                                 children: <Widget>[
                                   SizedBox(width: 10.0,),
                                   Container(
                                     height: 50.0,
                                     width: 250.0,
                                     child: TextField(
                                         controller: name,
                                         decoration: InputDecoration(
                                           border: InputBorder.none,
                                         
                                           
                                           hintText: '  Name',
                                           hintStyle: prefix0.TextStyle(color: Colors.grey)
                                         ),
                                       ),
                                   ),
                                 ],
                               ),
                         
                             
                              
                              
                             ],
                           ),
                         ),
                       ),
                     ),

                     Row(
                       children: <Widget>[
                         Padding(
                           padding: EdgeInsets.all(10.0),
                           child: Card(
                             child: Container(
                               height: 50.0,
                               width: 120.0,
                                 decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                               ),
                               child: 
               Center(
                                child: DropdownButton<String>(
              underline: Container(),
              items: _year.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem,style: TextStyle(color: Colors.grey),),
                        );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                        setState(() {
                         this._currentItemSelected = newValueSelected ; 
                        });

              },
              value: _currentItemSelected,

              ),
               ) ,
                             ),
                           ),
                         ),
                       

                         Padding(
                           padding: EdgeInsets.all(10.0),
                           child: Card(
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                               ),
                               height: 52.0,
                               width: 220.0,
                              
                               child: Row(
                                children:<Widget>[
                                  
                                  SizedBox(width: 9.0,),
                                   DropdownButton<String>(
              underline: Container(),
              items: sem.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem,style: TextStyle(color: Colors.grey),),
                        );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                        setState(() {
                         this._currentItemSelectedsem = newValueSelected ; 
                        });

              },
              value: _currentItemSelectedsem,
        
              ),
                                ]
               ) ,
                             ),
                           ),
                         ),
                       ],
                     ),



                     SizedBox(height: 10.0,),
                     Row(
                       children: <Widget>[
                         SizedBox(width: 20.0,),
                         Chip(
                           backgroundColor: Colors.red,
                           avatar: Icon(Icons.location_on),
                           label: Text('RGPV'),
                         ),

                         SizedBox(width: 20.0,),
                         Chip(
                           backgroundColor: Colors.greenAccent,
                           avatar: Icon(Icons.location_on),
                           label: Text('U.I.T',),
                         ),

                         SizedBox(width: 20.0,),
                         Chip(
                           backgroundColor: Colors.amber,
                           avatar: Icon(Icons.location_on),
                           label: Text('IT'),
                         ),



                       ],
                     ),

                     SizedBox(height: 250.0,),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                       Container(height: 50.0,
                       width: 80.0,
                       child: FloatingActionButton.extended(
                         elevation: 10.0,
                         backgroundColor: Colors.grey[200],
                         label: Text("Confirm",style: prefix0.TextStyle(color: Colors.black),),
                         onPressed: ()async{

                           if(name.text.isEmpty||_currentItemSelected == 'your year'||_currentItemSelectedsem== 'select exam type'){

                              showDialog(
                                    context: context,
                                    builder: (builder){
                                      return Center(
                                       child: Material(
                                            child: Container(
                                          height: 300.0,
                                          width: 300.0,
                                          decoration: prefix0.BoxDecoration(
                                            border: Border.all(color:Colors.black),
                                          ),
                                          child: Column(children: <Widget>[

                                            SizedBox(height: 50.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Error',style: TextStyle(color: Colors.red,decoration: prefix0.TextDecoration.none),),
                                              ],),

                                              SizedBox(height: 20.0,),

                                              Text('please enter valid value',style:TextStyle(fontSize: 12.0,decoration: prefix0.TextDecoration.none,color: Colors.grey))
,
                                              SizedBox(height: 80.0,),

                                              Row(mainAxisAlignment: prefix0.MainAxisAlignment.center,
                                              children: <Widget>[
                                                prefix0.Container(
                                                  height: 1.0,
                                                  width: 30.0,
                                                  color: Colors.grey,
                                                ),

                                                Text("  try again  ",style: prefix0.TextStyle(color: Colors.grey,fontSize: 10.0),),

                                                prefix0.Container(
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
                           else {
                           print(widget.yearss);
                           

                           showDialog(
                                    context: context,
                                    builder: (builder){
                                      return Center(
                                       child: Material(
                                            child: Container(
                                          height: 300.0,
                                          width: 300.0,
                                          decoration: prefix0.BoxDecoration(
                                            border: Border.all(color:Colors.black),
                                          ),
                                          child: Column(children: <Widget>[

                                            SizedBox(height: 30.0,),
                                              Container(
                                              
                                                child: CircularProgressIndicator(),
                                              ),
                                              SizedBox(height: 10.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('UPLOADING...',style: TextStyle(color: Colors.blue[600],decoration: prefix0.TextDecoration.none),),
                                              ],),

                                              SizedBox(height: 20.0,),

                                              Text('please do not press any key',style:TextStyle(fontSize: 12.0,decoration: prefix0.TextDecoration.none,color: Colors.grey))
,
                                              SizedBox(height: 80.0,),

                                              Row(mainAxisAlignment: prefix0.MainAxisAlignment.center,
                                              children: <Widget>[
                                             

                                                Text("you will be promted to the home screen once its uploaded",style: prefix0.TextStyle(color: Colors.grey,fontSize: 10.0),),

                                             
                                              ],),

                                            
                                          
                                          ],),
                                          
                                        ),
                                                                        ),
                                      );
                                    }
                                  );

                           
                            
                            await putData(widget.i);



                            

                            Navigator.of(context).pop();

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp(i:widget.i,name:name.text)));
                           }
                         },
                         
                       ),
                       )
                     ],)
                   ],
                 ),
               ],
             ),
           
   
       ),
     );
   }
}