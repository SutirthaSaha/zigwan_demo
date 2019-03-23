import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IndividualRegistrationForm extends StatefulWidget {
  @override
  _IndividualRegistrationFormState createState() =>
      _IndividualRegistrationFormState();
}

class _IndividualRegistrationFormState extends State<IndividualRegistrationForm> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var nameController=TextEditingController();
  var contactController=TextEditingController();
  var emailController=TextEditingController();
  var dateController=TextEditingController();
  var aboutController=TextEditingController();

  File _image;
  Future getImage() async{
    _image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=_image;
    });
  }

  DateTime selected;

  _showDateTimePicker() async{
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Individual Form Page"),
        ),
        body: Container(
          padding: EdgeInsets.only(left:15.0,right: 15.0),
          child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 10.0,
                  ),
                  _image==null?GestureDetector(
                    onTap: (){
                      //ImagePicker.pickImage(source: ImageSource.gallery);
                      getImage();
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black87
                      ),
                      child: Icon(Icons.person_add,size: 40.0,color: Colors.grey,),
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
                    height: 10.0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      autofocus: true,
                      //keyboardType: ,
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Enter your Name"),
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
                    leading: Icon(Icons.cake),
                    trailing: IconButton(icon: Icon(Icons.date_range,size: 30.0,), onPressed: _showDateTimePicker),
                    title: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText: "Enter your Date of Birth here"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "DOB Field Empty";
                        }
                        return null;
                      },
                    ),
                  ),
//                  Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    //mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Expanded(child: TextFormField(
//                        enabled: false,
//                        controller: dateController,
//                        decoration: InputDecoration(
//                            contentPadding: EdgeInsets.all(12.0),
//                            border: OutlineInputBorder(
//                                borderRadius:
//                                BorderRadius.all(Radius.circular(10.0))),
//                            labelText: "Date",
//                            hintText: "Enter your Date of Bitrhere"),
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return "Date Field Empty";
//                          }
//                          return null;
//                        },
//                      ),),
//                      IconButton(icon: Icon(Icons.date_range,size: 30.0,), onPressed: _showDateTimePicker)
//                    ],
//                  ),
                  Container(
                    height: 10.0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.description),
                    title:  TextFormField(
                      controller: aboutController,
                      maxLines: null,
                      decoration: InputDecoration(
                          hintText: "Tell people about yourself"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "About Field Empty";
                        }
                        return null;
                      },
                    ),
                  ),
//                  TextFormField(
//                    controller: aboutController,
//                    maxLines: null,
//                    decoration: InputDecoration(
//                        contentPadding: EdgeInsets.all(12.0),
//                        border: OutlineInputBorder(
//                            borderRadius:
//                            BorderRadius.all(Radius.circular(10.0))),
//                        labelText: "About",
//                        hintText: "Tell people about your yourself"),
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return "About Field Empty";
//                      }
//                      return null;
//                    },
//                  ),
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
