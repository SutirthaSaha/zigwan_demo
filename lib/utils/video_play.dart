//import 'dart:io';
//import 'package:chewie/chewie.dart';
//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
//
//class ChewiePlayerWidget extends StatefulWidget {
//  @override
//  _ChewiePlayerWidgetState createState() => _ChewiePlayerWidgetState();
//}
//
//class _ChewiePlayerWidgetState extends State<ChewiePlayerWidget> {
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
//        backgroundColor: Colors.black,
//        body: Center(
//            child:Chewie(
//              controller: ChewieController(
//                  videoPlayerController: _controller,
//                  aspectRatio: 1280/720,
//                  autoPlay: true,
//                  looping: true
//              ),
//            )
//        )
//    );
//  }
//}