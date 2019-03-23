import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/add_competition_form.dart';
import 'package:zigwan_demo/screens/add_workshop_form.dart';
import 'package:zigwan_demo/ui/competitionCard.dart';
import 'package:zigwan_demo/ui/drawer.dart';
import 'package:zigwan_demo/ui/notififcations.dart';
import 'package:zigwan_demo/ui/trendingCompetitions.dart';

class Competitions extends StatefulWidget {
  @override
  _CompetitionsState createState() => _CompetitionsState();
}

class _CompetitionsState extends State<Competitions> {
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
    return Scaffold(
      //drawer: drawerLayout(context),
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
            icon: Icon(Icons.add_circle),
            onPressed: () {
              debugPrint('Post');
              showCustomDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              debugPrint('Flter');
            },
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
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
              return Column(children: <Widget>[
                TrendingCompetitions(),
                Container(
                  padding: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                  child: Image.network(
                    'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                  ),
                ),
              ],);

            return items[index];
          },
        ),
      ),
    );
  }

  fetchFive(){
    for(int i=0;i<3;i++)
      items.add(CompetitionCard());
  }

  Future<bool> showCustomDialog(context){
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadCompetitionForm()),);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Icon(Icons.camera_alt),
                        //SizedBox(width: 10.0,),
                        Text("Add Competition")
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadWorkshopForm()),);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                        Icon(Icons.image),
//                        SizedBox(width: 10.0,),
                        Text("Add Workshop")
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
