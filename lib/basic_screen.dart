import 'package:flutter/material.dart';
import 'package:learn_flutter_from_basic/edit_item_screen.dart';

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
    ToDo(false, "Mandi"),
    ToDo(false, "Nyuci"),
    ToDo(false, "Belajar"),
    ToDo(false, "Tidur"),
  ];
  var inputController = TextEditingController();

  // 1. cara pertama cuma modal for dan function
  List<Widget> widgetTodo() {
    var listOfToDos = <Widget>[];
    for (var i = 0; i < listTodo.length; i++) {
      listOfToDos.add(
        Row(
          children: [
            Checkbox(
                value: listTodo[i].isDone,
                onChanged: (val) {
                  setState(() {
                    listTodo[i].isDone = !listTodo[i].isDone;
                  });
                }),
            Text(listTodo[i].task),
          ],
        ),
      );
    }
    return listOfToDos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Screen"),
      ),
      body: SingleChildScrollView( // ini dipakai karena kadang widget berupa list, melebihi tinggi dari layar
        child: Center(
          child:

              /// ini komen dlu
              // Column(children: widgetTodo()
              //   ,)
              // 2. dengan ListView.builder
              Column(
            children: [
              ListView.builder(
                  // ini dipakai untuk resolve bentrol Scrollable, karena Listview defaultnya sendiri bisa di scroll, tapi widget lain nggak,
                  // jadi kadang widget lain kalau keluar layar ga bisa d scroll supaya kelihatan
                  physics: const NeverScrollableScrollPhysics(),
                  // ini untuk supaya ListView di dalam Column ga error (Karena kolom ga tau seberapa panjang listview ketika column di buat)
                  scrollDirection: Axis.vertical,
                  // ini untuk supaya ListView di dalam Column ga error (Karena kolom ga tau seberapa panjang listview ketika column di buat)
                  shrinkWrap: true,
                  // ini wajib biar dia tau mau berapa banyak item yang dia generate / build
                  itemCount: listTodo.length,
                  // ini widget yang di buat per Item dari List yg dia generate
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                            value: listTodo[index].isDone,
                            onChanged: (val) {
                              setState(() {
                                listTodo[index].isDone = !listTodo[index].isDone;
                              });
                            }),
                        Expanded(child: GestureDetector(
                            onTap:() async {
                              var newValue = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditItemScreen(listTodo[index].task),
                                ),
                              );
                              setState(() {
                                listTodo[index].task = newValue;
                              });
                            },
                            child: Text(listTodo[index].task))),
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                              onTap: (){
                                setState((){
                                  listTodo.removeAt(index);
                                });
                              },
                              child: Icon(Icons.clear)),
                        )
                      ],
                    );
                  }),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: inputController,
                    onEditingComplete: (){
                      setState((){
                        listTodo.add(ToDo(false,inputController.text)) ;
                        inputController.text = "";
                      });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
