import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:zigwan_demo/screens/add_competition_form.dart';
import 'package:zigwan_demo/screens/add_event_form.dart';
import 'package:zigwan_demo/screens/add_workshop_form.dart';
import 'package:zigwan_demo/screens/event_detail_page.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter_swiper/flutter_swiper.dart';

bool isSwitched=true;
var rating=0.0;
double _lowerValue = 150.0;
double _upperValue = 200.0;
List<DateTime> picked=[DateTime.now(),DateTime.now()];
var _categories=["Solo","Duet","Trio","Group"];
var _userCategorySelected;

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {

  List data;

//  final _scaffoldKey=new GlobalKey<ScaffoldState>();
//  VoidCallback _showFiltersCallback;
//  void _showFilter() {
//    setState(() {
//      _showFiltersCallback=null;
//    });
//
//    _scaffoldKey.currentState.showBottomSheet((context){
//      return FilterWidgets();
//    }).closed.whenComplete((){
//      if(mounted){
//        setState(() {
//          _showFiltersCallback=_showFilter;
//        });
//      }
//    });
//  }

  suggestionCard(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 5),
      height: MediaQuery.of(context).size.height*0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context,index){
          return Card(
              color: Colors.black87,
              child: Container(
                width: MediaQuery.of(context).size.width*0.65,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data[index]['thumbnailUrl']),
                        fit: BoxFit.cover
                    )
                ),
              ));
        },
      ),
    );
  }

  eventCard(int i){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailPage()));
      },
      child: Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data[i]['thumbnailUrl']),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left:5.0,right: 5.0),
                  child:Row(
                    children: <Widget>[
                      Expanded(child:Text(data[i]['title'])),
                      Icon(Icons.location_on),
                      Text("Location")
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showFilter(){
    showModalBottomSheet(context: context, builder: (builder){
      return FilterWidgets();
    });
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEventForm()));
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilter,
          ),
        ],
      ),
      body: data==null?Container():
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                if(index==0){
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,child: Container(
                          color: Colors.grey[200],
                        ),),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color:Colors.white,
                          padding: EdgeInsets.all(5),
                          child: Text("Suggestions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        suggestionCard(),
                        SizedBox(height: 5,child: Container(
                          color: Colors.grey[200],
                        ),),
                      ],
                    );
                }
                else {
                  return eventCard(index - 1);
                }
              }
          )
    );
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
  Future<String> getJsonData() async{
    var response=await http.get(
        Uri.encodeFull(photo_url),
        headers: {
          "Accept":"application/json"
        }
    );
    //    print(response.body);
    setState(() {
      var convertDataToJson=jsonDecode(response.body);
      data=convertDataToJson;
    });

    return "Success";
  }
}
class FilterWidgets extends StatefulWidget {
  @override
  _FilterWidgetsState createState() => _FilterWidgetsState();
}

class _FilterWidgetsState extends State<FilterWidgets> {

  List filters=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filters.add(Card(
        child:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.2,
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: Text("Workshop",
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value){
                      setState(() {
                        isSwitched=value;
                      });},
                  ),
                ]
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Competition",
                        textScaleFactor: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ),
                    Switch(
                      value: !isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched=!value;
                        });
                      },
                    )
                  ],
                ),
              ]),
        )
    ),);
    filters.add(Card(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.2,
          padding: EdgeInsets.all(10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Location",
                textScaleFactor: 1,
                style: TextStyle(fontWeight:FontWeight.bold),),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.location_on)
                ),
              ),
            ],
          )
      ),
    ));
    filters.add(Card(
      child: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*0.2,
        padding:EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Registration Fee ( ₹ "+ _lowerValue.round().toString()+" - ₹ "+_upperValue.round().toString()+" )",
              textScaleFactor: 1,
              style: TextStyle(fontWeight: FontWeight.bold),),
            RangeSlider(
              min: 100.0,
              max: 1000.0,
              lowerValue: _lowerValue,
              upperValue: _upperValue,
              divisions: 5,
              showValueIndicator: true,
              valueIndicatorMaxDecimals: 1,
              onChanged: (newLowerValue, newUpperValue) {
                setState(() {
                  _lowerValue = newLowerValue;
                  _upperValue = newUpperValue;
                });
              },
            )
          ],
        ),
      ),
    ));
    filters.add(Card(
        child: Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.2,
            padding:EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Enter your desired dance form:",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontWeight:FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                DropdownButton<String>(
                  items: _categories.map((String dropDownStringItem){
                    return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,style: TextStyle(
                            color:Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                        )));
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      _userCategorySelected=value;
                    });
                  },
                  value: _userCategorySelected,
                  hint: Text("SELECT"),
                )
              ],
            )
        )
    ));
    filters.add(Card(
      child: Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.2,
          padding: EdgeInsets.all(10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter your desired time range",
                textScaleFactor: 1,
                style: TextStyle(fontWeight:FontWeight.bold),),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.blue),
                      ),
                      child: Text(
                          formatDate(picked[0], [dd, '-', mm, '-', yyyy]),
                          style:TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:5,right:5),
                      child: Text("to",style:TextStyle(fontWeight:FontWeight.bold)),
                    ),
                    Container(
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color:Colors.blue),
                      ),
                      child: Text(
                          formatDate(picked[1], [dd, '-', mm, '-', yyyy]),
                          style:TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),
                    IconButton(
                        icon:Icon(Icons.date_range),
                        onPressed: () async {
                          picked = await DateRangePicker.showDatePicker(
                              context: context,
                              initialFirstDate: DateTime.now(),
                              initialLastDate: (DateTime.now()).add(Duration(days: 7)),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2020)
                          );
                          if (picked != null && picked.length == 2) {
                            print(picked);
                            setState(() {

                            });
                          }
                        }
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    ));
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      child: ListView(
          children:<Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.1,
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.all(10),
                      child: Icon(Icons.filter_list,color: Colors.white,),
                    ),
                    Expanded(
                      child: Text("Filters",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20)),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(left:20,right:20,top:5,bottom: 5),
                        height: 30.0,
                        decoration:BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color:Colors.white,width:0.5),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: new Center(child: new Text('Apply', style: TextStyle(fontSize:16,color: Colors.white),),),
                      ),
                    )
                  ],
                )
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: Swiper(
                loop:false,
                itemCount: filters.length,
                itemBuilder: (context,index){
                  return filters[index];
                },
              ),
            )
          ]
      ),
    );
  }
}
