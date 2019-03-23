import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: ContactBody(),
    );
  }
}


class ContactBody extends StatefulWidget {
  @override
  _ContactBodyState createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  //GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(top: 5),
//                  child: GoogleMap(
//                    onMapCreated: (controller) {
//                      setState(() {
//                        googleMapController = controller;
//                      });
//                    },
//                    options: GoogleMapOptions(
//                      compassEnabled: true,
//                      cameraPosition: CameraPosition(
//                        target: LatLng(22.5726, 88.3639),
//                        zoom: 10.0,
//                      ),
//                    ),
//                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),

          //SizedBox(height: 5.0),

          Container(
            padding: EdgeInsets.only(top: 5),
            margin: EdgeInsets.only(
              top: 5,
            ),
            child: Image.network(
              'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 20, bottom: 10, right: 7),
            color: Colors.white,
            child: Text(" ABOUT US  ",
                textAlign: TextAlign.left,
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          ),
          //SizedBox(height: 5),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 10, right: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 20, bottom: 10, right: 7),
            //How to show long text ?

            child: new Text(
                '''I am Nguyen Duc Hoang, I live in Hanoi, Vietnam. I create this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, ios and android programming, Kotlin programming, new technologies' overviews. These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.

      ''',
                style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 7),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      //margin: EdgeInsets.only(left: 20,top: 30,right: 20),
                      child: Image.network(
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      // padding: EdgeInsets.only(left: 15,right: 15),

                      // margin: EdgeInsets.only(left: 0,right: 0,bottom: 10),
                        height: 40.0,
                        width: 350.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(7.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                'MORE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
