import 'package:flutter/material.dart';
import 'package:notes/Screens/NoteEditUI.dart';
import 'package:notes/Screens/Loading/LoadingService.dart';
import 'package:notes/Screens/SettingsUI.dart';
import 'package:notes/Api/api.dart';
import 'package:notes/Screens/Components/DashNoteView.dart';
import 'package:notes/EncryptedDatabase/EncryptedDatabase.dart';
import 'package:notes/Models/note.dart';

import 'package:sonner_flutter/sonner_flutter.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with RouteAware {
  List<Note> notes = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _loadData();
  }

  Future<void> _loadData() async {
    LoadingService.show();
    notes.clear();
    await Future.delayed(Duration.zero);

    try {
      final data = await getNotes();
      EncryptedDatabase.instance.write("email", data.data["user"]?["email"]);

      setState(() {
        for (int i = 0; i < data.data["note"].length; i++) {
          final thisNote = new Note();
          thisNote.title = data.data["note"][i]["title"];
          thisNote.body = data.data["note"][i]["body"];
          thisNote.id = data.data["note"][i]["id"];
          notes.add(thisNote);
        }
      });
    } catch (e) {
      Toast.error(context, "Failed to load data: $e");
    }

    LoadingService.hide();
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
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return DashNoteView(
              note: notes[index],
              onDelete: (note) async {
                await deleteNote(note);
                await _loadData();
                Toast.success(context, "Note Deleted");
              },
            );
          },
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
