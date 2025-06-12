import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Profile')
      ),
       body: Center(child: Column(
        children: [
          Text('Profile Setting')
        ],
       ),),
    );
  }
}