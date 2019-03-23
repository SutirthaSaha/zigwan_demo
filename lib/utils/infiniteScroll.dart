import 'package:flutter/material.dart';
import 'package:zigwan_demo/main.dart';

class Cardc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txt="Pepper potts dance club";
    var views="1000";
    var ur="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZGB-1uhB6VboRZ8KnK1GvR3gFz0JlPpCojtT-1FEKTyj8tT71vQ";
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(0.0),
      height: 249,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Column(
              children:<Widget>[ Container(
                height: 180,
                //margin: EdgeInsets.only(left: 5.0,right: 5.0),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(ur), fit: BoxFit.cover)),
              ),
               Container(
                    color: Colors.black26,
                    margin: EdgeInsets.only(top: 5.0),
                   alignment: Alignment.center,
                   height: 30.0,
                   child: Text(txt, style: TextStyle(fontSize: 15.0),)),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("  "),
                    Icon(Icons.remove_red_eye,size: 14,),
                    Text(views+" views   ",style: TextStyle(fontSize: 12),),
                    Icon(Icons.thumb_up,size: 14,),
                    Text(views+" likes   ",style: TextStyle(fontSize: 12),),
                    Icon(Icons.share,size: 14,),
                    Text(views+" shares   ",style: TextStyle(fontSize: 12),),
                    Icon(Icons.chat_bubble,size: 14,),
                    Text(" comments",style: TextStyle(fontSize: 12),),
                  ],
                ),
              ),
              ]
            ),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
