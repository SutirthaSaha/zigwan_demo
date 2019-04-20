import 'package:flutter/material.dart';

class ConnectionSettingsPage extends StatefulWidget {
  @override
  _ConnectionSettingsPageState createState() => _ConnectionSettingsPageState();
}

class _ConnectionSettingsPageState extends State<ConnectionSettingsPage> {
  bool isAcademyConnectSwitched=true;
  bool isEventConnectSwitched=true;
  bool isChoreographerConnectSwitched=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connection Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Card(child: ListTile(
            title: Text("Allow academy to connect"),
            trailing: Switch(
              value: !isAcademyConnectSwitched,
              onChanged: (value){
                setState(() {
                  isAcademyConnectSwitched=!value;
                });
              },
            ),
          ),),
          Card(
            child: ListTile(
              title: Text("Allow event organizers to connect"),
              trailing: Switch(
                value: !isEventConnectSwitched,
                onChanged: (value){
                  setState(() {
                    isEventConnectSwitched=!value;
                  });
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Allow choreographer to connect"),
              trailing: Switch(
                value: !isChoreographerConnectSwitched,
                onChanged: (value){
                  setState(() {
                    isChoreographerConnectSwitched=!value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
