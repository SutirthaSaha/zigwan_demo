import 'package:flutter/material.dart';
import 'package:zigwan_demo/utils/searchAlgorithm.dart';
class SearchBar extends StatelessWidget {
  var _radioValue1=1;

  @override
  Widget build(BuildContext context) {
    void _modalBottomSheet(){
      showModalBottomSheet(
          context: context,
          builder: (builder){
            return new Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    width:MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.black12,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Filters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("Categories"),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Radio(
                              value: 0,
                              groupValue: _radioValue1,
                            //  onChanged: _handleRadioValueChange1,
                            ),
                            new Text(
                              'Carnivore',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _radioValue1,
                            //  onChanged: _handleRadioValueChange1,
                            ),
                            new Text(
                              'Herbivore',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            new Radio(
                              value: 2,
                              groupValue: _radioValue1,
                             // onChanged: _handleRadioValueChange1,
                            ),
                            new Text(
                              'Omnivore',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      );
    }
    return  Container(
      margin: EdgeInsets.only(top: 3, bottom: 3,right: 5,left: 5),
      height: 41.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 6,bottom: 6,left: 7,right: 5),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width-70),
                height: 35.0,
                child:  DecoratedBox(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 110, 110, 110),
                          size: 20,),
                        padding: EdgeInsets.only(left: 7),),
                      Text("  Search for videos... ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 110, 110, 110)), ),

                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchList()),
              );
            },
          ),
          InkWell(
            child: Container(
            //  margin: EdgeInsets.all(10.0),
              child: SizedBox(
                width: 42.0,
                height: 30.0,
                child:  DecoratedBox(
                    child: Icon(Icons.archive,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                       color: Color.fromARGB(255, 220, 220, 220),
                    )
                ),
              ),
            ),
            onTap: () {
                _modalBottomSheet();
            },
          ),
        ],

      ),
    );
  }
}