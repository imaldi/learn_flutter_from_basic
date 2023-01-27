import 'package:flutter/material.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  bool isDoneMandi = false;
  bool isDoneNyuci = false;
  bool isDoneBelajar = false;
  bool isDoneTidur = false;
  List<bool> listValueToDoIsDone = [
    false,
    false,
    false,
    false
  ];

  List<String> listTask = [
    "Mandi",
    "Nyuci",
    "Belajar",
    "Tidur",
  ];

  // 1. cara pertama cuma modal for dan function
  List<Widget> widgetTodo(){
    var listOfToDos = <Widget>[];
    for(var i = 0; i < listTask.length; i++){
      listOfToDos.add(Row(
        children: [
          Checkbox(value: listValueToDoIsDone[i], onChanged: (val){
            setState(() {
              listValueToDoIsDone[i] = !listValueToDoIsDone[i];
            });
          }),
          Text(listTask[i]),
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
