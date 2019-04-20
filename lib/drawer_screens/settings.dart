import 'package:flutter/material.dart';
import 'package:zigwan_demo/screens/connection_settings.dart';
import 'package:zigwan_demo/screens/notification_settings.dart';
import 'package:zigwan_demo/screens/privacy_settings.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body:ListView(
        children: <Widget>[
          Card(child: ListTile(
            leading: Icon(Icons.settings_input_antenna),
            title: Text("Manage Notifications"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage()));
            },
          ),),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock_open),
              title: Text("Privacy Settings"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacySettingsPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.supervisor_account),
              title: Text("Connection Settings"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectionSettingsPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("App Info"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.copyright),
              title: Text("Privacy Policy"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Terms and Conditions"),
            ),
          ),
        ],
      )
    );
  }
}
