import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/mainpage.dart';
import 'package:zigwan_demo/screens/minimal_signup.dart';

class MinimalLoginPage extends StatefulWidget {
  @override
  _MinimalLoginPageState createState() => _MinimalLoginPageState();
}

class _MinimalLoginPageState extends State<MinimalLoginPage> {
  bool _obscureText=true;

  togglePassword(){
    setState(() {
      _obscureText=!_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff282d3c),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height*0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/app_logo.png'),
                      fit: BoxFit.fitHeight
                  ),
                ),
                ),
              Container(
                padding:EdgeInsets.only(top:10.0,right: 20.0,left:20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left:10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            //suffixIcon: IconButton(icon: Icon(Icons.email),),
                            hintText: "EMAIL",
                            hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            )
                        ),
                      ),
                    ),
//                    TextField(
//                      decoration: InputDecoration(
//                          hintText: "EMAIL",
//                          hintStyle: TextStyle(
//                              fontFamily: 'Montserrat',
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white
//                          ),
//                          focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white)
//                          )
//                      ),
//                    ),
                    Container(padding: EdgeInsets.only(top: 10.0),),
                    Container(
                      padding: EdgeInsets.only(left:10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.0, top: 15.0, bottom: 6.0, right: 0.0),
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.zero,
                              child: GestureDetector(
                                onTap: (){
                                  togglePassword();
                                },
                                child: Icon(_obscureText? Icons.visibility:Icons.visibility_off,
                                  size: 24.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            hintText: "PASSWORD",
                            hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                            )
                        ),
                      ),
                    ),
//                    TextField(
//                      decoration: InputDecoration(
//                          hintText: "PASSWORD",
//                          hintStyle: TextStyle(
//                              fontFamily: 'Montserrat',
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white
//                          ),
//                          focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white)
//                          )
//                      ),
//                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      alignment: Alignment(1.0,0.0),
                      child: InkWell(
                        child: Text('Forgot Password',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color:Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),),
                        onTap: (){
                          print('Forgot Password Clicked');
                        },
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        print("Login");
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                      },
                      child:Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 5.0,
                          child: Container(
                            child: Center(
                              child: Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Not an existing user ",                              style: TextStyle(
                            color:Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                        )),
                        InkWell(
                            child: Text('SIGN UP',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color:Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),),
                            onTap: (){
                              print('Sign Up Clicked');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MinimalSignUpPage()),);
                            },
                          ),
                        Text(" here",
                            style: TextStyle(
                            color:Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                        )),
                      ],
                    ),
                    SizedBox(height: 30.0,),
//                    Container(
//                      height: 40.0,
//                      width: width*0.75,
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Colors.deepPurpleAccent,
//                        color: Colors.deepPurple,
//                        elevation: 5.0,
//                        child: GestureDetector(
//                          onTap: (){
//                            print("Login With OTP Clicked");
//                          },
//                          child: Center(
//                            child: Text("Login Using OTP",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontFamily: 'Montserrat',
//                                  fontWeight: FontWeight.bold
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10.0),
                          height: 40.0,
                          width: width*0.4,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            shadowColor: Color.fromARGB(255, 139, 157, 195),
                            color: Color.fromARGB(255,59,89,152),
                            elevation: 5.0,
                            child: GestureDetector(
                              onTap: (){
                                print("Login with Facebook Clicked");
                              },
                              child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ImageIcon(AssetImage("images/facebook.png"),color: Colors.white,),
                                Text("Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                              )
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: width*0.4,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            shadowColor: Color.fromARGB(255, 210, 210, 210),
                            color: Color.fromARGB(255,211,72,54),
                            elevation: 5.0,
                            child: GestureDetector(
                              onTap: (){
                                print("Login with Google Clicked");
                              },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ImageIcon(AssetImage("images/google.png"),color: Colors.white,),
                                    Text("Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
