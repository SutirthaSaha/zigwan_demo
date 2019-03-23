import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/add_offer_form.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> with SingleTickerProviderStateMixin {
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
    return Scaffold(
//      appBar: AppBar(
//        title: Text('ZigWan'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {
//              debugPrint('Search');
//            },
//            padding: EdgeInsets.only(right: 0),
//          ),
//          IconButton(
//            icon: Icon(Icons.add_circle),
//            onPressed: () {
//              debugPrint('Post');
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => UploadOfferForm()));
//            },
//          ),
//        ],
//        bottom: TabBar(controller: _controller, tabs: [
//          Tab(
//            text: "Academies",
//          ),
//          Tab(
//            text: "Competitions",
//          ),
//          Tab(
//            text: "Workshop",
//          ),]),
//      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color:Colors.blue,
          child: SafeArea(child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              TabBar(
              controller: _controller, tabs: [
                Tab(
                  text: "Academies",
                ),
                Tab(
                  text: "Competitions",
                ),
                Tab(
                  text: "Workshop",
                ),
              ]),
            ],
          )),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 210, 210, 210),
      body: ListView.builder(itemBuilder: (context, index) {
        return NotificationCard();
      },
        itemCount: 20,
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  var text1 = " 35% off on Registration ";
  var text2 =
      "offer limited till 31st row row row a boat gently down the stream";
  var text3 = "31st Mar";
  var profilePic =
      "https://is3-ssl.mzstatic.com/image/thumb/Purple71/v4/c1/5e/18/c15e18ce-0fa2-fc86-3497-d9470443fe5e/mzl.jausqbsb.png/246x0w.jpg";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      clipBehavior: Clip.hardEdge,
      //  height: 20.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10.0, right: 7.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Color.fromARGB(255, 210, 210, 210),
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  onTap: () {},
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 25, left: 7),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text(
                              text1,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 7, top: 5),
                              child: Text(text2)),
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 0),
                            height: 5,
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(top: 20, bottom: 0),
                              child: Text(
                                text3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              )),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
