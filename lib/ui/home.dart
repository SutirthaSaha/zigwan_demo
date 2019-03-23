//home page bottom drawer child

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:zigwan_demo/ui/drawer.dart';
import 'package:zigwan_demo/ui/notififcations.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  List images;

  vCard(int i){
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left:5.0,right: 5.0),
              child:Row(
                children: <Widget>[
//                  CircleAvatar(child: Image.network(data[0]['thumbnailUrl']),),
                  Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(data[i]['thumbnailUrl']),
                              fit:BoxFit.cover),
                          borderRadius: BorderRadius.circular(35.0)
                      )
                  ),
                  SizedBox(width: 5.0,),
                  Expanded(child:Text("user name")),
                  Text("12 mins ago")
                ],
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.3,
              child: Center(
                child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data[i]['thumbnailUrl']),
                  fit: BoxFit.cover
              )
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left:5.0,right: 5.0),
              child:Row(
                children: <Widget>[
                  Expanded(child:Text("Video Title")),
                  Icon(Icons.visibility),
                  Text("100")
                ],
              )
            )
          ],
        ),
      ),
    );
  }
  videosCard(){
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context,index){
          return Card(
              color: Colors.black87,
              child: Container(
                width: MediaQuery.of(context).size.width*0.65,
                child: Center(
                  child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data[index]['thumbnailUrl']),
                        fit: BoxFit.cover
                    )
                ),
              ));
        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerLayout(context),
        appBar: AppBar(
          title: Text("Zigwan"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Search');
              },
              padding: EdgeInsets.only(right: 0),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
          ],
        ),
        body: data == null ? Container() : ListView(
          children: <Widget>[
            //vCard(5),
            SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.35,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: new Carousel(
                  images: images.sublist(0, 4),
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  //dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  //borderRadius: true,
                )
            ),
            SizedBox(height: 10,child: Container(
              color: Colors.grey[200],
            ),),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.videocam,size:24),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Text("Videos",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(2),
                    child:Text("More",style: TextStyle(color: Colors.white),),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            videosCard(),
            SizedBox(height: 10,child: Container(
              color: Colors.grey[200],
            ),),
            InkWell(
              onTap: () {/*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainApp()),
              );*/
            },
            child: Container(
              height: 150,
              //margin: EdgeInsets.only(left: 7, right: 7),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                //borderRadius: BorderRadius.circular(10.0),
                image: new DecorationImage(
                  image: new NetworkImage(
                      "https://www.lemontreehotels.com/img/Early-Bird.png"),
                  fit: BoxFit.cover),
              ),
              ),
            ),
            SizedBox(height: 10,child: Container(
              color: Colors.grey[200],
            ),),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
              child: Row(
                children: <Widget>[
                  ImageIcon(AssetImage('images/competition.png'),size: 24,),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Text("Competitions Near You",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(2),
                    child:Text("More",style: TextStyle(color: Colors.white),),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            videosCard(),
            SizedBox(height: 10,child: Container(
              color: Colors.grey[200],
            ),),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
              child: Row(
                children: <Widget>[
                  ImageIcon(AssetImage('images/workshop.png'),size: 24,),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Text("Workshops Near You",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(2),
                    child:Text("More",style: TextStyle(color: Colors.white),),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            videosCard()
          ],
        )
    );
  }

  Future<String> getJsonData() async{
    var response=await http.get(
      Uri.encodeFull(photo_url),
      headers: {
        "Accept":"application/json"
      }
    );
  //    print(response.body);
    setState(() {
      var convertDataToJson=jsonDecode(response.body);
      data=convertDataToJson;
      images=List(data.length);
      for(int i=0;i<data.length;i++){
        images[i]=NetworkImage(data[i]['thumbnailUrl']);
      //print(images[i]);
      }
    });

    return "Success";
  }
}

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer:  drawerLayout(context),
//      appBar: AppBar(
//        title: Text('ZigWan'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {
//              debugPrint('Search');
//
//            },
//            padding: EdgeInsets.only(right: 0),
//          ),
//          IconButton(
//            icon: Icon(Icons.notifications),
//            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => Notifications()));
//            },
//          ),
//        ],
//      ),
//      backgroundColor: Color.fromARGB(255, 210, 210, 210),
//      body: HomeWidget(),
//    );
//  }
//}
//
//class HomeWidget extends StatefulWidget {
//  @override
//  _HomeWidgetState createState() => _HomeWidgetState();
//}
//
//class _HomeWidgetState extends State<HomeWidget> {
//  @override
//
//  var url1 =
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsdHkWJVisKCslDjIqzIdFI4P96hhvfZz8qJq1MTNH4ksPPqI9Jg";
//  var url2 =
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAbgfvOkUmMmNg4lDvpDV1NLFIlhcJEWRsJToL2IPgCXh36WSq";
//  var url3 =
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdW_ku49ZIwEiXVBqwQ30f3G8C3vTO-oECLCoaGcM5_y5pRM9jDQ";
//  var url4 =
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROIz7Yeo62izwb6vxRvGg7uv6ksEk0Y10hflEY-ubcCYkjSyKU_g";
//  var url5 =
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpjlAdJum0BhVookqbPf3MuOpaNW80sQT0Edo0lTb8sJ9thXSPBQ";
//
//  Widget _helper(ur) {
//    return InkWell(
//      child: Container(
//        decoration: new BoxDecoration(
//            borderRadius: BorderRadius.circular(10),
//            border: new Border.all(
//                color: Colors.white, width: 5.0, style: BorderStyle.solid),
//            image: new DecorationImage(
//                image: new NetworkImage(ur), fit: BoxFit.cover)),
//      ),
//      onTap: () {/*
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => MainApp()),
//        );*/
//      },
//    );
//  }
//
//  Widget build(BuildContext context) {
//    var width = MediaQuery.of(context).size.width;
//    Widget _buttonWithLabel(var message1, var message2, var height, Icon icon) {
//      return Container(
//        color: Colors.white,
//        margin: EdgeInsets.only(top: 5, bottom: 0.0),
//        height: height,
//        child: Row(
//          children: <Widget>[
//            Text("  "),
//            icon,
//            Container(
//              padding: EdgeInsets.only(right: 10, top: 7, bottom: 5),
//              width: width * 0.65,
//              child: Text(
//                message1,
//                style: TextStyle(
//                  fontSize: 14,
//                  color: Color.fromARGB(255, 130, 130, 130),
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
//              width: width * 0.25,
//              child: FlatButton(
//                color: Colors.blue,
//                child: new Text(
//                  message2,
//                  style: TextStyle(
//                    fontSize: 10,
//                  ),
//                ),
//                // color:  Colors.blueAccent[600],
//                onPressed: () {
//                  debugPrint(message2);
//                },
//              ),
//            ),
//          ],
//        ),
//      );
//    }
//
//    return ListView(
//      padding: EdgeInsets.all(0.0),
//      children: <Widget>[
//        Container(
//          child: Material(
//            child: Container(
//              height: 200,
//              child: Carousel(dotBgColor: Colors.transparent, images: [
//                NetworkImage(url1),
//                NetworkImage(url2),
//                NetworkImage(url3),
//                NetworkImage(url4),
//              ]),
//            ),
//          ),
//        ),
//        Divider(
//          height: 6,
//          color: Colors.transparent,
//        ),
//        _buttonWithLabel(
//            "  Videos  ",
//            "More",
//            40.0,
//            Icon(
//              Icons.videocam,
//            )),
//        // _myLine(),
//        Container(
//          padding: EdgeInsets.only(top: 0.0),
//          height: 160,
//          color: Colors.white,
//          child: Material(
//            child: ListView(
//              physics: const BouncingScrollPhysics(),
//              addAutomaticKeepAlives: false,
//              itemExtent: 160,
//              reverse: false,
//              scrollDirection: Axis.horizontal,
//              children: <Widget>[
//                _helper(url1),
//                _helper(url2),
//                _helper(url3),
//                _helper(url4),
//                _helper(url5),
//              ],
//            ),
//          ),
//        ),
//        //  _buttonWithLabel("   Explore More Videos  ", "More", 40.0),
//        Divider(
//          color: Colors.transparent,
//          height: 10,
//        ),
//        InkWell(
//          onTap: () {/*
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => MainApp()),
//            );*/
//          },
//          child: Container(
//            height: 150,
//            margin: EdgeInsets.only(left: 7, right: 7),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10.0),
//              image: new DecorationImage(
//                  image: new NetworkImage(
//                      "https://www.lemontreehotels.com/img/Early-Bird.png"),
//                  fit: BoxFit.cover),
//            ),
//          ),
//        ),
//        Divider(
//          height: 6,
//          color: Colors.transparent,
//        ),
//        _buttonWithLabel(
//            "Workshps near you ", "More", 40.0, Icon(Icons.pregnant_woman)),
//        //  _myLine(),
//        Container(
//          height: 160,
//          color: Colors.white,
//          child: Container(
//            child: Material(
//              child: ListView(
//                physics: const BouncingScrollPhysics(),
//                addAutomaticKeepAlives: false,
//                itemExtent: 160,
//                reverse: false,
//                scrollDirection: Axis.horizontal,
//                children: <Widget>[
//                  _helper(url1),
//                  _helper(url2),
//                  _helper(url3),
//                  _helper(url4),
//                  _helper(url5),
//                ],
//              ),
//            ),
//          ),
//        ),
//        Divider(
//          color: Colors.transparent,
//          height: 10,
//        ),
//        InkWell(
//          onTap: () {/*
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => MainApp()),
//            );*/
//          },
//          child: Container(
//            margin: EdgeInsets.only(left: 7, right: 7),
//            height: 150,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10.0),
//              image: new DecorationImage(
//                  image: new NetworkImage(
//                      "https://www.lemontreehotels.com/img/Early-Bird.png"),
//                  fit: BoxFit.cover),
//            ),
//          ),
//        ),
//        Divider(
//          height: 6,
//          color: Colors.transparent,
//        ),
//        _buttonWithLabel("Competitions near you ", "More", 40.0,
//            Icon(IconData(0xe800, fontFamily: 'newIcons'))),
//        //   _myLine(),
//        Container(
//          height: 160,
//          color: Colors.white,
//          child: Container(
//            child: Material(
//              child: ListView(
//                physics: const BouncingScrollPhysics(),
//                addAutomaticKeepAlives: false,
//                itemExtent: 160,
//                reverse: false,
//                scrollDirection: Axis.horizontal,
//                children: <Widget>[
//                  _helper(url1),
//                  _helper(url2),
//                  _helper(url3),
//                  _helper(url4),
//                  _helper(url5),
//                ],
//              ),
//            ),
//          ),
//        ),
//        Divider(
//          color: Colors.transparent,
//          height: 20,
//        ),
//      ],
//    );
//  }
//}