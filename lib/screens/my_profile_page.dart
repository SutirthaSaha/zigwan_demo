import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;

    postsCard(){
      return Container(
        height: screenSize.height*0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context,index){
            return Card(
                color: Colors.black87,
                child: Container(
                  width: screenSize.width*0.65,
                  child: Center(
                    child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/background.png"),
                          fit: BoxFit.cover
                      )
                  ),
                ));
          },
        ),
      );
    }

    noPostsCard() {
      return Card(
          color: Colors.black87,
          child: Container(
            height: screenSize.height*0.3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.sentiment_dissatisfied,color: Colors.white,size: 30.0,),
                  SizedBox(height: 5.0,),
                  Text("No Posts Yet",style: TextStyle(color: Colors.white,fontSize: 15.0),),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: (){
                      print("Post Now");
                    },
                    child: Text("POST NOW",style: TextStyle(color: Colors.black),),)
                ],
              ),
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset("images/background.png",fit: BoxFit.fill,),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("UserName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.0),),
                ),
              )
            ],
          ),
          Card(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("3189921467"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Address"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("email@gmail.com"),
                  ),
                  ListTile(
                    leading: Icon(Icons.cake),
                    title: Text("dd-mm-yyyy"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Events",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child:Icon(Icons.edit,color:Colors.black),
                  )
                ],
              ),
          ),
          postsCard(),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Videos",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Icon(Icons.edit,color:Colors.black),
                )
              ],
            ),
          ),
          noPostsCard(),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("About",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(Icons.edit,color:Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text("Interests",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Icon(Icons.edit,color:Colors.black),
                )
              ],
            ),
          ),
          noPostsCard(),
        ],
      ),
    );
  }
}
