import 'package:flutter/material.dart';
import 'package:zigwan_demo/main.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  fetchFive(){
    for(int i=0;i<10;i++)
      items.add(Notific());
  }
  ScrollController _controller;
  _scrollListener(){
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
      });
    }
  }
  List<Widget> items = new List();
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
      title: "ZigWan",
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 210, 210),
        appBar: AppBar(
          titleSpacing: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              }),
          title: Text("Notifications"),
        ),
        body:  NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification){
            fetchFive();
          },
          child: ListView.builder(
            shrinkWrap: true,
            controller: _controller,
            itemCount: items.length,
            addRepaintBoundaries: false,
            itemBuilder: (context, index) {
              if(items.length!=0)
                {
                  if(index==0){
                    return Divider(height: 6,);
                  }

                  return items[index];
                }
                else
                  {

                  }
            },
          ),
        ),
      ),
    );
  }
}

class Notific extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationCard();
  }
}

class NotificationCard extends StatelessWidget {
  var text1="Get Rs.250 cashback by spending Rs five on Debit Card";
  var text2="offer limited till 31st row row row a boat gently down the stream";
  var text3="31st Mar, 2019";
  var profilePic="https://cdn0.iconfinder.com/data/icons/construction-2/512/price.png";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      //  height: 20.0,
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 1),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10.0,right: 7.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  onTap: () {
                  },
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10,left: 8),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(text1,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                              ),
                            ),
                          ),

                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(bottom: 16),
                              child: Text(text3,style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Colors.black45,
                              ),)),
                        ],
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                ),
              Container(
                width: 30,
                child: Icon(Icons.arrow_forward_ios,size: 15, color: Color.fromARGB(255, 180, 180, 180),),
              )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class topButtons extends StatefulWidget {
  @override
  _topButtonsState createState() => _topButtonsState();
}

class _topButtonsState extends State<topButtons> {
   var workshopCount="0";
   var competitionCount="0";
   var academyCount="0";
   var color1=Colors.black12;
   var color2=Colors.white;
   var color3=Colors.white;
   var weight1= FontWeight.bold;
   var weight2=FontWeight.normal;
   var weight3=FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0, bottom: 5.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.only(left: 20, right: 10, top: 0,bottom: 0),
            color: color1,
            highlightColor: Colors.deepPurple,
            onPressed: (){
              setState(() {
                color1=Colors.black12;
                color2=Colors.white;
                color3=Colors.white;
                weight1=FontWeight.bold;
                weight2=FontWeight.normal;
                weight3=FontWeight.normal;
              });
            },
            child: Text("Workshop("+workshopCount+")",
              style: TextStyle(
                fontWeight: weight1,
              ),
            ),
          ),
          FlatButton(
            padding: EdgeInsets.only(left: 10, right: 10, top: 0,bottom: 0),
            color: color2,
            onPressed: (){
              setState(() {
                color1=Colors.white;
                color2=Colors.black12;
                color3=Colors.white;
                weight2=FontWeight.bold;
                weight1=FontWeight.normal;
                weight3=FontWeight.normal;
              });
            },
            child: Text("Competition("+competitionCount+")",
              style: TextStyle(
              fontWeight: weight2,
            ),
            ),
          ),
          FlatButton(
            color: color3,
            padding: EdgeInsets.only(left: 10, right: 5, top: 0,bottom: 0),
            onPressed: (){
              setState(() {
                color1=Colors.white;
                color2=Colors.white;
                color3=Colors.black12;
                weight3=FontWeight.bold;
                weight2=FontWeight.normal;
                weight1=FontWeight.normal;
              });
            },
            child: Text("Academies("+academyCount+")",
              style: TextStyle(
                fontWeight: weight3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
