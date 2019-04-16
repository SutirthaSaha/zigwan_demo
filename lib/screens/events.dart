import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/add_competition_form.dart';
import 'package:zigwan_demo/screens/add_event_form.dart';
import 'package:zigwan_demo/screens/add_workshop_form.dart';
import 'package:zigwan_demo/screens/event_detail_page.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List data;
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
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: drawerLayout(context),
//      backgroundColor: Colors.grey[200],
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
            onPressed: () {
              debugPrint('Flter');
              _showModalBottomSheet(context);
            },
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
//                        Icon(Icons.image),
//                        SizedBox(width: 10.0,),
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
