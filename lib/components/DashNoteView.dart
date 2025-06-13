import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class DashNoteView extends StatelessWidget {
  const DashNoteView({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 118, 155, 192),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                title,

                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 248, 248, 248),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
