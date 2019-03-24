import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/add_competition_form.dart';
import 'package:zigwan_demo/screens/add_event_form.dart';
import 'package:zigwan_demo/screens/add_workshop_form.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'package:http/http.dart' as http;

class Competitions extends StatefulWidget {
  @override
  _CompetitionsState createState() => _CompetitionsState();
}

class _CompetitionsState extends State<Competitions> {
  List data;
  suggestionCard(){
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
    return Card(
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
    );
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
            },
          ),
        ],
      ),
      body: data==null?Container():
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,index){
                if(index==0){
                  return Container(
                    margin: EdgeInsets.only(top:10.0),
                    color: Colors.white,
                    padding:EdgeInsets.all(5),
                    child: Text("Suggestions",style:TextStyle(fontWeight: FontWeight.bold)),
                  );
                }
                else if(index==1){
                  return suggestionCard();
                }
                else {
                  return eventCard(index - 2);
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
