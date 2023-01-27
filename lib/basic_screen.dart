import 'package:flutter/material.dart';

import 'model/ToDo.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {

  // List<bool> listValueToDoIsDone = [
  //   false,
  //   false,
  //   false,
  //   false
  // ];
  //
  // List<String> listTask = [
  //   "Mandi",
  //   "Nyuci",
  //   "Belajar",
  //   "Tidur",
  // ];

  List<ToDo> listTodo = [
    ToDo(false,"Mandi"),
    ToDo(false,"Nyuci"),
    ToDo(false,"Belajar"),
    ToDo(false,"Tidur"),
  ];

  // 1. cara pertama cuma modal for dan function
  List<Widget> widgetTodo(){
    var listOfToDos = <Widget>[];
    for(var i = 0; i < listTodo.length; i++){
      listOfToDos.add(Row(
        children: [
          Checkbox(value: listTodo[i].isDone, onChanged: (val){
            setState(() {
              listTodo[i].isDone = !listTodo[i].isDone;
            });
          }),
          Text(listTodo[i].task),
        ],
      ),);
    }
    return listOfToDos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Screen"),
      ),
      body: Center(
        child: Column(children: widgetTodo()
          ,)
      ),
    );
  }
}
