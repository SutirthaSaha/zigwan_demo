import 'package:flutter/material.dart';

class ChoreographerProfilePage extends StatefulWidget {
  @override
  _ChoreographerProfilePageState createState() => _ChoreographerProfilePageState();
}

class _ChoreographerProfilePageState extends State<ChoreographerProfilePage> {
  var pic = "https://www.thewrap.com/wp-content/uploads/2017/07/Robert-Downey-Jr-Iron-Man-Pepper-Potts-Tony-Stark.jpg";

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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[

              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset("images/background.png",fit: BoxFit.fill,),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height:MediaQuery.of(context).size.height * 0.1,
                      ),
                      //Text("Choreographer Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                      Container(
//                        margin: EdgeInsets.all(5),
//                        padding: EdgeInsets.only(left:5.0,right: 5.0),
                        width:MediaQuery.of(context).size.width*0.4,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child:Text(
                            "Choreographer name",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize:20
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
//                alignment: Alignment.bottomLeft,
                bottom: 0,
                left:5,
                child: Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Container(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(pic),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: BackButton(color:Colors.white),
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
                    child: Text("Videos",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          postsCard(),
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
              ],
            ),
          ),
          noPostsCard(),
        ],
      ),
    );
  }
}
