import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/mainpage.dart';
import 'package:zigwan_demo/screens/video_play_page.dart';
import 'package:zigwan_demo/screens/videos.dart';
import 'package:zigwan_demo/utils/cameras.dart';

Future<void> main() async{
  GetCamera.cameras = await availableCameras();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Videos()
  ));
}