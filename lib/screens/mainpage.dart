import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/academy.dart';
import 'package:zigwan_demo/screens/videos.dart';
import 'package:zigwan_demo/screens/competitions.dart';
import 'package:zigwan_demo/screens/offers.dart';
import 'package:zigwan_demo/screens/workshop.dart';
import 'package:zigwan_demo/ui/drawer.dart';
import 'package:zigwan_demo/ui/home.dart';
import 'package:zigwan_demo/ui/notififcations.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages=[Home(),Competitions(),Offers(),Academy(),Videos()];
  var _currIndex=0;
  Widget callPage(int index){
    return pages[index];
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Builder(builder: (context){
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 150, 150, 150),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currIndex,
                onTap: (value){
                  setState(() {
                    _currIndex=value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title:Text("Home")),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/events_icon.png'),size: 24,),
                      title:Text("Events")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.content_cut),
                      title:Text("Discount")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      title:Text("Academy")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.play_circle_filled),
                      title:Text("Videos")),
                ]),
            body: callPage(_currIndex),
          );
        })
    ) ;
  }
}