import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/academy_my_profile.dart';
import 'package:zigwan_demo/screens/academy_profile.dart';
import 'package:zigwan_demo/screens/ch_image_cover.dart';
import 'package:zigwan_demo/screens/ch_img_profile.dart';
import 'package:zigwan_demo/screens/choreographer_profile_page.dart';
import 'package:zigwan_demo/screens/event_detail_page.dart';
import 'package:zigwan_demo/screens/forgot_password_page.dart';
import 'package:zigwan_demo/screens/mainpage.dart';
import 'package:zigwan_demo/screens/my_profile_page.dart';
import 'package:zigwan_demo/screens/profile_page.dart';
import 'package:zigwan_demo/screens/registrations.dart';
import 'package:zigwan_demo/ui/filter_widgets.dart';
import 'package:zigwan_demo/utils/cameras.dart';
import 'package:zigwan_demo/utils/video_play.dart';
import 'package:zigwan_demo/screens/mainpage.dart';

Future<void> main() async{
  GetCamera.cameras = await availableCameras();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AcademyProfilePage()
  ));
}