import 'package:flutter/material.dart';
import 'package:notes/Dashboard/AddNoteScreen.dart';
import 'package:notes/Settings/profile_setting.dart';
import 'package:notes/api/api.dart';
import 'package:notes/components/DashNoteView.dart';
import 'package:notes/database/EncryptedDatabase.dart';
import 'package:notes/models/note.dart';

import 'package:sonner_flutter/sonner_flutter.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Note> notes = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration.zero);

    try {
      final data = await getNotes();
      EncryptedDatabase.instance.write("email", data.data["user"]?["email"]);

      setState(() {
        for (int i = 0; i < data.data["note"].length; i++) {}
      });
    } catch (e) {
      Toast.error(context, "Failed to load data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 45),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSetting()),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteEdit()),
          );
        },

        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return DashNoteView(
              title: notes[index].title,
              subTitle: notes[index].body,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteEdit()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
