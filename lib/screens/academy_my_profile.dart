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
  List timings=[];
  List locations=[];
  List choreographers=[];
  List danceForms=[];
  var admissionFee=0;
  var monthlyFee=0;
  var timingWidgets=List<Widget>();
  var locationWidgets=List<Widget>();
  var choreographerWidgets=List<Widget>();
  var danceFormsWidgets=List<Widget>();

  timingsContainer(i){
    return Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Text(timings[i][0]),
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: Text(timings[i][1]),
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: Icon(Icons.compare_arrows),
            ),
            Container(
              margin: EdgeInsets.all(1),
              child: Text(timings[i][2]),
            )
          ],
        )
    );
  }

  locationsContainer(i){
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(locations[i][0]),
            SizedBox(height:2),
            Text(locations[i][1]),
            SizedBox(height:5),
            Divider(height: 0.5,)
          ],
        )
    );
  }

  choreographerContainer(i){
    return Container(
        margin:EdgeInsets.all(3),
        child:Row(
          children: <Widget>[
            Expanded(child: Text(choreographers[i]))
          ],
        )
    );
  }

  danceFormsContainer(i){
    return Container(
        margin:EdgeInsets.all(3),
        child:Row(
          children: <Widget>[
            Expanded(child: Text(danceForms[i]))
          ],
        )
    );
  }

  initState(){
    super.initState();
    for(int i=0;i<3;i++){
      List time=[];
      time.add(_days[7-i-1]);
      time.add("3pm");
      time.add("6pm");
      timings.add(time);
    }
    for(int i=0;i<3;i++){
      timingWidgets.add(timingsContainer(i));
    }
    for(int i=0;i<2;i++){
      List location=[];
      location.add("Locality");
      location.add("123, Locality, City, Pin code");
      locations.add(location);
    }
    for(int i=0;i<2;i++){
      locationWidgets.add(locationsContainer(i));
    }
    for(int i=1;i<=3;i++){
      choreographers.add("Choreographer $i");
    }
    for(int i=0;i<3;i++){
      choreographerWidgets.add(choreographerContainer(i));
    }
    for(int i=1;i<=4;i++){
      danceForms.add("Dance Form $i");
    }
    for(int i=0;i<3;i++){
      danceFormsWidgets.add(danceFormsContainer(i));
    }
    admissionFee=1000;
    monthlyFee=500;
  }

  @override
  Widget build(BuildContext context) {
    images[0]=AssetImage("images/background.png");
    images[1]=AssetImage("images/background1.png");
    images[2]=AssetImage("images/background2.png");
    images[3]=AssetImage("images/background3.png");

    addTiming(){
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text("Day",style: TextStyle(fontWeight:FontWeight.bold),),
                ),
                Container(
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
                    hint: Text("Select Day"),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width*0.2,
                    child:TextField(
                      decoration: InputDecoration(
                        hintText: "Starting Time"
                      ),
                    ),
                    decoration: BoxDecoration(
                        border:Border.all(color: Colors.blue,width: 0.5)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.compare_arrows),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width*0.2,
                    child:TextField(
                      decoration: InputDecoration(
                          hintText: "Ending Time"
                      ),
                    ),
                    decoration: BoxDecoration(
                        border:Border.all(color: Colors.blue,width: 0.5)
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: new FlatButton(
                      child: Text("Add", style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      textColor: Colors.black,
                    )
                ),
              ],
            ),
          ],
        )
      );
    }

    addLocation(){
      return Container(
        padding:EdgeInsets.all(5),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            Row(
              children: <Widget>[
                Expanded(
                    child: new FlatButton(
                      child: Text("Confirm", style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      textColor: Colors.black,
                    )
                ),
              ],
            ),
          ],
        )
      );
    }

    editFee(){
      return Container(
        padding:EdgeInsets.all(5),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
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
              mainAxisAlignment:MainAxisAlignment.center,
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
            Row(
              children: <Widget>[
                Expanded(
                    child: new FlatButton(
                      child: Text("Confirm", style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      textColor: Colors.black,
                    )
                ),
              ],
            ),
          ],
        )
      );
    }

    addChoreographer(){
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
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
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: new FlatButton(
                      child: Text("Add", style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      textColor: Colors.black,
                    )
                ),
              ],
            ),
          ],
        ),
      );
    }

    addDanceForm(){
      return Container(
        padding:EdgeInsets.all(5),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Dance Form'
                      ),
                    )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: new FlatButton(
                      child: Text("Add", style: TextStyle(fontSize: 20),),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      textColor: Colors.black,
                    )
                ),
              ],
            ),
          ],
        )
      );
    }
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
                        children: <Widget>[
                          Column(
                            children: timingWidgets,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){
                                      showDialog(context: context,builder: (context){
                                        return Dialog(
                                          child: addTiming(),
                                        );
                                      });
                                    },
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
                        children: <Widget>[
                          Column(
                            children: locationWidgets,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){
                                      showDialog(context: context,builder: (context){
                                        return Dialog(
                                          child: addLocation(),
                                        );
                                      });
                                    },
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
                                  child: Text("₹ $admissionFee")
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Monthly Fee")
                              ),
                              Expanded(
                                  child: Text("₹ $monthlyFee")
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){
                                      showDialog(context: context,builder: (context){
                                        return Dialog(
                                          child: editFee(),
                                        );
                                      });
                                    },
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
                          child: Text("Choreographer",
                            style: Theme.of(context).textTheme.body2,
                          )
                      ),
                      expanded: Column(
                        children: <Widget>[
                          Column(
                            children:choreographerWidgets,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: new FlatButton(
                                    child: Text("Add New", style: TextStyle(fontSize: 20),),
                                    onPressed: (){
                                      showDialog(context: context,builder: (context){
                                        return Dialog(
                                          child: addChoreographer(),
                                        );
                                      });
                                    },
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
                          children: <Widget>[
                            Column(
                              children: danceFormsWidgets,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: new FlatButton(
                                      child: Text("Add New", style: TextStyle(fontSize: 20),),
                                      onPressed: (){
                                        showDialog(context: context,builder: (context){
                                          return Dialog(
                                            child: addDanceForm(),
                                          );
                                        });
                                      },
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