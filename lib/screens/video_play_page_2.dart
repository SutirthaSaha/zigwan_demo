import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  var videoData;
  List data;
  VideoPlay({Key key, @required this.videoData,this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _VideoPlayState(videoData,data);
  }
}

class _VideoPlayState extends State<VideoPlay> {
  TargetPlatform _platform;
  VideoPlayerController _controller;
  var videoData;
  List data;

  _VideoPlayState(this.videoData,this.data);

  @override
  void initState() {
    super.initState();
    print(data);
    _controller = new VideoPlayerController.network(videoData['video_url']);
  }

  @override
  Widget build(BuildContext context) {
    videoPlayer(){
      return Column(
        children: <Widget>[
          Container(
            child: new Chewie(
              _controller,
              aspectRatio: MediaQuery.of(context).size.height/MediaQuery.of(context).size.width,
              autoPlay: true,
              looping: true,
              placeholder: Container(
//                color: Colors.grey,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(videoData['video_cover_url']),
                        fit: BoxFit.cover)
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.thumb_up,color: Color.fromARGB(255, 120, 120, 120),),
                        Text(videoData['video_total_views'].toString(),style: TextStyle(
                            color: Color.fromARGB(255, 120, 120, 120),fontWeight: FontWeight.bold
                        ),),
                      ],
                    )
                ),
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.chat_bubble,color: Color.fromARGB(255, 120, 120, 120),),
                        Text(videoData['video_total_views'].toString(),style: TextStyle(
                            color: Color.fromARGB(255, 120, 120, 120),fontWeight: FontWeight.bold
                        ),),
                      ],
                    )
                ),
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.share,color: Color.fromARGB(255, 120, 120, 120),),
                        Text(videoData['video_total_views'].toString(),style: TextStyle(
                            color: Color.fromARGB(255, 120, 120, 120),fontWeight: FontWeight.bold
                        ),),
                      ],
                    )
                ),
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.remove_red_eye,color:Color.fromARGB(255, 120, 120, 120),),
                        Text(videoData['video_total_views'].toString(),style: TextStyle(
                            color: Color.fromARGB(255, 120, 120, 120),fontWeight: FontWeight.bold
                        ),),
                      ],
                    )
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 5,bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              videoData['video_caption'],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5,bottom: 10),
            child: Text('Description: '+videoData['video_description']),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  child: Text('Posted by: '+videoData['video_uploaded_by'], style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 25,
                padding: EdgeInsets.only(right: 20),
                child: RaisedButton(
                  child: Text('Subscribe'),
                  onPressed: (){},
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 5,bottom: 10,top: 5),

            alignment: Alignment.centerLeft,
            child: Text('Suggestions: ',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),),
          ),
        ],
      );
    }
    vCard(int i){
      return GestureDetector(
        onTap: (){
        },
        child: Card(
          margin: EdgeInsets.all(5.0),
          child: Container(
            padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height*0.2,
              child:Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
//                    child: Center(
//                      child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
//                    ),
//                    child:Align(
//                      alignment: Alignment.bottomRight,
//                      child: Text(),
//                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[i]['thumbnailUrl']),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Column(

                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        padding: EdgeInsets.only(left:5,top:5,bottom: 2),
                        child: Text(data[i]['title'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        padding: EdgeInsets.only(left:5,top:2,bottom: 2),
                        child: Text("username"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        padding: EdgeInsets.only(left:5,top:2,bottom: 2),
                        child: Text((data[i]['id']*100).toString()),
                      ),
                    ],
                  )
                ],
              )
//            child: Column(
//              mainAxisSize:MainAxisSize.min,
//              children: <Widget>[
//                Container(
//                    margin: EdgeInsets.all(5),
//                    padding: EdgeInsets.only(left:5.0,right: 5.0),
//                    child:Row(
//                      children: <Widget>[
//                        Container(
//                            width: 40.0,
//                            height: 40.0,
//                            decoration: BoxDecoration(
//                                image: DecorationImage(image: NetworkImage(data[i]['thumbnailUrl']),
//                                    fit:BoxFit.cover),
//                                borderRadius: BorderRadius.circular(35.0)
//                            )
//                        ),
//                        SizedBox(width: 5.0,),
//                        Expanded(child:Text("user name",style: TextStyle(fontWeight:FontWeight.bold),)),
//                        Text("12 mins ago",style: TextStyle(fontWeight:FontWeight.bold),)
//                      ],
//                    )
//                ),
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height*0.3,
//                  child: Center(
//                    child: Icon(Icons.play_circle_filled,size: 30,color: Colors.white,),
//                  ),
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: NetworkImage(data[i]['thumbnailUrl']),
//                          fit: BoxFit.cover
//                      )
//                  ),
//                ),
//                Container(
//                    margin: EdgeInsets.all(5),
//                    padding: EdgeInsets.only(left:5.0,right: 5.0),
//                    child:Row(
//                      children: <Widget>[
//                        Expanded(child:Text(data[i]["title"])),
//                        Icon(Icons.visibility),
//                        Text("100",style: TextStyle(fontWeight:FontWeight.bold),)
//                      ],
//                    )
//                ),
//
//              ],
//            ),
          ),
        ),
      );
    }

    return WillPopScope(child: Scaffold(
      body: ListView.builder(
          itemCount: 10+1,
          itemBuilder: (context,index){
            if(index==0){
              return videoPlayer();
            }
            else{
              return vCard(index-1);
            }
          }
      ),
    ),
        onWillPop: () async{
          print("Back Pressed");
          return true;
    });
  }
}