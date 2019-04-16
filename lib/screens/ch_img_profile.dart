import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageChange extends StatefulWidget {
  @override
  _ProfileImageChangeState createState() => _ProfileImageChangeState();
}

class _ProfileImageChangeState extends State<ProfileImageChange> {
  File _image;
  Future getImage() async{
    _image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=_image;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
          Container(
            height: 7.0,
          ),
          _image==null?GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                width: screenSize.width*0.7,
                height: screenSize.height*0.3,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black87,
                    image: DecorationImage(image: AssetImage('images/background.png'))
                ),
//                child: Icon(Icons.add_a_photo,size: 30.0,color: Colors.grey,),
              ),
            ):GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                width: screenSize.width*0.7,
                height: screenSize.height*0.3,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black87,
                    image: DecorationImage(image: FileImage(_image),
                      fit: BoxFit.contain
                    )
                ),
              ),
            ),
          Container(
            height: 7.0,
            width: MediaQuery.of(context).size.width*.7,
          ),
          _image!=null?RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: (){
              Navigator.pop(context);
            },
            child: new Text("SAVE"),
          )
          :new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: (){

                    },
                    child: new Text("DELETE"),
                  ),
                  new RaisedButton(
                    onPressed: (){
                      getImage();
                    },
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("UPDATE"),
                  ),
                ],
              ),
        ],
      ),
      )
    );
  }
}
