import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var pic = "https://www.thewrap.com/wp-content/uploads/2017/07/Robert-Downey-Jr-Iron-Man-Pepper-Potts-Tony-Stark.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          //title: Text("My Profile"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: null,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                        value: 'Toolbar menu', child: Text('Disconnect')),
                    const PopupMenuItem<String>(
                        value: 'Toolbar menu', child: Text('Connect')),
                  ],
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.blue,
                ),
                Positioned(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width - 20,
                    left: 10.0,
                    bottom: 5.0,
                    child: Card(
                        child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        Center(
                          child: Text(
                            "Batman",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                )),
                            Text(
                              "Kolkata",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                )),
                            Text(
                              "mailid@gmail.com",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                )),
                            Text(
                              "9999999999",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ))),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(pic),
                    ),
                  ),
                )
              ],
            ),
            TabBar(labelColor: Colors.blue, controller: _controller, tabs: [
              Tab(
                text: "Posts",
              ),
              Tab(
                text: "Interests",
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: TabBarView(
                controller: _controller,
                  children: [
                    getList("posts"),
                    getList("intersets"),
                  ]
              )
            )
          ],
        ));
  }

  getList(String s) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if(s=="posts"){
            return PostsCard();
          }else{
            return InterestCard();
          }
        },
        itemCount: 20,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}

class PostsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.all(5.0),
      color: Colors.blue,
      child: Container(
        height: height*0.3,
        child: Stack(
          children: <Widget>[
            Container(
              decoration:BoxDecoration(
                image:DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/background.png')),
              )
            ),
            Center(
              child: Icon(Icons.play_circle_filled,color: Colors.white,size: 30.0,),
            )
          ],
        ),
      )
    );
  }
}
class InterestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Card(
        margin: EdgeInsets.all(5.0),
        color: Colors.blue,
        child: Container(
          height: height*0.3,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration:BoxDecoration(
                    image:DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/background3.png')),
                  )
              ),
              Center(
                child: Text("Event Details",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
              )
            ],
          ),
        )
    );
  }
}
