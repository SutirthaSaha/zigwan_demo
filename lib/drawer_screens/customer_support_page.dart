import 'package:flutter/material.dart';

class CustomerSupportPage extends StatefulWidget {
  @override
  _CustomerSupportPageState createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Support Page"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin:EdgeInsets.all(10),
              child: Text("Facing an issue?",style:TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
            ),
            Container(
              margin:EdgeInsets.all(10),
              child: Text("Send us query, our support team will get back to you shortly.",style:TextStyle(fontSize:20)),
            ),
            Container(
              margin:EdgeInsets.all(10),
              child: Text("Enter your query here",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
            ),
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
            Container(
              margin:EdgeInsets.all(10),
              child: Text("Enter your mail ID for us to reach you",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
            ),
            Container(
              margin:EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
          ],
        )
      ),
    );
  }
}
