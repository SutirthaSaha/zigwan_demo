import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Workshop extends StatefulWidget {
  @override
  _WorkshopState createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar(
          ),
          backgroundColor: Colors.white,

          body: testingWorkshop(),

        ));
  }
}

class testingWorkshop extends StatefulWidget {
  @override
  _testingWorkshopState createState() => _testingWorkshopState();
}

class _testingWorkshopState extends State<testingWorkshop> {
  @override
  var url1 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsdHkWJVisKCslDjIqzIdFI4P96hhvfZz8qJq1MTNH4ksPPqI9Jg";
  var url2 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAbgfvOkUmMmNg4lDvpDV1NLFIlhcJEWRsJToL2IPgCXh36WSq";
  var url3 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdW_ku49ZIwEiXVBqwQ30f3G8C3vTO-oECLCoaGcM5_y5pRM9jDQ";
  var url4 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROIz7Yeo62izwb6vxRvGg7uv6ksEk0Y10hflEY-ubcCYkjSyKU_g";
  var url5 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpjlAdJum0BhVookqbPf3MuOpaNW80sQT0Edo0lTb8sJ9thXSPBQ";

  Widget _helper(ur) {
    return InkWell(
      child: Container(
        height: 100,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: new Border.all(color: Colors.white, width: 5.0,style: BorderStyle.solid),
            image: new DecorationImage(
                image: new NetworkImage(ur), fit: BoxFit.cover)),
      ),
      onTap: () {

      },
    );
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget _buttonWithLabel(var message1, var message2, var s) {
      return Container(
        margin: EdgeInsets.only(top: 5),
        height: s,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: width * 0.75,
              child: Text(
                message1,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: width * 0.25,
              child: FlatButton(
                color: Colors.blue,
                child: new Text(
                  message2,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                // color:  Colors.blueAccent[600],
                onPressed: () {

                },
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      children: <Widget>[
        Container(
          child: Material(

          ),
        ),


        Divider(
          height: 10,
        ),
        _buttonWithLabel(" Trending   Workshop  ", "More", 40.0),
        Container(
          child: Material(
            child: CarouselSlider(
                height: 150,
                viewportFraction: 0.6,
                aspectRatio: 16 / 9,
                distortion: false,
                items: [
                  _helper(url1),
                  _helper(url2),
                  _helper(url3),
                  _helper(url4),
                  _helper(url5),
                ]),
          ),
        ),
        //  _buttonWithLabel("   Explore More Videos  ", "More", 40.0),
        Divider(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
          margin: EdgeInsets.only(left: 5,top: 10,right: 5),

          child: Image.network(
            'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
          ),
        ),
        Divider(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 0),
          padding: EdgeInsets.only(top: 0),

          child: Row(
            children: <Widget>[
              Container(
                height: 180,
                width : 180,
              margin: EdgeInsets.only(left: 10,top: 0),
               // padding: EdgeInsets.only(left: 10,right: 150),
                //margin: EdgeInsets.only(left: 5,right: 150),
               child: Image.network(
                  'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                ),

              ),
              Divider(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 2,right: 10,top: 0),
                      //padding: const EdgeInsets.all(10.0),
                      padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
                      color: Colors.white,
                      child:Text(" EVENT NAME  ",
                          textAlign: TextAlign.left,

                          style: new TextStyle(

                              fontWeight: FontWeight.bold,

                              fontSize: 18.0

                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2,right: 10,top: 0),
                      //padding: const EdgeInsets.all(10.0),
                      padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
                      color: Colors.white,
                      child:Text(" DESCRIPTION  ",
                          textAlign: TextAlign.left,

                          style: new TextStyle(

                              //fontWeight: FontWeight.bold,

                              fontSize: 14.0

                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2,right: 10,top: 0),
                      //padding: const EdgeInsets.all(10.0),
                      padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
                      color: Colors.white,
                      child:Text(" DATE OF EVENT : ",
                          textAlign: TextAlign.left,

                          style: new TextStyle(

                             // fontWeight: FontWeight.bold,

                              fontSize: 14.0

                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2,right: 10,top: 0),
                      //padding: const EdgeInsets.all(10.0),
                      padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
                      color: Colors.white,
                      child:Text(" 32/13/0009 ",
                          textAlign: TextAlign.left,

                          style: new TextStyle(

                              //fontWeight: FontWeight.bold,

                              fontSize: 14.0

                          )),

                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2,right: 10,top: 0),
                      //padding: const EdgeInsets.all(10.0),
                      padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
                      color: Colors.white,
                      child:Text(" Registration Charge ",
                          textAlign: TextAlign.left,

                          style: new TextStyle(

                              //fontWeight: FontWeight.bold,

                              fontSize: 14.0

                          )),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
       // _buttonWithLabel("Workshps near you ", "More", 40.0),
      ],
    );
  }
}
