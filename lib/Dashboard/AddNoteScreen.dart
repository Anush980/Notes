import 'package:flutter/material.dart';

class NoteEdit extends StatefulWidget {
  NoteEdit({Key? key}) : super(key: key);

  @override
  _NoteEditState createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: TextField(
        decoration: InputDecoration(
            hintText: 'Title', 
            hintStyle: TextStyle(
              color: const Color.fromARGB(179, 0, 0, 0), 
              fontSize: 18,
            ),
          ),
        )
       ),
       body:Padding(
         padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05,top:MediaQuery.of(context).size.height*0.02),
         child: TextField(
          maxLines: null,
          textDirection: TextDirection.ltr,
          decoration: InputDecoration(
            
            border: InputBorder.none,
           hintText: 'Write your Notes here...',
           hintStyle: TextStyle( color: const Color.fromARGB(179, 0, 0, 0),
          fontSize: 13,),
         
          ),
         ),
       ),
    );
  }
}