import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zigwan_demo/utils/video_play.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:path_provider/path_provider.dart';

class VideoUploadForm extends StatefulWidget {
  File _video;
  File _videoThumb;

  VideoUploadForm(this._video, this._videoThumb);

  @override
  _VideoUploadFormState createState() => _VideoUploadFormState(_video,_videoThumb);
}

class _VideoUploadFormState extends State<VideoUploadForm> {
  final scaffoldKey=GlobalKey<ScaffoldState>();
  final formKey=GlobalKey<FormState>();

  File _video;
  File _videoThumb;
  File _selectThumb;
  String tempPath ;
  bool _autoThumb=true;

  _VideoUploadFormState(this._video, this._videoThumb);

  var captionController=TextEditingController();
  var descController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPath();
  }

  Future getPath() async{
    Directory tempDir= await getTemporaryDirectory();
    tempPath =tempDir.path;
    print(tempPath);
  }

  Future getVideo() async{
    _video=await ImagePicker.pickVideo(source: ImageSource.gallery);
    thumbnail();
    setState(() {
      _video=_video;
    });
  }

  Future getVideoThumb() async{
    _selectThumb=await ImagePicker.pickImage(source: ImageSource.gallery);
    if(_selectThumb!=null){
      setState(() {
        _autoThumb=false;
        _videoThumb=_selectThumb;
      });
    }
  }

  Future thumbnail() async{
    String thumb = await Thumbnails.getThumbnail(
        thumbnailFolder:tempPath,
        videoFile: _video.path,
        imageType: ThumbFormat.PNG,
        quality: 30);
    _videoThumb=File(thumb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
//      appBar: AppBar(
//        title: Text("Video Description"),
//      ),
      body: Container(
        //padding: EdgeInsets.all(5.0),
        child: Form(child: ListView(
          key: formKey,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width*0.7,
              child:Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    //ImagePicker.pickImage(source: ImageSource.gallery);
                    getVideoThumb();
                  },
                  child: _autoThumb?Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black87,
                        image: DecorationImage(image: FileImage(_videoThumb),
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_photo_alternate,color: Colors.white,size: 30.0,),
                        SizedBox(height: 10.0,),
                        Text("Choose Your Cover(Optional)",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0
                        ),)
                      ],
                    ),
                  ):Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black87,
                        image: DecorationImage(image: FileImage(_videoThumb),
                            fit: BoxFit.contain)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(color:Colors.white)
                )
              ],
            )),
            Container(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 5,right:5),
              child: TextFormField(
                autofocus: true,
                controller:captionController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    labelText: "Caption",
                    hintText: "Add a caption to your video here"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Caption Field Empty";
                  }
                  return null;
                },
              ),
            ),
            Container(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 5,right:5),
              child: TextFormField(
              controller: descController,
              maxLines: null,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0))),
                  labelText: "Description",
                  hintText: "Add a descrption here"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Description Field Empty";
                }
                return null;
              },
            ),),
            Container(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 5,right:5),
              child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: (){
                print("Saved");
              },
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white,fontSize: 20.0),
              ),
              color: Colors.greenAccent,
              elevation: 2.0,
            ),),
            Container(
              height: 10.0,
            ),
          ],
        )),
      )
    );
  }
}
