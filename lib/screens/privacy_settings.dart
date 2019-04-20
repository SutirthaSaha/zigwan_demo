import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool isProfileVisibleSwitched=true;
  bool isDetailsVisibleSwitched=true;
  bool isPhotoVisibleSwitched=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Card(child: ListTile(
            title: Text("Profile visible to all user"),
            trailing: Switch(
              value: !isProfileVisibleSwitched,
              onChanged: (value){
                setState(() {
                  isProfileVisibleSwitched=!value;
                });
              },
            ),
          ),),
          Card(
            child: ListTile(
              title: Text("Make contact details visble"),
              trailing: Switch(
                value: !isDetailsVisibleSwitched,
                onChanged: (value){
                  setState(() {
                    isDetailsVisibleSwitched=!value;
                  });
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Make profile photo visible"),
              trailing: Switch(
                value: !isPhotoVisibleSwitched,
                onChanged: (value){
                  setState(() {
                    isPhotoVisibleSwitched=!value;
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
