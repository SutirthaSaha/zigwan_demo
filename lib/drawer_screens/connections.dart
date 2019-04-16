import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/profile_page.dart';

class Connections extends StatefulWidget {
  @override
  _ConnectionsState createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pop(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Connections'),
          bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
            Tab(
                child: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "123",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Connections"),
                ],
              ),
            )),
            Tab(
              icon: Icon(Icons.star),
              text: "Recommendations",
            ),
            Tab(
              icon: Icon(Icons.people),
              text: "Requests",
            ),
          ]),
        ),
//      appBar: PreferredSize(
//          child: Container(
//            color: Colors.blue,
//            child: SafeArea(
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                        child:Container()),
//                    TabBar(
//                        labelColor: Colors.white,
//                        isScrollable: true,
//                        controller: _controller, tabs: [
//                      Tab(
//                          child:Container(
//                            padding: EdgeInsets.only(top:5.0),
//                            child:  Column(
//                              mainAxisSize: MainAxisSize.min,
//                              children: <Widget>[
//                                Text("123",style: TextStyle(fontWeight: FontWeight.bold),),
//                                SizedBox(height: 10.0,),
//                                Text("Connections"),
//                              ],
//                            ),
//                          )
//                      ),
//                      Tab(
//                        icon: Icon(Icons.star),
//                        text: "Recommendations",
//                      ),
//                      Tab(
//                        icon: Icon(Icons.people),
//                        text: "Requests",
//                      ),]),
//                  ],
//                )),
//          ),
//          preferredSize:MediaQuery.of(context).size*0.15),
        backgroundColor: Color.fromARGB(255, 210, 210, 210),
        body: TabBarView(controller: _controller, children: [
          getMyConnectionList(),
          getRecommendationsList(),
          getActiveRequestList(),
        ]),
      ),
    );
  }

  Widget ConnectionCard() {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
        },
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/background.png'),
        ),
        title: Text("Username",style: TextStyle(fontSize: 18),),
        trailing: IconButton(icon: ImageIcon(AssetImage('images/account_remove.png'),size:30), onPressed: (){

        }),
      ),
    );
  }

  Widget RecommendationCard() {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
        },
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('images/background.png'),
        ),
        title: Text("Username",style: TextStyle(fontSize: 18),),
        trailing: IconButton(icon: Icon(Icons.person_add,size:30), onPressed: (){

        }),
      ),
    );
  }

  Widget ActiveRequestCard() {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
        },
        child: Container(
          height: 50.0,
          padding: EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/background.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:10.0,right:10.0),
                height: 25.0,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Colors.blueAccent,
                  color: Colors.green,
                  elevation: 5.0,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:10.0,right:10.0),
                height: 25.0,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Colors.blueAccent,
                  color: Colors.red,
                  elevation: 5.0,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getMyConnectionList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ConnectionCard();
      },
      itemCount: 20,
    );
  }
  getRecommendationsList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return RecommendationCard();
      },
      itemCount: 20,
    );
  }
  getActiveRequestList() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(20, (index) {
        return ActiveRequestCard();
      }),
    );
  }
}
