import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_rating/flutter_rating.dart';

class AcademyMyProfilePage extends StatefulWidget {
  @override
  _AcademyMyProfilePageState createState() => _AcademyMyProfilePageState();
}

class _AcademyMyProfilePageState extends State<AcademyMyProfilePage> {
  List images=List(4);
  double rating = 3;
  int starCount = 5;
  String _daySelected = 'Sunday';
  var pic = "https://www.thewrap.com/wp-content/uploads/2017/07/Robert-Downey-Jr-Iron-Man-Pepper-Potts-Tony-Stark.jpg";
  var _days=['Sunday', 'Monday', 'Tuesday', 'Wednesday','Thursday','Friday','Saturday'];

  @override
  Widget build(BuildContext context) {
    images[0]=AssetImage("images/background.png");
    images[1]=AssetImage("images/background1.png");
    images[2]=AssetImage("images/background2.png");
    images[3]=AssetImage("images/background3.png");

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height * 0.5,
            child:new Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.37,
                        child: new Carousel(
                          images: images.sublist(0, 4),
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.transparent,
                        )
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          padding:EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top:10,bottom:2),
                                child: Text(
                                  "Name of Academy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: new StarRating(
                                  size: 15.0,
                                  rating: rating,
                                  color: Colors.orange,
                                  borderColor: Colors.grey,
                                  starCount: starCount,
//                                onRatingChanged: (rating) => setState(
//                                      () {
//                                    this.rating = rating;
//                                  },
//                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
//                alignment: Alignment.bottomLeft,
                  bottom: 0,
                  left:5,
                  child: Padding(
                    padding: EdgeInsets.only(left:10),
                    child: Container(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(pic),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: BackButton(color:Colors.white),
                )
              ],
            ),
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              child: ExpandableNotifier(
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      tapHeaderToExpand: true,
                      header: Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 10),
                          child: Text("Class Timings",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child:Container(
                                    padding: EdgeInsets.only(left:10,right:10),
                                    child: DropdownButton<String>(
                                      items: _days.map((String dropDownStringItem){
                                        return DropdownMenuItem(
                                            value: dropDownStringItem,
                                            child: Center(
                                              child: Text(dropDownStringItem,style: TextStyle(
                                                  color:Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat'
                                              )),
                                            ));
                                      }).toList(),
                                      onChanged: (value){
                                        setState(() {
                                          _daySelected=value;
                                        });
                                      },
                                      value: _daySelected,
                                      hint: Text("SELECT DAY"),
                                    ),
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width*0.2,
                                child:Text("10:00 A.M."),
                                decoration: BoxDecoration(
                                    border:Border.all(color: Colors.blue,width: 0.5)
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.compare_arrows),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width*0.2,
                                child:Text("10:00 P.M."),
                                decoration: BoxDecoration(
                                    border:Border.all(color: Colors.blue,width: 0.5)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){},
                                    textColor: Colors.black,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              child: ExpandableNotifier(
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      tapHeaderToExpand: true,
                      header: Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 10),
                          child: Text("Location",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Enter your locality'
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Enter your address'
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              child: ExpandableNotifier(
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      tapHeaderToExpand: true,
                      header: Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 10),
                          child: Text("Fee",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Admission Fee")
                              ),
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: ''
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Monthly Fee")
                              ),
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: ''
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              child: ExpandableNotifier(
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      tapHeaderToExpand: true,
                      header: Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 10),
                          child: Text("Choreographer",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Enter the name'
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){},
                                    textColor: Colors.black,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
          Card(
              clipBehavior: Clip.antiAlias,
              child: ExpandableNotifier(
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      tapHeaderToExpand: true,
                      header: Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 10),
                          child: Text("Dance Forms",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Field1'
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){},
                                    textColor: Colors.black,
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}