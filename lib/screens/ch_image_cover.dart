import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CoverImageChange extends StatefulWidget {
  @override
  _CoverImageChangeState createState() => _CoverImageChangeState();
}

class _CoverImageChangeState extends State<CoverImageChange> {
  List images=[];
  File _image;
  final int imageLimit=5;

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    int flagUpdate=0;
    int updateIndex=-1;

    Future getImage() async{
      _image=await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=_image;
        showDialog(context: context,builder: (context){
          return Dialog(
            child:  Container(
              height: screenSize.height*0.5,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 7.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      getImage();
                    },
                    child: Container(
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
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      flagUpdate==0? images.add(_image):images[updateIndex]= _image;
                      flagUpdate=0;
                      updateIndex=-1;
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                    child: Text("SAVE"),
                  )
                ],
              ),
            )
          );
        });
      });
    }
    imageCard(int i){
      return Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 7.0,
            ),
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                width: screenSize.width*0.7,
                height: screenSize.height*0.3,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black87,
                    image: DecorationImage(image: FileImage(images[i]),
                        fit: BoxFit.contain
                    )
                ),
              ),
            ),
            Container(
              height: 7.0,
              width: MediaQuery.of(context).size.width*.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: (){
                    images.removeAt(i);
                    setState(() {

                    });
                  },
                  child: Text("DELETE"),
                ),
                RaisedButton(
                  onPressed: (){
                    flagUpdate=1;
                    updateIndex=i;
                    getImage();
                  },
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: Text("UPDATE"),
                ),
              ],
            )],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Cover"),
        actions: <Widget>[
          images.length<=imageLimit? IconButton(icon: Icon(Icons.add_circle), onPressed: (){
            getImage();
          }):null
        ],
      ),
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context,index){
            return imageCard(index);
          }
      )
    );
  }
}