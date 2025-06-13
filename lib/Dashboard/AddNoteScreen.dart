import 'package:flutter/material.dart';
import 'package:notes/api/api.dart';
import 'package:notes/models/note.dart';
import 'package:sonner_flutter/sonner_flutter.dart';

class NoteEdit extends StatefulWidget {
  @override
  _NoteEditState createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  TextEditingController title = new TextEditingController();
  TextEditingController body = new TextEditingController();

  void save() async {
    final note = new Note();
    note.title = title.text + '\0';
    note.body = body.text + '\0';
    final adddone = await addNote(note);
    if (adddone.status) {
      Toast.success(context, "Note added");
      Navigator.pop(context);
    } else {
      Toast.error(context, adddone.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: save),
        title: TextField(
          controller: title,
          decoration: InputDecoration(
            hintText: 'Title',
            hintStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Container(
          height: double.infinity,
          child: TextField(
            controller: body,
            maxLines: null,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Write your Notes here...',
              hintStyle: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
