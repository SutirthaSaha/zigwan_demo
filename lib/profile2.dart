import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
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
      home: new Scaffold(
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            color: Colors.white,
            child: new Row(
// alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box,
                    color: Colors.black,

                  ),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,

                  ),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.black,

                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
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
                    trend1(),
                    //     SearchBar(),
                  ],),
                );

              return items[index];
            },
          ),
        ),
      ),
    );
  }
  /*
  fetch() async{
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
      items.add(Cardis());
  }
}

class Cardis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:  Container(
        height: 130,
        child: Row(
          children: <Widget>[
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5,left: 7,right: 7),
                    width: MediaQuery.of(context).size.width*0.47,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://filmschoolrejects.com/wp-content/uploads/2017/04/1Vw9-T9NkLmfGshWG8YG27w.jpeg"),fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      alignment: Alignment.bottomLeft,
                      child: Icon(Icons.play_circle_filled,color: Colors.white,size: 30,))
                ],
              ),
              onTap: (){},
            ),
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5,right: 7),
                    width: MediaQuery.of(context).size.width*0.47,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://filmschoolrejects.com/wp-content/uploads/2017/04/1Vw9-T9NkLmfGshWG8YG27w.jpeg"),fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      alignment: Alignment.bottomLeft,
                      child: Icon(Icons.play_circle_filled,color: Colors.white,size: 30,))
                ],
              ),
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}

class trend1 extends StatelessWidget {
  var pic="https://www.thewrap.com/wp-content/uploads/2017/07/Robert-Downey-Jr-Iron-Man-Pepper-Potts-Tony-Stark.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      color: Colors.white,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 130),
              color: Colors.blue,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  child: /*Container(
                    height: 30,
                    color: Colors.black12,
                    child: FlatButton(
                      onPressed: null,
                      child: Text("Connect", style: TextStyle(
                          color: Colors.black
                      ),),
                      color: Colors.white,
                    ),
                  ),
                ),*/
                  PopupMenuButton<String>(
                    onSelected: null,
                    itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      const PopupMenuItem<String>(
                          value: 'Toolbar menu',
                          child: Text('Disconnect')
                      ),

                      const PopupMenuItem<String>(
                          value: 'Hooray!',
                          child: Text('Block')
                      ),
                    ],
                  ),),
                Container(
                  margin: EdgeInsets.only(left: 120, right: 120, top: 0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(pic),
                  ),
                ),
                Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("Tony Stark",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(Icons.home,color: Colors.white,)),
                    Text("  lives in Kolkata", style:TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(Icons.tag_faces,color: Colors.white,)),
                    Text("  member at Abc academy", style:TextStyle(
                      color: Colors.white,
                    ),),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 40,
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter ,
                        width: MediaQuery.of(context).size.width*0.31,
                        margin: EdgeInsets.only(left: 5,right: 5),
                        color: Colors.white,
                        child: Center(
                          child: FlatButton(
                              color: Colors.white,
                              onPressed: null,
                              child: Center(child: Text("Posts"))
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width*0.31,
                        color: Colors.white,
                        child: Center(
                          child: FlatButton(
                              color: Colors.white,
                              onPressed: (){

                          },
                              child: Text("Connections")
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.31,
                          margin: EdgeInsets.only(left: 5,right: 5),
                       //   width: MediaQuery.of(context).size.width*0.30,
                          color: Colors.white,
                          child: Center(
                            child: FlatButton(
                                color: Colors.white,
                                onPressed: null,
                                child: Text("Interests")
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

