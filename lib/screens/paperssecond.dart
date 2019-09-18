import 'package:flutter/material.dart';
import 'package:infotech/util/const.dart';
import 'package:infotech/util/restaurants.dart';
import 'package:infotech/widgets/trending_item.dart';
import 'package:photo_view/photo_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PapersSecond extends StatefulWidget {
  var index;
  PapersSecond({this.index});
  @override
  PapersSecondState createState() => PapersSecondState();
}

class PapersSecondState extends State<PapersSecond> {
  final TextEditingController _searchControl = new TextEditingController();

   StorageReference photoref = FirebaseStorage.instance.ref();

   List<String> urls = [''];
   
  

  getPhoto()async{
    //int Max = 7*1024*1024;

    
   //     var url =await photoref.child('image').child('my0.jpg').getDownloadURL();
  
  var firestore = Firestore.instance;

   if(widget.index == 0){
     
    QuerySnapshot url = await firestore.collection('Second n ADDA').getDocuments();

      return url.documents;


   }

   if(widget.index == 1){
     
    QuerySnapshot url = await firestore.collection('Second n DCS').getDocuments();

      return url.documents;


   }

   if(widget.index == 2){
     
    QuerySnapshot url = await firestore.collection('Second n OOPM').getDocuments();

      return url.documents;


   }

   if(widget.index == 3){
     
    QuerySnapshot url = await firestore.collection('Second n DS').getDocuments();

      return url.documents;


   }

   if(widget.index == 4){
     
    QuerySnapshot url = await firestore.collection('Second n PC').getDocuments();

      return url.documents;


   }

   if(widget.index == 5){
     
    QuerySnapshot url = await firestore.collection('Second n DBMS').getDocuments();

      return url.documents;


   }

   if(widget.index == 6){
     
    QuerySnapshot url = await firestore.collection('Second n CS').getDocuments();

      return url.documents;


   }

   if(widget.index == 7){
     
    QuerySnapshot url = await firestore.collection('Second n CA').getDocuments();
    print("url is = $url");

      return url.documents;


   }

   if(widget.index == 8){
     
    QuerySnapshot url = await firestore.collection('Second n M3').getDocuments();
       print("url is = $url");

      return url.documents;


   }

   if(widget.index == 9){
     
    QuerySnapshot url = await firestore.collection('Second n Java').getDocuments();
        print("url is = $url");

      return url.documents;


   }



    
  }

    getData() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('book').getDocuments();

    return qn.documents;
  }

  var index;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Second Year Course"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),

      body:FutureBuilder(
        future: getPhoto(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: Text('Loading...'),);
          }

          else{

            return   Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            


            SizedBox(height: 10.0),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                

                return InkWell (
                 onTap: (){
                   showDialog(
                                    context: context,
                                    builder: (builder){
                                      return Center(
                                       child: Material(
                                            child: Container(
                                         
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.black),
                                          ),
                                          child:Center(
                                             child:  PhotoViewGallery.builder(
        itemCount: snapshot.data[index].data.length-3,
        builder: (context, ind) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              snapshot.data[index].data['url${ind+1}'],
            ),
            // Contained = the smallest possible size to fit one dimension of the screen
            minScale: PhotoViewComputedScale.contained * 0.8,
            // Covered = the smallest possible size to fit the whole screen
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        loadingChild: Center(
          child: CircularProgressIndicator(),
        ),
      ),
                                          ),
                                            

                                            
                                          
                                        
                                          
                                        ),
                                                                        ),
                                      );
                                    }
                                  );
                 },
                 child: Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height/2.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/3.5,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                                snapshot.data[index].data['url1'],
                          
                          fit: BoxFit.cover,
                        ),
                           
                        
                        
                        
                        
                      ),
                    ),

                    Positioned(
                      top: 6.0,
                      right: 6.0,
                      child: Card(
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4.0)),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Constants.ratingBG,
                                size: 10,
                              ),

                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 6.0,
                      left: 6.0,
                      child: Card(
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3.0)),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child:Text(
                            " OPEN ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
              ),

              SizedBox(height: 7.0),

              Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
        text: TextSpan(
          // set the default style for the children TextSpans
          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20),
          children: [
            TextSpan(
                text: 'by  ',
                style: TextStyle(fontSize: 12.0)
            ),
            TextSpan(
              text: snapshot.data[index].data['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          
          ]
        )
      ),

                      
                    
                    
                       
                  ),
              ),

              SizedBox(height: 7.0),

              Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
        text: TextSpan(
          // set the default style for the children TextSpans
          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20),
          children: [
            TextSpan(
                text: '${snapshot.data[index].data['year']}                                                                                   ',
                style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.w300 ),
                
            ),
            TextSpan(
              text: '   ${snapshot.data[index].data['sem']}',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight:FontWeight.w300 
              )
            ),

          
          ]
        )
      ),
                  ),
              ),

              SizedBox(height: 10.0),

            ],
          ),
        ),
      ),
    ),
                );
              },
            ),

            SizedBox(height: 10.0),

          ],
        ),
      );

          }
        },
      ),
      
      
      
      
      
     
    );
  }
}
