import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {

  final String taskName;
 // final String description;
  final bool taskCompeleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

 ToDoTile({
    super.key,
    required this.taskName,
 //  required this.description,
    required this.taskCompeleted,
    required this.onChanged,
   required this.deleteFunction,
}
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 25.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
          ],

        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Row(
              children: [

                Checkbox(
                    value: taskCompeleted,
                    onChanged: onChanged,
                  activeColor: Colors.black,

                ),
                Text(
                    taskName,
                  style: TextStyle(decoration: taskCompeleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

