import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  List dates=["24th August","25th August","26th August"];
  @override
  void initState() {
    super.initState();
  }
  postsCard(){
    var screenSize=MediaQuery.of(context).size;
    return Container(
      height: screenSize.height*0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: dates.length,
        itemBuilder: (context,index){
          return Card(
              color: Colors.black87,
              child: Container(
                width: screenSize.width*0.4,
                child: Center(
                  child: Text(dates[index],style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white))
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        fit: BoxFit.cover
                    )
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    images: [
                      AssetImage("images/background.png"),
                      AssetImage("images/background1.png"),
                      AssetImage("images/background2.png"),
                      AssetImage("images/background3.png"),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                  )
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: BackButton(color:Colors.white),
              )
            ],
          ),
          Card(
//            margin:EdgeInsets.all(10),
            child: ListTile(
              title: Text("Name of Event",style: TextStyle(
                  fontWeight:FontWeight.bold,
              ),),
              trailing: RaisedButton(
                  onPressed: (){

                  },
                  child:Text("Register")
              ),
            ),
          ),
          Card(
//            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                postsCard(),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text("Registration Fee:",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          child: Text("R 500"),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text("Locality :",style:TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text("Girish Park"),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Address",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.start,),
                        )
                      ],
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(left:10,right:10,bottom:10),
                    child: Container(
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
                title: Text("Reward",style: TextStyle(
                  fontWeight:FontWeight.bold,
                ),),
                trailing: Text("1K")
            ),
          ),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
