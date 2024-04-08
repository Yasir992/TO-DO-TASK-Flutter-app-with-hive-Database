import 'dart:ui';

import 'package:flutter/material.dart';
import '../util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
    content: Container(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add New Task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //input button
               MyButtons(text: "Save", onPressed: onSave),
              //cancel button
              const SizedBox(width: 20,height: 10,),
              MyButtons(text: "Cancel", onPressed: onCancel),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
