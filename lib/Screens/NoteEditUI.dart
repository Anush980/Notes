import 'package:flutter/material.dart';
import 'package:notes/Api/api.dart';
import 'package:notes/Models/note.dart';
import 'package:sonner_flutter/sonner_flutter.dart';

class NoteEdit extends StatefulWidget {
  final Note? editingNote;
  NoteEdit({Key? key, this.editingNote}) : super(key: key);

  @override
  _NoteEditState createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  TextEditingController title = new TextEditingController();
  TextEditingController body = new TextEditingController();
  bool editing = false;

  void add() async {
    final note = new Note();
    note.title = title.text;
    note.body = body.text;
    if (note.body == "" || note.title == "") {
      Toast.info(context, "Empty Note, Skipping save");

      Navigator.pop(context);
      return;
    }

    final adddone = await addNote(note);
    if (adddone.status) {
      Toast.success(context, "Note added");
      Navigator.pop(context);
    } else {
      Toast.error(context, adddone.message);
    }
  }

  void update() async {
    final note = new Note();
    note.title = title.text;
    note.body = body.text;
    note.id = widget.editingNote!.id;
    if (note.body == "" || note.title == "" || note.id == "") {
      Toast.info(context, "Empty Note, Skipping update");

      Navigator.pop(context);
      return;
    }

    final adddone = await updateNote(note);
    if (adddone.status) {
      Toast.success(context, "Note updated");
      Navigator.pop(context);
    } else {
      Toast.error(context, adddone.message);
    }
  }

  void save() async {
    if (editing) {
      update();
    } else {
      add();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editingNote != null) {
      editing = true;
      title.text = widget.editingNote!.title;
      body.text = widget.editingNote!.body;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () async {
     save(); 
      Navigator.pop(context); 
    }, ),
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
