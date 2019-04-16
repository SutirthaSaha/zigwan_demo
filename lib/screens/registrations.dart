import 'package:flutter/material.dart';

class Registrations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrations"),
      ),
      body: RegistrationsPage(),
    );
  }
}

class RegistrationsPage extends StatefulWidget {
  @override
  _RegistrationsPageState createState() => _RegistrationsPageState();
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  approvedCard(){
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child:Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(child:Text("")),
                  Icon(Icons.check_circle,color: Colors.green,size: 16,),
                  SizedBox(width:5),
                  Text("APPROVED",style:TextStyle(color:Colors.green,fontSize: 13))
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(left:5,right:5),
              child:Divider(
                height: 1,
                color: Colors.grey,
              )
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 5,),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 210, 210, 210),
                        backgroundImage: AssetImage("images/background.png"),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    padding: EdgeInsets.all(10),
                    child: Text("Registration for Jazz workshop has been approved by the organizer"),
                  )
                ],
              ),
            ),
            Padding(
                padding:EdgeInsets.only(left:5,right:5),
                child:Divider(
                  height: 1,
                  color: Colors.grey,
                )
            ),
            Padding(
              padding:EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("3 hrs ago"),
                  ),
                  Text("Download Pass",style:TextStyle(color:Colors.blue)),
                  SizedBox(width: 10,),
                  Text("Cancel",style:TextStyle(color:Colors.blue))
                ],
              ),
            )
          ],
        )
      )
    );
  }
  pendingCard(){
    return Card(
        child: Container(
            padding: EdgeInsets.all(5),
            child:Column(
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:Text("")),
                      Icon(Icons.access_time,color: Colors.red,size: 16,),
                      SizedBox(width:5),
                      Text("PENDING",style:TextStyle(color:Colors.red,fontSize: 13))
                    ],
                  ),
                ),
                Padding(
                    padding:EdgeInsets.only(left:5,right:5),
                    child:Divider(
                      height: 1,
                      color: Colors.grey,
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 5,),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 210, 210, 210),
                            backgroundImage: AssetImage("images/background.png"),
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        padding: EdgeInsets.all(10),
                        child: Text("Registration request for solo dance competition in Elixir has been sent to organizer"),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding:EdgeInsets.only(left:5,right:5),
                    child:Divider(
                      height: 1,
                      color: Colors.grey,
                    )
                ),
                Padding(
                  padding:EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("10 mins ago"),
                      ),
                      Text("Cancel",style:TextStyle(color:Colors.blue))
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:10,
        itemBuilder: (context,index){
          if(index%2==0){
            return approvedCard();
          }else{
            return pendingCard();
          }
        }
    );
  }
}

