import 'package:flutter/material.dart';
class AcademyCard extends StatelessWidget {
  var name1="Twerk Tonight Academy ";
  var name2="Twerk Tonight Academy ";
  var name3="Twerk Tonight Academy ";
  var name4="Twerk Tonight Academy ";
  var pic1="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4m6qMY0KOjsUlCpKFpxUFX6tC1WsQ2hXARYJSixm64XFlZyEm";
  var pic2="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR24wRBAjO9dAFi9-Qkm248voN_DiSrthbJQUb4rFb5nKxqHTkC";
  var pic3="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZqjZLuf74qjc78w_ppdsJCH3zlRGZyU3BSEZsB6ZjP1JrLBdQ";
  var pic4="https://i.ytimg.com/vi/t6PmB6tMBOc/hqdefault.jpg";

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Card(
              child: Container(
                width: width*0.47,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: width*0.45,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(pic1),fit: BoxFit.fill )),

                    ),
                    Container(
                      height: 20,
                      width: width*0.47,
                      color: Color.fromARGB(255, 210, 210, 210),
                      child: Center(
                        child: Text(name4, style:
                        TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: width*0.47,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: width*0.65,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(pic2),fit: BoxFit.fitHeight )),

                    ),
                    Container(
                      height: 20,
                      width: width*0.47,
                      color: Color.fromARGB(255, 210, 210, 210),
                      child: Center(
                        child: Text(name4, style:
                        TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),


        Column(
          children: <Widget>[
            Card(
              child: Container(
                width: width*0.47,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: width*0.65,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(pic3),fit: BoxFit.fitHeight )),

                    ),
                    Container(
                      height: 20,
                      width: width*0.47,
                      color: Color.fromARGB(255, 210, 210, 210),
                      child: Center(
                        child: Text(name4, style:
                        TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: width*0.47,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: width*0.45,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(pic4),fit: BoxFit.fill )),

                    ),
                    Container(
                      height: 20,
                      width: width*0.47,
                      color: Color.fromARGB(255, 210, 210, 210),
                      child: Center(
                        child: Text(name4, style:
                        TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
