import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/add_video_form.dart';
import 'package:http/http.dart' as http;
import 'package:zigwan_demo/screens/video_play_page_2.dart';
import 'dart:convert';
import 'package:zigwan_demo/utils/apis.dart';

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

  @override
  void initState() {
    // TODO: implement initState
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVideoForm()));
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
        body: data==null?Container():
                ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context,index){
                      if(index==0){
                        return Container(
                          margin: EdgeInsets.only(top:10.0),
                          color: Colors.white,
                          padding:EdgeInsets.all(5),
                          child: Text("Trending",style:TextStyle(fontWeight: FontWeight.bold)),
                        );
                      }
                      else if(index==1){
                        return videosCard();
                      }
                      else {
                        return vCard(index - 2);
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