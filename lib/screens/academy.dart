import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zigwan_demo/screens/academy_profile.dart';
import 'package:zigwan_demo/ui/academyCard.dart';
import 'package:zigwan_demo/ui/notififcations.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'videos.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_range_slider/flutter_range_slider.dart';

bool isSwitched=true;
var rating=0.0;
double _lowerValue = 150.0;
double _upperValue = 200.0;

class Academy extends StatefulWidget {
  @override
  _AcademyState createState() => _AcademyState();
}

class _AcademyState extends State<Academy> {
  List data;

//  final _scaffoldKey=new GlobalKey<ScaffoldState>();
//  VoidCallback _showFiltersCallback;

  academyCard(int i) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AcademyProfilePage()),);
        },
        child:Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Card(
                    clipBehavior: Clip.antiAlias,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(10.0),
//                  ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.network(
                        data[i]['thumbnailUrl'],
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left:5.0,right: 5.0),
                child:Center(
                  child: Text(
//                  data[i]['title'],
                    "Name of Academy",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
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
  void _showFilter(){
    showModalBottomSheet(context: context, builder: (builder){
      return FilterWidgets();
    });
  }
  @override
  void initState() {
    super.initState();
//    _showFiltersCallback=_showFilter;
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        key:_scaffoldKey,
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
              icon: Icon(Icons.filter_list),
              onPressed: _showFilter
            ),
          ],
        ),
        body:data==null?Container():
        GridView.count(
          crossAxisCount: 2,
          children: List.generate(20, (index) {
            return academyCard(index);
          }),
        )
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
  Widget build(BuildContext context) {
    filters.add(Card(
      child: Container(
          width: MediaQuery.of(context).size.width,
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

    filters.add(                  Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Admission Fee ( ₹ "+ _lowerValue.round().toString()+" - ₹ "+_upperValue.round().toString()+" )",
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
        width: MediaQuery.of(context).size.width,
        padding:EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Monthly Fee ( ₹ "+ _lowerValue.round().toString()+" - ₹ "+_upperValue.round().toString()+" )",
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
    filters.add(                  Card(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Rating",
                textScaleFactor: 1,
                style: TextStyle(fontWeight:FontWeight.bold),),
              SizedBox(
                height: 10,
              ),
              SmoothStarRating(
                allowHalfRating: true,
                onRatingChanged: (v) {
                  rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: rating,
                size: 30.0,
                color: Colors.blue,
                borderColor: Colors.blue,
              )
            ],
          )
      ),
    ));
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      child: Column(
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
              )
            )
          ]
      ),
    );
  }
}
