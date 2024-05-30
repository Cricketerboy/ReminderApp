import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remainder_app/model/reminder_model.dart';

class Switcher extends StatefulWidget {
  bool onOff;
  String uid;
  Timestamp timeStamp;
  String id;

  Switcher(this.onOff, this.uid, this.id, this.timeStamp);

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (bool value) {
        ReminderModel reminderModel = ReminderModel();
        reminderModel.onOff = value;
        reminderModel.timeStamp = widget.timeStamp;
        FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('reminder')
            .doc(widget.id)
            .update(reminderModel.toMap());
      },
      value: widget.onOff,
    );
  }
}
