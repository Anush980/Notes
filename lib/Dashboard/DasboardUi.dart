import 'package:flutter/material.dart';
import 'package:notes/Dashboard/AddNoteScreen.dart';
import 'package:notes/Settings/profile_setting.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> title = ["Get Started with Notes", "hi"];
  List<String> subTitle = ["Keeping the notes for the future", "helloo"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),

                closeThreshold: 0.1,

                children: [
                  SlidableAction(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 16.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    onPressed: (d) => {},
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 16.0,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 118, 155, 192),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        title[index],

                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 248, 248, 248),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subTitle[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
