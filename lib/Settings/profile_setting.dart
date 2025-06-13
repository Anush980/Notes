import 'package:flutter/material.dart';
import 'package:notes/components/ButtonView.dart';
import 'package:notes/components/ThemeProvider.dart';

import 'package:provider/provider.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(
              'Connected Account',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'anush.stha232@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              child: Text(
                themeProvider.isDarkMode == 0
                    ? 'Switch to Light Mode'
                    : themeProvider.isDarkMode == 1
                    ? 'Switch to Dark Mode'
                    : 'Switch to System Theme',
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.5),
            Container(
              width: 200,
              child: ButtonView(
                onPressed: () {},
                buttonText: "Logout",
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
