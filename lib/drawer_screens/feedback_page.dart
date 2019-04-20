import 'package:flutter/material.dart';
class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin:EdgeInsets.all(10),
                child: Text("Please enter your experience with the app",style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
              ),
              SizedBox(height:30),
              Container(
                margin:EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Comments',
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  autofocus: false,
                  maxLines: null,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height:30),
              RaisedButton(
                onPressed: (){

                },
                child: Container(
                    width:MediaQuery.of(context).size.width*0.8,
                    child: Center(
                      child: Text("Send Feedback",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    )
                ),
              )
            ],
          )
        )
    );
  }
}
