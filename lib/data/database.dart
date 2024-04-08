import 'package:hive/hive.dart';

class ToDoData  {

  List toDoList = [];
  //refernce the box
  final _mybox = Hive.box("mybox");

  //first time when user enter into app
  void createIntinalData (){
    toDoList =[
      ["name someone",false],
      ["make it",false],
    ];
  }
  void loadData(){
    toDoList = _mybox.get("ToDoList");
  }
  void updateDataBase(){
    _mybox.put("ToDoList", toDoList);
  }

}