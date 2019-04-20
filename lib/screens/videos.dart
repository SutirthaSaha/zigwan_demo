import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:zigwan_demo/screens/add_video_form.dart';
import 'package:http/http.dart' as http;
import 'package:zigwan_demo/screens/video_play_page.dart';
import 'dart:convert';
import 'package:zigwan_demo/utils/apis.dart';

bool isSwitched=true;
var rating=0.0;
double _lowerValue = 150.0;
double _upperValue = 200.0;

class Videos extends StatefulWidget {
  @override
  VideosState createState() {
    return new VideosState();
  }
}

class VideosState extends State<Videos> {
  List data;
  var sample_video_data={
    "video_name" :"dance.avi",
    "video_tag":"promotional",
    "video_url":"https://github.com/flutter/assets-for-api-docs/blob/master/assets/videos/butterfly.mp4?raw=true",
    "video_total_views": 1000,
    "video_uploaded_at" :"23-02-2019T2:48:56Z",
    "video_cover_url":"https://via.placeholder.com/150",
    "video_caption":"This is why we rock",
    "video_description":"This video is intended to showcase the quality of dance training conducted at out organization",
    "video_uploaded_by":"gurukul"
  };

  final _scaffoldKey=new GlobalKey<ScaffoldState>();
  VoidCallback _showFiltersCallback;

  void _showFilter() {
    setState(() {
      _showFiltersCallback=null;
    });

    _scaffoldKey.currentState.showBottomSheet((context){
      return FilterWidgets();
    }).closed.whenComplete((){
      if(mounted){
        setState(() {
          _showFiltersCallback=_showFilter;
        });
      }
    });
  }

  vCard(int i){
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlay(videoData:sample_video_data,data:data),
            ));
      },
      child: Card(
        margin: EdgeInsets.all(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left:5.0,right: 5.0),
                  child:Row(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(data[i]['thumbnailUrl']),
                                  fit:BoxFit.cover),
                              borderRadius: BorderRadius.circular(35.0)
                          )
                      ),
                      SizedBox(width: 5.0,),
                      Expanded(child:Text("user name",style: TextStyle(fontWeight:FontWeight.bold),)),
                      Text("12 mins ago",style: TextStyle(fontWeight:FontWeight.bold),)
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.3,
                child: Center(
                  child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
                ),
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
                      Expanded(child:Text(data[i]["title"])),
                      Icon(Icons.visibility),
                      Text("100",style: TextStyle(fontWeight:FontWeight.bold),)
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  videosCard(){
    return Container(
      color: Colors.white,
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
                child: Center(
                  child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
                ),
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

  _showModalBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (builder){
      return Container(
        height: 200,
        color: Colors.greenAccent,
        child: Center(
          child: Text("Modal Sheet"),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showFiltersCallback=_showFilter;
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVideoForm()));
              },
              padding: EdgeInsets.only(right: 0),
            ),
//            IconButton(
//              icon: Icon(Icons.filter_list),
//              onPressed: _showFiltersCallback,
//            ),
          ],
        ),
        body: data==null?Container():
                ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
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
                              child: Text("Trending",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                            videosCard(),
                            SizedBox(height: 5,child: Container(
                              color: Colors.grey[200],
                            ),),
                          ],
                        );
                      }
                      else {
                        return vCard(index - 1);
                      }
                    })

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
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
                    Text("Filters",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20))
                  ],
                )
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: ListView(
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child:Column(
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
                  ),
                  Card(
                    child: Container(
                      padding:EdgeInsets.all(10),
                      child: Column(
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
                  ),
                  Card(
                    child: Container(
                      padding:EdgeInsets.all(10),
                      child: Column(
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
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child:Column(
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
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
                        elevation: 5.0,
                        child: Center(
                          child: Text("SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}
