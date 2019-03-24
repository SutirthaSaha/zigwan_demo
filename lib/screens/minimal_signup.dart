import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/academy_registration.dart';
import 'package:zigwan_demo/screens/individual_registration.dart';
import 'package:zigwan_demo/screens/login_page_minimal.dart';
import 'package:zigwan_demo/screens/mainpage.dart';

//class MinimalSignUpPageApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: MinimalSignUpPage(),
//    );
//  }
//}

class MinimalSignUpPage extends StatefulWidget {
  @override
  _MinimalSignUpPageState createState() => _MinimalSignUpPageState();
}

class _MinimalSignUpPageState extends State<MinimalSignUpPage> {
  var _categories=['Dance Academy','Institute/Organization','Choreographer','Dancer'];
  var _userCategorySelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Image.asset('images/signup.jpg',fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0,right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      )
                  ),
                ),
                Container(padding: EdgeInsets.only(top: 10.0),),
                TextField(
                  decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      )
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sign up as ", style: TextStyle(
                        color:Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                    )),
                    SizedBox(width: 10.0,),
                    DropdownButton<String>(
                      items: _categories.map((String dropDownStringItem){
                        return DropdownMenuItem(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem,style: TextStyle(
                                color:Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            )));
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          _userCategorySelected=value;
                        });
                      },
                      value: _userCategorySelected,
                      hint: Text("SELECT"),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    print("SIGN UP");
//                        'Dance Academy','Institute/Organization','Choreographer','Dancer'
                    if(_userCategorySelected=='Dance Academy' || _userCategorySelected=='Institute/Organization'){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>AcademyRegistrationForm()));
                    }else{
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>IndividualRegistrationForm()));
                    }
                  },
                  child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.blue,
                        elevation: 5.0,
                        child: Center(
                          child: Text("SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an Account ",style: TextStyle(
                  color:Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'
              )),
              InkWell(
                child: Text('Log In',
                  style: TextStyle(
                      //decoration: TextDecoration.underline,
                      color:Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline
                  ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinimalLoginPage()),);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
