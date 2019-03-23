import 'package:flutter/material.dart';
import 'package:zigwan_demo/main.dart';
class CardDemo extends StatelessWidget {
  var views="100";
  var description="Tony stark T pose";
  var  pic="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcH0jOqtRozY3HociWCepvpv6x31chu5d_mchhvzE7_nuq2JUAqQ";
  var user="  user name";
  var date="12 mins ago";
  var profilePic="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCZE_kIOyZrIV6gjAAadn1mf2m1zqMxk32Adztw0IJDGMGW9Ye5Q";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      clipBehavior: Clip.hardEdge,
    //  height: 20.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.white,
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  onTap: () {

                  },
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      width: width*0.55,
                      child: Text(user,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Expanded(child: Container(
                  width: width*0.25,
                  child: Text(date,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 130, 130, 130),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 2.0,),
            child: Material(
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: new NetworkImage(pic), fit: BoxFit.fill)),
                          ),
                          Center(
                            child: Icon(Icons.play_circle_filled,size: 50, color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                },
              ),
            ),
          ),
          Container(
            height: 38,
            color: Colors.white,
            margin: EdgeInsets.only(top: 3.0,left: 10.0,right: 10.0,bottom: 3.0),
            child: Row(
              children: <Widget>[
                Expanded(
                //width: width*0.75,
                  child: Text(description,style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Icon(Icons.remove_red_eye,color: Color.fromARGB(255, 130, 130, 130),),
                Text(views,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 130, 130, 130),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
