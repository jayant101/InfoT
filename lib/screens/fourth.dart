import 'package:flutter/material.dart';

class Fourth extends StatefulWidget{
  @override 
  FourthState createState()=>FourthState();
}

class FourthState extends State<Fourth>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/nn.jpg'),
                fit: BoxFit.contain
              ),
            ),
            child: Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.6)),
          ),
          ),

          Column(
            children: <Widget>[
              SizedBox(height: 30.0,),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/nn1.jpg',),
                          fit: BoxFit.cover
                        ),
                        color: Colors.grey[200],
                      ),
                      
                      height: 130.0,
                      width: 130.0,
                      
                    ),

                    SizedBox(width: 20.0,),

                    Text('Developers\nMessage',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w900,fontSize: 20.0,letterSpacing: 4.0),)
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Specific Content',style:TextStyle(color:Colors.grey[500],letterSpacing: 4.0,fontWeight: FontWeight.w600,fontSize:15.0)),
              ),

              Padding(
                 padding: EdgeInsets.all(10.0),
                 child: RichText(
                  
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[500],fontSize: 13.0),
                  children: [
                    TextSpan(
                      text: 'Upload'
                    ),
                     TextSpan(
                      text: ' C',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                     TextSpan(
                      text: 'ontent'
                    ),
                     TextSpan(
                      text: ' precisely , once the content is uploaded , only '
                    ),
                     TextSpan(
                      text: 'developer ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),

                      
                    ),

                    TextSpan(
                      text: 'can delete it.'
                    ),
                  ]
                  ),

                ),
              ),

              Padding(
                padding: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
                child: Text('Suspicious Upload',style: TextStyle(fontSize: 15.0,color: Colors.grey[500],fontWeight: FontWeight.w600,letterSpacing: 4.0),),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: RichText(

                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[500],fontSize: 13.0),
                    children: [
                      TextSpan(
                        text:'IN CASE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),


                      ),

                      TextSpan(
                        text: ' of suspicious upload , '
                      ),
                      TextSpan(
                        text: 'D',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: 'epartment will take respective action towards the uploader.'
                      ),
                    ]
                  ),
                ),
              ),

              SizedBox(height: 50.0,),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[500],fontSize: 13.0),
                  children: 
                  [
                    TextSpan(
                      text: 'do'
                    ),

                    TextSpan(
                      text: ' SHOW LOVE N SUPPORT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                       letterSpacing: 4.0,
                        fontSize: 18.0,

                      )
                    ),
                  ]
                ),
              ),
              SizedBox(height: 8.0,),
              Text('Upload exam papers as much as you can',style: TextStyle(fontSize: 12.0,color: Colors.grey[500]),),

              SizedBox(height: 28.0,),
              Text('For any Bug or Suggestions\ncontact',style: TextStyle(color: Colors.grey[500],fontSize: 12),),
              

              SizedBox(height: 20.0,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){},
         
                      child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/nn3.jpg'),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    
                  ),

                  SizedBox(width: 8.0,),
                     Text('jayantkamble10000@gmail.com  \n              +918269407180',style: TextStyle(color:Colors.grey[500],fontSize: 12.0 ),),
                   SizedBox(height:30.0),
                  InkWell(
                    onTap: (){},
         
                      child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/nn2.jpg'),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    
                  ),
                   


                ],
              ),

              
              
            
            
            
            ],
          )
        ],
      )
      
    );
  }
} 