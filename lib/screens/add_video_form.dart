import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:zigwan_demo/screens/video_upload_form.dart';
import 'dart:async';

import 'package:zigwan_demo/utils/cameras.dart';

class AddVideoForm extends StatefulWidget {
  @override
  _AddVideoFormState createState() => _AddVideoFormState();
}

class _AddVideoFormState extends State<AddVideoForm> {
  CameraController controller;
  bool proceed = false;
  File _video;
  File _videoThumb;
  String tempPath;

  Future getPath() async {
    Directory tempDir = await getTemporaryDirectory();
    tempPath = tempDir.path;
    print(tempPath);
  }

  Future getVideo(bool isCamera) async {
    if (isCamera) {
      print("ISCAMERA");
      _video = await ImagePicker.pickVideo(source: ImageSource.camera);
    } else {
      print("NOTCAMERA");
      _video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    }
    thumbnail();
    setState(() {
      _video = _video;
    });
  }

  Future thumbnail() async {
    String thumb = await Thumbnails.getThumbnail(
        thumbnailFolder: tempPath,
        videoFile: _video.path,
        imageType: ThumbFormat.PNG,
        quality: 30);
    _videoThumb = File(thumb);
  }

  @override
  void initState() {
    super.initState();
    getPath();
    controller =
        CameraController(GetCamera.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Add Video Form"),
//      ),
      body: _videoThumb == null ? chooseVideo(context) : proceedCheck(context),
    );
  }

  chooseVideo(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double deviceRatio=width/height;
    if (controller.value.isInitialized) {
      return Stack(
        children: <Widget>[
          Center(
            child: AspectRatio(
                //aspectRatio: controller.value.aspectRatio,
                aspectRatio: deviceRatio,
                child: CameraPreview(controller)),
          ),
          Positioned(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),
                      width: width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 7.0,
                                  bottom: 7.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Record Video",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 17.0),
                                    ),
                                  ),
                                  Icon(
                                    Icons.videocam,
                                    size: 25.0,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              getVideo(true);
                            },
                          ),
                          Divider(
                            height: 0.2,
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 7.0,
                                  bottom: 7.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Choose from Gallery",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 17.0),
                                    ),
                                  ),
                                  Icon(
                                    Icons.video_library,
                                    size: 25.0,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              getVideo(false);
                            },
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),
                      width: width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(7.0),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 17.0),
                              ),
                            ),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ],
                )),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  proceedCheck(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(_videoThumb),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Align(
              alignment: Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoUploadForm(_video,_videoThumb)));
                      },
                      color: Colors.blue,
                      child: Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          _videoThumb=null;
                          _video=null;
                          setState(() {

                          });
                        },
                        child: Text("Retake"),
                  ))
                ],
              )),
        )
      ],
    );
  }
}
