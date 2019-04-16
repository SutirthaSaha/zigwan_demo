import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:date_format/date_format.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class FilterWidgetPages extends StatefulWidget {
  @override
  _FilterWidgetPagesState createState() => _FilterWidgetPagesState();
}

class _FilterWidgetPagesState extends State<FilterWidgetPages> {
  bool isSwitched=true;
  var rating=0.0;
  List<DateTime> picked=[DateTime.now(),DateTime.now()];
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  var _categories=["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar","Chandigarh","Dadra and Nagar Haveli","Daman and Diu,Lakshadweep","Delhi","Puducherry"];
  var _userCategorySelected;

  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Filter Widgets")
      ),
      body:ListView(
        children: <Widget>[
          Card(
              child:Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Expanded(
                          child: Text("Workshop",
                            textScaleFactor: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value){
                            setState(() {
                              isSwitched=value;
                            });},
                        ),
                      ]
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("Competition",
                              textScaleFactor: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                          ),
                          Switch(
                            value: !isSwitched,
                            onChanged: (value){
                              setState(() {
                                isSwitched=!value;
                              });
                            },
                          )
                        ],
                      ),
                    ]),
              )
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child:Column(
                children: <Widget>[
                  Text("Enter your desired location",
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight:FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.location_on)
                    ),
                  ),
                ],
              )
            ),
          ),
          Card(
            child: Container(
              padding:EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text("Registration Fee ( ₹ "+ _lowerValue.round().toString()+" - ₹ "+_upperValue.round().toString()+" )",
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    RangeSlider(
                      min: 0.0,
                      max: 100.0,
                      lowerValue: _lowerValue,
                      upperValue: _upperValue,
                      divisions: 5,
                      showValueIndicator: true,
                      valueIndicatorMaxDecimals: 1,
                      onChanged: (newLowerValue, newUpperValue) {
                        setState(() {
                          _lowerValue = newLowerValue;
                          _upperValue = newUpperValue;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[
                    Text("Enter your rating",
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
                    SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 30.0,
                      color: Colors.blue,
                      borderColor: Colors.blue,
                    )
                  ],
                )
            ),
          ),
          Card(
            child: Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[
                    Text("Enter your desired time range",
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight:FontWeight.bold),),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color:Colors.blue),
                            ),
                            child: Text(
                                formatDate(picked[0], [dd, '-', mm, '-', yyyy]),
                                style:TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:5,right:5),
                            child: Text("to",style:TextStyle(fontWeight:FontWeight.bold)),
                          ),
                          Container(
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color:Colors.blue),
                            ),
                            child: Text(
                                formatDate(picked[1], [dd, '-', mm, '-', yyyy]),
                                style:TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                          IconButton(
                              icon:Icon(Icons.date_range),
                              onPressed: () async {
                                picked = await DateRangePicker.showDatePicker(
                                    context: context,
                                    initialFirstDate: DateTime.now(),
                                    initialLastDate: (DateTime.now()).add(Duration(days: 7)),
                                    firstDate: DateTime(2015),
                                    lastDate: DateTime(2020)
                                );
                                if (picked != null && picked.length == 2) {
                                  print(picked);
                                }
                                setState(() {

                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          Card(
            child: Container(
              padding:EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text("Enter your desired state:",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontWeight:FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    items: _categories.map((String dropDownStringItem){
                      return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem,style: TextStyle(
                              color:Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          )));
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        _userCategorySelected=value;
                      });
                    },
                    value: _userCategorySelected,
                    hint: Text("SELECT"),
                  )
                ],
              )
            )
          ),
          Card(
            child: Container(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[
                    Text("Enter your desired location",
                      textScaleFactor: 1,
                      style: TextStyle(fontWeight:FontWeight.bold),),
                    SimpleAutoCompleteTextField(
                        key: key,
                        suggestions: _categories,
                        textChanged: (text){
                          currentText=text;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_on)
                        ),
                    )
                  ],
                )
            ),
          ),
        ],
      )
    );
  }
}