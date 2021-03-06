import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadOfferForm extends StatefulWidget {
  @override
  _UploadOfferFormState createState() => _UploadOfferFormState();
}

class _UploadOfferFormState extends State<UploadOfferForm> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var tagController=TextEditingController();
  var startDateController=TextEditingController();
  var endDateController=TextEditingController();
  var descController=TextEditingController();

  String currency=NumberFormat().simpleCurrencySymbol('INR');
  File _workshopBanner;
  Future getImage() async{
    _workshopBanner=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _workshopBanner=_workshopBanner;
    });
  }

  DateTime startDate,endDate;

  Future<DateTime> _showDateTimePicker() async{
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Offer Form Page"),
      ),
      body: Container(
        margin: EdgeInsets.only(left:15.0,right:15.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[

              SizedBox(
                height: 10.0,
              ),

              _workshopBanner==null?GestureDetector(
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
                      image: DecorationImage(image: FileImage(_workshopBanner),
                          fit: BoxFit.contain
                      )
                  ),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              TextFormField(
                autofocus: true,
                controller: tagController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    labelText: "Tagline",
                    hintText: "Enter offer tagline here"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Offer Tag Field Empty";
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 10.0,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: TextFormField(
                    enabled: false,
                    controller: startDateController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        labelText: "Start Date",
                        hintText: "Start Date"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Date Field Empty";
                      }
                      return null;
                    },
                  ),),
                  IconButton(icon: Icon(Icons.date_range,size: 30.0,), onPressed:() async {
                    startDate= await _showDateTimePicker();
                    setState(() {

                    });
                  }),

                  SizedBox(width: 10.0,),

                  Expanded(child: TextFormField(
                    enabled: false,
                    controller: endDateController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        labelText: "End Date",
                        hintText: "End Date"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Date Field Empty";
                      }
                      return null;
                    },
                  ),),
                  IconButton(icon: Icon(Icons.date_range,size: 30.0,), onPressed:() async {
                    endDate= await _showDateTimePicker();
                    setState(() {

                    });
                  }),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: descController,
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    labelText: "Description",
                    hintText: "Enter details here\n"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Description Field Empty";
                  }
                  return null;
                },
              ),
              SizedBox(
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
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
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
