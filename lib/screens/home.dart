import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:infotech/screens/trending.dart';
import 'package:infotech/util/categories.dart';
import 'package:infotech/util/categorie.dart';
import 'package:infotech/util/friends.dart';
import 'package:infotech/util/restaurants.dart';
import 'package:infotech/util/restaurant.dart';
import './Papers.dart';
import './paperssecond.dart';
import './papersthird.dart';
import './papersfourth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:infotech/widgets/slide_item.dart';
import 'package:infotech/widgets/trending_item.dart';

//import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class Home extends StatefulWidget {
  int i;
  var name;
  Home({this.i,this.name});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  final TextEditingController _searchControl = new TextEditingController();




  @override
  void initState(){
    super.initState();
   // getPhoto();
  }

   getData() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('contributers').getDocuments();

    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Card(
            elevation: 6.0,
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                    children:<Widget>[ RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  I',
                          style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900,fontSize: 25.0)
                        ),
                        TextSpan(
                          text: 'nfoT',
                          style: TextStyle(color:Colors.black,fontSize: 25.0,fontWeight: FontWeight.w900)
                        ),
                        TextSpan(
                          text: '  first common platform for IT students',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200,fontSize: 9.0)
                        ),
                      ]
                    ),
                  ),
                    ]
              ),
              
            ),
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "First Year",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

               
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:restaurants == null ? 0 :restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Papers(index:index,i:widget.i)));
                    },
                      child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SlideItem(
                        img: restaurant["img"],
                        title: restaurant["title"],
                        address: restaurant["address"],
                        rating: restaurant["rating"],
                      ),
                    ),
                  );
                },
              ),
            ),

             SizedBox(height: 20.0),

               SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Second Year",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

               
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];

                  return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PapersSecond(index:index)));
                     },
                      child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              cat['img'],
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.2, 0.7],
                                  colors: [
                                    cat['color1'],
                                    cat['color2'],
                                  ],
                                  // stops: [0.0, 0.1],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                            ),


                            Center(

                              child: Container(
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.height/6,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    cat["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
                
                
                
              
            ),

             SizedBox(height: 20.0),

               SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Third Year",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

            
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:restaurant == null ? 0 :restaurant.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurantss = restaurant[index];

                  return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> PapersThird(index:index)));
                     },
                      child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SlideItem(
                        img: restaurantss["img"],
                        title: restaurantss["title"],
                        address: restaurantss["address"],
                        rating: restaurantss["rating"],
                      ),
                    ),
                  );
                },
              ),
            ),

           SizedBox(height: 20.0),

               SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fourth Year",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

              
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categorie == null ? 0:categorie.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cats = categorie[index];

                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PapersFourth(index:index)));
                      },
                 
                      child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              cats['img'],
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                              fit: BoxFit.cover,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.2, 0.7],
                                  colors: [
                                    cats['color1'],
                                    cats['color2'],
                                  ],
                                  // stops: [0.0, 0.1],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.height/6,
                            ),


                            Center(

                              child: Container(
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.height/6,
                                padding: EdgeInsets.all(1),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    cats["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
                  
              
              
              
              
              
              
              
              
               
            ),

            
 SizedBox(height: 20.0),

               SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Material Contribution",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                
              ],
            ),

            SizedBox(height: 10.0),


             Container(
              height: 50.0,
              width: 50.0,
              child: FutureBuilder(
                future: getData(),
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: Container(child: Text(''),),);


                  }

                  else{

                    return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:snapshot.data.length,//restaurant == null ? 0 :restaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                
                   return Padding(
                     padding: EdgeInsets.only(right:10.0),
                                        child: Container(
                       height: 50.0,
                       width: 50.0,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(30.0)),
                       child: Container(
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(30.0),
                           child: Image.network(snapshot.data[index].data['url'],fit: BoxFit.cover,))),
                     ),
                   );
                  },
                );

                  }
                },



                              
              ),
            ),

            /*Container(
              height: 50.0,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: friends == null ? 0:friends.length,
                itemBuilder: (BuildContext context, int index) {
                  String img = friends[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        img,
                      ),
                      radius: 25.0,
                    ),
                  );
                },
              ),
            ),*/

            SizedBox(height: 30.0),


          ],
        ),
      ),
    );

  }

  @override
  bool get wantKeepAlive => true;


}
