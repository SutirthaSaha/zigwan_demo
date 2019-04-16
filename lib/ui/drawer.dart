import 'package:flutter/material.dart';
import 'package:zigwan_demo/drawer_screens/About.dart';
import 'package:zigwan_demo/drawer_screens/Contact.dart';
import 'package:zigwan_demo/drawer_screens/Feedback.dart';
import 'package:zigwan_demo/drawer_screens/RateUs.dart';
import 'package:zigwan_demo/drawer_screens/connections.dart';
import 'package:zigwan_demo/drawer_screens/privacy.dart';
import 'package:zigwan_demo/drawer_screens/terms.dart';
import 'package:zigwan_demo/screens/ch_img_profile.dart';
import 'package:zigwan_demo/screens/events.dart';
import 'package:zigwan_demo/screens/login_page_minimal.dart';
import 'package:zigwan_demo/screens/mainpage.dart';
import 'package:zigwan_demo/screens/my_profile_page.dart';
import 'package:zigwan_demo/screens/profile_page.dart';
import 'package:zigwan_demo/screens/registrations.dart';

drawerLayout(context) {
  return  SafeArea(
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()),);
            },
            child:Container(
              height: MediaQuery.of(context).size.height*0.17,
              child: DrawerHeader(child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileImageChange()));
                          },
                          child: Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: ExactAssetImage('images/background.png'),
                                      fit:BoxFit.cover),
                                  borderRadius: BorderRadius.circular(22.0)
                              )
                          ),
                        )
                      ],),
                    Container(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text("Sutirtha",style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Icon(Icons.arrow_forward_ios,color:Colors.white,size: 10,)
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text("Sutirtha"
//                          ,style: TextStyle(
//                              fontSize: 15,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold
//                          ),),
//                        SizedBox(
//                          height: 5.0,
//                        ),
//                        Text("Profile"
//                          ,style: TextStyle(
//                            fontSize: 12,
//                            color: Colors.white,
//                          ),),
//                      GestureDetector(
//                        child: Text("Profile"
//                          ,style: TextStyle(
//                              color: Colors.white,
//                              decoration:TextDecoration.underline
//                          ),),
//                      ),
//                      ],
//                    )
                  ],
                ),
              ),
                  decoration: BoxDecoration(
                      color: Colors.green[500]

                  )),
            ),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title:Text("Connections"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Connections()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title:Text("Registrations"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Registrations()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:Text("Settings"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title:Text("Refer and Share"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
//          ListTile(
//            leading: Icon(Icons.person),
//            title:Text("My Profile"),
//            onTap: (){
//              Navigator.pop(context);
//              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()),);
//            },
//          ),
          Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          Padding(
            padding: EdgeInsets.only(left:16),
            child: Text("Others",style: TextStyle(color: Colors.grey),),
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text("Send Feedback"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedBack()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Rate Us!"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => RateUs()),);
            },
          ),
          ListTile(
            leading: ImageIcon(AssetImage("images/z_circle.png")),
            title: Text("About Us"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => About()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("FAQs"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Terms()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title:Text("Sign Out"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MinimalLoginPage()));
            },
          ),
//          ListTile(
//            leading: Icon(Icons.phone),
//            title: Text("Contact Us"),
//            onTap: (){
//              Navigator.pop(context);
//              Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()),);
//            },
//          ),
//          ListTile(
//            title: Text("Privacy Policy"),
//            onTap: (){
//              Navigator.pop(context);
//              Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy()),);
//            },
//          ),
          Divider(
            color: Colors.black45,
            indent: 16.0,
          ),
          Padding(
            padding: EdgeInsets.only(left:16,bottom:10),
            child: Text("Quick Links",style: TextStyle(color: Colors.grey),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: (){
                  
                },
                child: ImageIcon(AssetImage('images/facebook.png')),
              ),
              InkWell(
                onTap: (){

                },
                child: ImageIcon(AssetImage('images/instagram.png')),
              ),
              InkWell(
                onTap: (){

                },
                child: ImageIcon(AssetImage('images/twitter.png')),
              ),
              InkWell(
                onTap: (){

                },
                child: ImageIcon(AssetImage('images/whatsapp.png')),
              ),
            ],
          ),
          SizedBox(height: 5.0,),
//          Center(
//            child: Text("Version 0.0.1",style: TextStyle(fontSize: 10),),
//          ),
          SizedBox(height: 5.0,)
        ],
      ),
    ),
  );
}