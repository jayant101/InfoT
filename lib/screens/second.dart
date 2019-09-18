import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:image_picker/image_picker.dart';
import './phoneverification.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import './home.dart';


class Second extends StatefulWidget{
  File sampleImage;
  Second({this.sampleImage});
  @override 
  SecondState createState() => SecondState();
}

class SecondState extends State<Second>{
  
  
  String subject='';
  String yearss='';






Widget uploadImage(index){

  if(index == 0){
   return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(sampleImage0,height: 400.0, width: 500.0, ),
            
          ],
        ),
     
   );
  }
 
  if(index == 1){

     print('hogya');
  
   return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(sampleImage1,height: 400.0, width: 500.0, ),
            
          ],
        ),
     
   );
  }
  if(index == 2){
    print(index+1);
   return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(sampleImage2,height: 400.0, width: 500.0, ),
            
          ],
        ),
     
   );
  }
  if(index == 3){
    print('ni hora');
   return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(sampleImage3,height: 400.0, width: 500.0, ),
            
          ],
        ),
     
   );
  }
  
}
  var noofpics = ['1','2','3','4'];
  var _currentItemSelectedpics = '1';

 var _year = ['select year','First','Second','Third','Fourth'];
  var _currentItemSelected = 'select year';
  
 var subF = ['select subject','Chemistry','Mathematics-I','Physics','FEE','Communication','English',
'FOEE','FoIT'
, 'Mathematics-II', 'FME','DS'];
 var _currentItemSelectedF = 'select subject';

 var subS = ['select subject','ADDA','DCS','OOPM','DS','PC','DBMS','CS','CA','M3','Java'];
 var _currentItemSelectedS = 'select subject';

 var subT = ['select subject','TOC','ISM','CN','OS','DC','ITNM','SE','CGM','CC','CD'];
 var _currentItemSelectedT = 'select subject';

 var subFor = ['select subject','DS','WMC','OOAD','DMW','AI','IS','SC','Data Science','USP'];
 var _currentItemSelectedfor = 'select subject';

 var naya = [''];
 var newselected;




 String phonenumber;
 String verificationid;
 String smscode;

 Future<void> verifyphone()async {
  final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
    this.verificationid = verId;
  };
  final PhoneCodeSent smsCodeSent = (String verId,[ int forceCodeSent]){
    this.verificationid = verId; 
  };

  final PhoneVerificationCompleted verifiedSuccess = (user){
     print('verified');
  };

  final PhoneVerificationFailed verificationFailed = (AuthException exception){
   print('${exception.message}');
  };


    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phonenumber,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const  Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verificationFailed,
    );

 }

 Future<bool>smsCodeDialog(BuildContext context){
   return showDialog(
     context: context,
     barrierDismissible: false,
     builder: (context){
       return new AlertDialog(
         title: Text('Enter the code'),
         content: TextField(
           onChanged: (value){
             this.smscode = value;
           },
         ),
         contentPadding: EdgeInsets.all(10.0),
         actions: <Widget>[
           new FlatButton(
             child: Text('done'),
             onPressed: (){
               FirebaseAuth.instance.currentUser().then((user){
                 if(user !=null){
                   Navigator.of(context).pop();
                   Navigator.of(context).popAndPushNamed('/homepage');

                 }
                 else{
                   Navigator.of(context).pop();
                 }
               }); 
             },
           )
         ],
       );
     }

   );
 }


 dropdown(_currentSelectedItem){
   if(_currentItemSelected == 'First'){
    
   yearss= _currentItemSelected;

     return  DropdownButton<String>(
              underline: Container(),
              items: subF.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,),
                      );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelectedF = newValueSelected ; 
                       this.subject = newValueSelected;
                      });

              },
              value: _currentItemSelectedF,

              

              ) ;
     
   }

   if(_currentItemSelected == 'Second'){

    

      yearss = _currentItemSelected;
    
     
     return  DropdownButton<String>(
              underline: Container(),
              items: subS.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,),
                      );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelectedS = newValueSelected ; 
                       this.subject = newValueSelected;
                      });

              },
              value: _currentItemSelectedS,

              ) ;
   }

     if(_currentItemSelected == 'Third'){

      
        yearss=_currentItemSelected; 
     

       return  DropdownButton<String>(
              underline: Container(),
              items: subT.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,),
                      );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelectedT = newValueSelected ;
                       this.subject=newValueSelected; 
                      });

              },
              value: _currentItemSelectedT,

              ) ;
     }

     else{

     
        yearss='Fourth'; 
    

       return  DropdownButton<String>(
              underline: Container(),
              items: subFor.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,),
                      );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelectedfor = newValueSelected ; 
                       this.subject = newValueSelected;
                      });

              },
              value: _currentItemSelectedfor,

              ) ;
     }
   

 }


  String url;
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  
   final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = ' ';
  int i=1;
  String _verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;

  
   // Example code of how to verify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
       
         showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success!!!',style: TextStyle(color: Colors.green),),
            actions: <Widget>[
              FlatButton(
                child: Text('done'),
                onPressed: (){
                  Navigator.of(context).pop();
                   Navigator.of(context).pop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneSignInSection(sampleImage:widget.sampleImage,sampleImage0:sampleImage0
                    ,sampleImage1:sampleImage1,sampleImage2:sampleImage2,sampleImage3:sampleImage3,yearss:yearss,subject:subject,i:i)));
      

                },
              )
            ],
          );
        }
      );
        _message = 'Already verified...';
        print('verification ho chuka hai');
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
       showDialog(
         context: context,
         builder: (contex){
           return AlertDialog(
             content: Text('Please check your phone for the verification code.'),
             title: Text('Code Sent',style: TextStyle(color: Colors.lightBlue),),
           );
         }
       );
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

   // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
      
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if(user !=null){
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success!!!',style: TextStyle(color: Colors.green),),
            actions: <Widget>[
              FlatButton(
                child: Text('done'),
                onPressed: (){
                  Navigator.of(context).pop();
                   Navigator.of(context).pop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneSignInSection(sampleImage:widget.sampleImage,sampleImage0:sampleImage0
                    ,sampleImage1:sampleImage1,sampleImage2:sampleImage2,sampleImage3:sampleImage3,yearss:yearss,subject:subject,i:i)));
      

                },
              )
            ],
          );
        }
      );
    }
    setState(() {
      if (user != null) {
        
        _message = 'Successfully signed in. ';
        
        
     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneSignInSection()));
        
      } else {
        _message = 'Sign in failed';
      }
    });

    
  }

  File sampleImage0;
  File sampleImage1;
  File sampleImage2;
  File sampleImage3;
  File sampleImage4;
  

    


    Future getImage(int index) async{
  
    

      if(index == 0){
        var temp = await ImagePicker.pickImage(source: ImageSource.gallery);


    var result = await FlutterImageCompress.compressAndGetFile(
        temp.path,
        temp.path,
        quality: 95,
        
    );


    setState(() {
      sampleImage0 = result;
      print(sampleImage0.lengthSync());
    });
      }
        
        

      if(index == 1){
        var temp = await ImagePicker.pickImage(source: ImageSource.gallery);


    var result = await FlutterImageCompress.compressAndGetFile(
        temp.path,
        temp.path,
        quality: 95,
        
    );


    setState(() {
      sampleImage1 = result;
      print(sampleImage1.lengthSync());
    });
      }

    

      if(index == 2){
        var temp = await ImagePicker.pickImage(source: ImageSource.gallery);


    var result = await FlutterImageCompress.compressAndGetFile(
        temp.path,
        temp.path,
        quality: 95,
        
    );


    setState(() {
      sampleImage2 = result;
      print(sampleImage2.lengthSync());
    });
      }
    

      if(index == 3){
        var temp = await ImagePicker.pickImage(source: ImageSource.gallery);


    var result = await FlutterImageCompress.compressAndGetFile(
        temp.path,
        temp.path,
        quality: 95,
        
    );


    setState(() {
      sampleImage3 = result;
      print(sampleImage3.lengthSync());
    });
      }
    

    
     

  }
     

     newImage(int a){
    
     if(a == 0){
        return Center(
          child: sampleImage0 == null? Stack(
                                children: <Widget>[
                                    
                                    
                                Center(child: Container(
                                  height: 400.0,
                                  width: 350.0,
                                  child: Image.asset('assets/food12.jpg',fit: BoxFit.cover,),
                                ),),

                                  Container(
                                    height:400.0,
                                    width:350.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(120, 0, 0, 0),
                                          Color.fromARGB(120, 0, 0, 0)
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                  
                                  ),


                                  Center(

                                    child: Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.height/6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 100,
                                      ),
                                      child: Center(
                                             child: Text(
                                            'select image ${a}\n\n\n',
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 15,
                                             
                                            ),
                                            textAlign: TextAlign.center,
                                          
                                        ),
                                      ),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('swipe to select more',style: TextStyle(color: Colors.grey[300],fontSize: 12.0),),
                                        ],
                                      ),
                                      SizedBox(height: 3.0,)
                                    ],
                                  )

                                ],
                              ):uploadImage(a)
        );
      }


        

       if(a == 1){
        return Center(
          child: sampleImage0 == null||sampleImage1==null? Stack(
                                children: <Widget>[
                                    
                                    
                                Center(child: Container(
                                  height: 400.0,
                                  width: 350.0,
                                  child: Image.asset('assets/food12.jpg',fit: BoxFit.cover,),
                                ),),

                                  Container(
                                    height:400.0,
                                    width:350.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(120, 0, 0, 0),
                                          Color.fromARGB(120, 0, 0, 0)
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                  
                                  ),


                                  Center(

                                    child: Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.height/6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 100,
                                      ),
                                      child: Center(
                                             child: Text(
                                            'select image ${a}\n\n\n',
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 15,
                                             
                                            ),
                                            textAlign: TextAlign.center,
                                          
                                        ),
                                      ),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('swipe to select more',style: TextStyle(color: Colors.grey[300],fontSize: 12.0),),
                                        ],
                                      ),
                                      SizedBox(height: 3.0,)
                                    ],
                                  )

                                ],
                              ):uploadImage(a)
        );
      }


       if(a == 2){
        return Center(
          child: sampleImage0 == null||sampleImage1==null||sampleImage2==null? Stack(
                                children: <Widget>[
                                    
                                    
                                Center(child: Container(
                                  height: 400.0,
                                  width: 350.0,
                                  child: Image.asset('assets/food12.jpg',fit: BoxFit.cover,),
                                ),),

                                  Container(
                                    height:400.0,
                                    width:350.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(120, 0, 0, 0),
                                          Color.fromARGB(120, 0, 0, 0)
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                  
                                  ),


                                  Center(

                                    child: Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.height/6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 100,
                                      ),
                                      child: Center(
                                             child: Text(
                                            'select image ${a}\n\n\n',
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 15,
                                             
                                            ),
                                            textAlign: TextAlign.center,
                                          
                                        ),
                                      ),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('swipe to select more',style: TextStyle(color: Colors.grey[300],fontSize: 12.0),),
                                        ],
                                      ),
                                      SizedBox(height: 3.0,)
                                    ],
                                  )

                                ],
                              ):uploadImage(a)
        );
      }


       if(a == 3){
         print('aagya $a');
        return Center(
          child: sampleImage0 == null||sampleImage1==null||sampleImage2==null||sampleImage3==null
       
       ? Stack(
                                children: <Widget>[
                                    
                                    
                                Center(child: Container(
                                  height: 400.0,
                                  width: 350.0,
                                  child: Image.asset('assets/food12.jpg',fit: BoxFit.cover,),
                                ),),

                                  Container(
                                    height:400.0,
                                    width:350.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(120, 0, 0, 0),
                                          Color.fromARGB(120, 0, 0, 0)
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                  
                                  ),


                                  Center(

                                    child: Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.height/6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                        minWidth: 50,
                                        minHeight: 100,
                                      ),
                                      child: Center(
                                             child: Text(
                                            'select image ${a}\n\n\n',
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 15,
                                             
                                            ),
                                            textAlign: TextAlign.center,
                                          
                                        ),
                                      ),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('',style: TextStyle(color: Colors.grey[300],fontSize: 12.0),),
                                        ],
                                      ),
                                      SizedBox(height: 3.0,)
                                    ],
                                  )

                                ],
                              ):uploadImage(a)
        );
      }






     }








  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30.0,),

         
     
          
            Row(
              children: <Widget>[
                Text(
                      "     UPLOAD",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    ],
            ),

            

                SizedBox(height: 15.0,),

                 Row(
                   children: <Widget>[

                     SizedBox(width: 25.0,),
                     DropdownButton<String>(
              underline: Container(),
              items: noofpics.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem,),
                          );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                          setState(() {
                           this._currentItemSelectedpics = newValueSelected ; 
                            i = int.parse(newValueSelected);
                          });

              },
              value: _currentItemSelectedpics,

              

              ),

              SizedBox(width:230.0),
              Text('only img\ndo not go above 1.5 mb',style: TextStyle(color:Colors.red,fontSize: 9.0),)
                   ],
                 ) ,

              SizedBox(height: 15.0,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
         



              Container(
                 height: 410.0,
                 width: 350.0,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: i,
                   itemBuilder: (context,index){
                     return  InkWell(
                       onTap: (){
                         getImage(index);
                       },
                       child: Card(
                       clipBehavior: Clip.hardEdge,
                    
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
                   child: Container(
                         height: 400.0,
                         width: 350.0,
                        child: newImage(index)
                        ),
                   ),
                     );

                   },
                    
                 ),
               ),
            

             SizedBox(height: 10.0),

             Text('Fill details',style: TextStyle(color: Colors.blue),),
             SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

               



             

              

               DropdownButton<String>(
              underline: Container(),
              items: _year.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,),
                      );
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelected = newValueSelected ; 
                      });

              },
              value: _currentItemSelected,

              ) ,

              SizedBox(width: 10.0,),

              
              dropdown(_currentItemSelected),

             
              
              
              ],
            ),
             



             RaisedButton(
            elevation: 6.0,
            child: Text('Upload'),
            onPressed: () 
            {

              
             if((yearss != '' && subject != '')&&yearss!='select year'&&subject!='select subject'&&sampleImage0!=null)
     
                 {
                  
                
                  showDialog(
                context: context,
                builder: (context){
                  return Center(
                    child: Material(
                        
                      child:  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                     
                            height: 500.0,
                            width: 350.0,
                            child:  ListView(
        
        children: <Widget>[

          Container(
                                 
                                
                                  height: 150.0,
                            width: 350.0,
                                 child: Image.asset('assets/new11.jpg',fit: BoxFit.cover,alignment: Alignment.topCenter,)
                                  ),
                                  SizedBox(height: 10.0,),
        
         
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
           
            child: TextFormField(
              
              controller: _phoneNumberController,

              style: TextStyle(color: Colors.black),
              decoration:
                  InputDecoration(hintText: 'Phone number (+xx xxxxxxxxxx)',
                  
                  
                  hintStyle: TextStyle(fontSize: 12.0,color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0)
                  )
                  ),
                 
                  
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Phone number (+x xxx-xxx-xxxx)';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10.0,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120.0,
                height: 20.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green,width:2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: FlatButton(
                  
                  child: Text('verify number',style: TextStyle(color: Colors.green,fontSize: 12.0),),
                  onPressed: () async {
                   
                    _verifyPhoneNumber();
                  
                    
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      child: TextField(
              style: TextStyle(color: Colors.black),
              controller: _smsController,
              
              decoration: InputDecoration(hintText: 'Verification code',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0)
              ),
              hintStyle: TextStyle(fontSize: 12.0,color: Colors.black,),
              
              ),
            ),
          ),
          SizedBox(height: 10.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[ Container(
              width: 120.0,
                  height: 20.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green,width:2.0),
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: FlatButton(
                onPressed: () async {

                  _signInWithPhoneNumber();
                },
                child: Text('validate code',style: TextStyle(color: Colors.green,fontSize: 12.0),),
              ),
            ),
            ]
            
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _message,
              style: TextStyle(color: Colors.red),
            ),
          ),

          

       
        ],
      ),
                          
                          ),
                     
                    ),
                  );
                }
              );
           
           
              }







               
                else      {
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

                                              Text('please enter valid value\n     or select image',style:TextStyle(fontSize: 12.0,decoration: prefix0.TextDecoration.none,color: Colors.grey))
,                                             
                                              SizedBox(height: 80.0,),

                                            

                                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                prefix0.Container(
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

              







            
            
             



                
            }
             )
            ]
          ) 
        ],
      ),
        
      
      
      
      
  
    
    );
  }
  
}