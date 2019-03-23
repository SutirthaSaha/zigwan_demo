import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/mainpage.dart';
import 'package:zigwan_demo/screens/my_profile_page.dart';
import 'package:zigwan_demo/screens/profile_page.dart';
import 'package:zigwan_demo/utils/cameras.dart';
import 'package:zigwan_demo/utils/video_play.dart';

Future<void> main() async{
  GetCamera.cameras = await availableCameras();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
  ));
}