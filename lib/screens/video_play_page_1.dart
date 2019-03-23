//import 'dart:io';
//import 'package:chewie/chewie.dart';
//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
//
//class VideoPlayPage extends StatefulWidget {
//  @override
//  _VideoPlayPageState createState() => _VideoPlayPageState();
//}
//
//class _VideoPlayPageState extends State<VideoPlayPage> {
//  VideoPlayerController _controller;
//  bool _isPlaying = false;
//  String url='https://www.radiantmediaplayer.com/media/bbb-360p.mp4';
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = new VideoPlayerController.network(
//      url,
//    )
//      ..addListener(() {
//        final bool isPlaying = _controller.value.isPlaying;
//        if (isPlaying != _isPlaying) {
//          setState(() {
//            _isPlaying = isPlaying;
//          });
//        }
//      })
//      ..initialize();
//    //_controller.play();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("Zigwan"),
//        ),
//        body: Column(
//            children: <Widget>[
//              Chewie(
//                controller: ChewieController(
//                    videoPlayerController: _controller,
//                    aspectRatio: 1280/720,
//                    autoPlay: true,
//                    looping: true
//                ),
//              ),
//              Divider(
//                height: 0.5,
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              Expanded(child: ListView(
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Column(
//                        children: <Widget>[
//                          IconButton(icon: Icon(Icons.thumb_up), onPressed: (){
//                            print("Like");
//                          }),
//                          Text("40k")
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          IconButton(icon: Icon(Icons.chat_bubble), onPressed: (){
//                            print("Comments");
//                          }),
//                          Text("22")
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          IconButton(icon: Icon(Icons.screen_share), onPressed: (){
//                            print("Share");
//                          }),
//                          Text("12")
//                        ],
//                      ),
//                      Column(
//                        children: <Widget>[
//                          IconButton(icon: Icon(Icons.visibility), onPressed: (){
//                            print("View");
//                          }),
//                          Text("512")
//                        ],
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: 10.0,
//                  ),
//                  Container(
//                      margin: EdgeInsets.only(left:10.0,right: 10.0),
//                      child:  Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text("Sove Relevant Title",style: TextStyle(
//                              fontWeight: FontWeight.bold
//                          ),),
//                          SizedBox(
//                            height: 5.0,),
//                          Text("Android is a mobile operating system developed by Google. It is based on a modified version of the Linux kernel and other open source software, and is designed primarily for touchscreen mobile devices such as smartphones and tablets."),
//                        ],
//                      )
//                  ),
//                  SizedBox(
//                    height: 10.0,
//                  ),
//                  Text("Sove Relevant Title",style: TextStyle(
//                      fontWeight: FontWeight.bold
//                  ),),
//                ],
//              )),
//            ],
//        )
//    );
//  }
//}