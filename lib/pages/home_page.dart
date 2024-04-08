import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../util/to_do_tile.dart';
import '../util/dialog_box.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box("mybox");
  ToDoData db = ToDoData();
  @override
  void initState() {
    if(_myBox.get("ToDoList")== null){
      db.createIntinalData();
    } else{
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  //textcontroller
  final _controller = TextEditingController();

  //checkbocchnaged method
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  //save new task
  void savedNewTask(){
     setState(() {
       db.toDoList.add([_controller.text, false]);
       _controller.clear();
     });
     Navigator.of(context).pop();
     db.updateDataBase();
  }
  //create new task
  void createTask(){
    showDialog(context: context, builder: (context){
    return DialogBox(
      controller: _controller,
      onSave: savedNewTask,
      onCancel: () => Navigator.of(context).pop(),
     );
    },
    );
  }
  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("To do List"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompeleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
          );
        },

      ),
    );
  }
}
