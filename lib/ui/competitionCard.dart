import 'package:flutter/material.dart';
class CompetitionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 180,
            width : 180,
            margin: EdgeInsets.only(left: 10,top: 0),
            // padding: EdgeInsets.only(left: 10,right: 150),
            //margin: EdgeInsets.only(left: 5,right: 150),
            child: Image.network(
              'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
            ),

          ),
          Divider(
            height: 10,
          ), 
      Expanded(child:  Center(child:      Container(
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.only(top: 0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 2,right: 10,top: 0),
              //padding: const EdgeInsets.all(10.0),
              padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
              color: Colors.white,
              child:Text(" EVENT NAME  ",
                  textAlign: TextAlign.left,

                  style: new TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize: 18.0

                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 2,right: 10,top: 0),
              //padding: const EdgeInsets.all(10.0),
              padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
              color: Colors.white,
              child:Text(" DESCRIPTION  ",
                  textAlign: TextAlign.left,

                  style: new TextStyle(

                    //fontWeight: FontWeight.bold,

                      fontSize: 14.0

                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 2,right: 10,top: 0),
              //padding: const EdgeInsets.all(10.0),
              padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
              color: Colors.white,
              child:Text(" DATE OF EVENT : ",
                  textAlign: TextAlign.left,

                  style: new TextStyle(

                    // fontWeight: FontWeight.bold,

                      fontSize: 14.0

                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 2,right: 10,top: 0),
              //padding: const EdgeInsets.all(10.0),
              padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
              color: Colors.white,
              child:Text(" 32/13/0009 ",
                  textAlign: TextAlign.left,

                  style: new TextStyle(

                    //fontWeight: FontWeight.bold,

                      fontSize: 14.0

                  )),

            ),
            Container(
              margin: EdgeInsets.only(left: 2,right: 10,top: 0),
              //padding: const EdgeInsets.all(10.0),
              padding:  EdgeInsets.only(left:2,top: 0,bottom: 10,right: 7),
              color: Colors.white,
              child:Text(" Registration Charge ",
                  textAlign: TextAlign.left,

                  style: new TextStyle(

                    //fontWeight: FontWeight.bold,

                      fontSize: 14.0

                  )),
            ),
          ],
        ),),
      )),

        ],
      ),
    );
  }
}
