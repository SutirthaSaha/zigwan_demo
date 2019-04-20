import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool isEmailSwitched=true;
  bool isMobileSwitched=true;
  bool isAppSwitched=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Card(child: ListTile(
            title: Text("Email Notification"),
            trailing: Switch(
              value: !isEmailSwitched,
              onChanged: (value){
                setState(() {
                  isEmailSwitched=!value;
                });
              },
            ),
          ),),
          Card(
            child: ListTile(
              title: Text("Mobile Notification"),
              trailing: Switch(
                value: !isMobileSwitched,
                onChanged: (value){
                  setState(() {
                    isMobileSwitched=!value;
                  });
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("App Notification"),
              trailing: Switch(
                value: !isAppSwitched,
                onChanged: (value){
                  setState(() {
                    isAppSwitched=!value;
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
