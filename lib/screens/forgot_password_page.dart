import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top:20),
        children: <Widget>[
          Row(
            children: <Widget>[
              BackButton(color:Colors.black),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left:10,right:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Icon(Icons.lock,size: MediaQuery.of(context).size.height*0.3,),
                SizedBox(height: 30,),
                Text("Forgot your password?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height:10),
                Text("Enter your email below to recieve your password reset instructions",style:TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top:10),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text("Send Password",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                  decoration: BoxDecoration(
                      color:Colors.blue[800],
                      borderRadius: BorderRadius.circular(5)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
