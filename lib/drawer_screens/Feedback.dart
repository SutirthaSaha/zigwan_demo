import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection;
    titleSection = new Container(
      padding: const EdgeInsets.only(top: 55), //Top, Right, Bottom, Left

      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  //padding: const EdgeInsets.only(bottom: 10.0),

                  child: new Text("Send Feedback",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0)),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Tell us what you love "
                        "about the app, "
                        "or what we be  doing better.  ",
                    style:
                        new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 30),
                //Need to add space below this Text ?
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 100),
                      labelText: 'Enter feedback',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                SizedBox(height: 175),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "If you have something to say that "
                        "doest't fit here,please shoot us "
                        " an email at help@zigwan.in  ",
                    style:
                        new TextStyle(color: Colors.grey[850], fontSize: 17.0),
                  ),
                ),
                //SizedBox(height: 205),

                SizedBox(height: 30.0),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 17.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
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
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
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
        children: <Widget>[
          //build in a separated function
        ],
      ),
    );

    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),

      //How to show long text ?
    );

    //build function returns a "Widget"

    return new MaterialApp(
        title: "",
        home: new Scaffold(
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
