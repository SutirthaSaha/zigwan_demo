import 'package:flutter/material.dart';
import 'package:zigwan_demo/ui/academyCard.dart';
import 'package:zigwan_demo/ui/notififcations.dart';
import 'videos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Academy extends StatefulWidget {
  @override
  _AcademyState createState() => _AcademyState();
}

class _AcademyState extends State<Academy> {
  String message = "";
  List<Widget> items = new List();

  ScrollController _controller;
  _scrollListener(){
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
  }

  @override
  void initState() {
    fetchFive();
    _controller=ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text('ZigWan'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Search');
              },
              padding: EdgeInsets.only(right: 0),
            ),
            IconButton(
              icon: Icon(Icons.filter_b_and_w),
              onPressed: () {
                debugPrint('Filter');
              },
            ),
          ],
        ),
        body:
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification){
            fetchFive();
          },
          child: ListView.builder(
            shrinkWrap: true,
            controller: _controller,
            itemCount: items.length,
            addRepaintBoundaries: false,
            itemBuilder: (context, index) {
              if(index==0)
                return Container(
                  child: Column(children: <Widget>[
                    Divider(
                      height: 2   ,
                      color: Colors.transparent,
                    ),
               //     SearchBar(),
                  ],),
                );
              else
              return items[index];
            },
          ),
        ),
      ),
    );
  }
  /*fetch() async{
    final response= await http.get("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROIz7Yeo62izwb6vxRvGg7uv6ksEk0Y10hflEY-ubcCYkjSyKU_g");
    if(response.statusCode==200){
        setState(() {
          items.add(json.decode(response.body)["message"]);
        });

    }else{
      throw Exception("hgjh");
    }
  }
  */
  fetchFive(){
    for(int i=0;i<3;i++)
      items.add(AcademyCard());
  }
}
