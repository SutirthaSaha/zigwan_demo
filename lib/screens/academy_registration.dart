import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AcademyRegistrationForm extends StatefulWidget {
  @override
  _AcademyRegistrationFormState createState() =>
      _AcademyRegistrationFormState();
}

class _AcademyRegistrationFormState extends State<AcademyRegistrationForm> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var nameController=TextEditingController();
  var contactController=TextEditingController();
  var emailController=TextEditingController();
  var locationController=TextEditingController();
  var descController=TextEditingController();

  File _image;
  Future getImage() async{
    _image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=_image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Academy Form Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 7.0,
                ),
                _image==null?GestureDetector(
                  onTap: (){
                    //ImagePicker.pickImage(source: ImageSource.gallery);
                    getImage();
                  },
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87
                    ),
                    child: Icon(Icons.add_a_photo,size: 30.0,color: Colors.grey,),
                  ),
                ):GestureDetector(
                  onTap: (){
                    getImage();
                  },
                  child: Container(
                    width: 50.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        //color: Colors.black87,
                        image: DecorationImage(image: FileImage(_image),
                          fit: BoxFit.contain
                        )
                    ),
                  ),
                ),
                Container(
                  height: 7.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.account_balance),
                  title: TextFormField(
                    autofocus: true,
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Name of Academy here"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Name Field Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.call),
                  title: TextFormField(
                    controller: contactController,
                    decoration: InputDecoration(
                        hintText: "Primary Number"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Contact Field Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:Icon(Icons.email),
                  title: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Email ID here"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email Field Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.add_location),
                  title:TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                        hintText: "Enter your Location here"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Location Field Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.description),
                  title:  TextFormField(
                    controller: descController,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Tell people about your academy"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Description Field Empty";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed: (){
                    submit();
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white,fontSize: 20.0),
                  ),
                  color: Colors.greenAccent,
                  elevation: 2.0,
                ),
                Container(
                  height: 10.0,
                ),
              ],
            )),
      )
    );
  }

  submit() {
    final form=formKey.currentState;
    print("Submit Clicked");
    if(form.validate()){
      form.save();
      final snackbar=SnackBar(content: Text("Successful"));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }
}
