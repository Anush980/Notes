import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes/Screens/NoteEditUI.dart';
import 'package:notes/Api/api.dart';
import 'package:notes/Models/note.dart';

class DashNoteView extends StatelessWidget {
  const DashNoteView({super.key, required this.note, required this.onDelete});
  final Function(Note note) onDelete;
  final Note note;

  String sanitizeString(String input) {
    String sanitized = input.replaceAll(RegExp(r'[\r\n]+'), ' ');

    if (sanitized.length > 50) {
      sanitized = sanitized.substring(0, 50);
    }

    if (sanitized.length < 3) {
      sanitized = sanitized.padRight(
        3,
        '_',
      ); // pad with underscores or any char
    }

    return sanitized;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),

        closeThreshold: 0.1,

        children: [
          SlidableAction(
            onPressed: (d) async {
              await onDelete(note);
            },
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 16.0,
            ),
            borderRadius: BorderRadius.circular(5),
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: GestureDetector(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEdit(editingNote: note)));
          },
          child: Card(
            
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      sanitizeString(note.title),
          
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      sanitizeString(note.body),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
