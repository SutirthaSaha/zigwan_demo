import 'package:flutter/material.dart';
import 'package:zigwan_demo/ui/academyCard.dart';
import 'package:zigwan_demo/ui/notififcations.dart';
import 'package:zigwan_demo/utils/apis.dart';
import 'videos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Academy extends StatefulWidget {
  @override
  _AcademyState createState() => _AcademyState();
}

class _AcademyState extends State<Academy> {
  List data;
  academyCard(int i) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Container(
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
              onPressed: () {
                debugPrint('Filter');
              },
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
