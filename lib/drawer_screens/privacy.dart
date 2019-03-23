import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10), //Top, Right, Bottom, Left

      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15.0),
                new Container(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Text("PRIVACY AND POLICES  ",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),

                //Need to add space below this Text ?
              ],
            ),
          ),
        ],
      ),
    );

    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;

      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            child: new Text(
              buttonTitle,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: tintColor),
            ),
          )
        ],
      );
    }

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[],
      ),
    );

    final bottomTextSection = new Container(
      //padding: const EdgeInsets.all(10.0),
      padding: EdgeInsets.only(left: 12, top: 5, bottom: 10, right: 7),
      //How to show long text ?

      child: new Text(
          '''I am Nguyen Duc Hoang, I live in Hanoi, Vietnam. I create this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, ios and android programming, Kotlin programming, new technologies' overviews. These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.

      ''',
          style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
    );

    //build function returns a "Widget"

    return new MaterialApp(
        title: "",
        home: new Scaffold(
            appBar: new AppBar(),
            body: new ListView(
              children: <Widget>[
                //You can add more widget bellow

                titleSection,

                fourButtonsSection,

                bottomTextSection
              ],
            ))); //Widget with "Material design"
  }
}
