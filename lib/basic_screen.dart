import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter_from_basic/edit_item_screen.dart';
import 'package:learn_flutter_from_basic/presentation/widgets/tag_dropdown_button.dart';

import 'model/to_do.dart';

const tagDropdownValues = [
  "Chores",
  "Fitness",
  "Study",
];

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

  // ini namannya data hardcode
  List<ToDo> listTodo = [
    ToDo("Aldi", "Mandi"),
    ToDo("Aldi", "Nyuci"),
    ToDo("Aldi", "Belajar"),
    ToDo("Aldi", "Tidur"),
  ];
  var inputController = TextEditingController();

  var selectedTag;

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
                    return
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
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
                                    builder: (context) => EditItemScreen(listTodo[index]),
                                  ),
                                );
                                setState(() {
                                  listTodo[index] = newValue;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listTodo[index].task),
                                  Text("Tag: ${listTodo[index].tag ?? "-"}"),
                                ],
                              ))),
                          ElevatedButton(onPressed: () async {
                            var theDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050));
                            var theTime = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                            var nonNullDate = theDate ?? DateTime.now();
                            var nonNullTime = theTime ?? TimeOfDay.fromDateTime(DateTime.now());
                            var dateWithTime = DateTime(nonNullDate.year,nonNullDate.month,nonNullDate.day,nonNullTime.hour,nonNullTime.minute);
                            setState(() {
                              listTodo[index].jadwal = dateWithTime;
                            });
                          }, child: Text((listTodo[index].jadwal == null ? "Pilih Tanggal" : DateFormat("dd - MMM - yyyy \nHH:mm").format(listTodo[index].jadwal ?? DateTime.now())).toString() )),
                          Container(
                            margin: const EdgeInsets.only(right: 16, left: 16),
                            child: GestureDetector(
                                onTap: (){
                                  setState((){
                                    listTodo.removeAt(index);
                                  });
                                },
                                child: Icon(Icons.clear)),
                          ),
                        ],
                    ),
                      );
                  }),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: inputController,
                      ),
                      TagDropdownButton(
                        selectedTag,
                        callbackSetState: (valueFromInternal){
                        setState(() {
                          selectedTag = valueFromInternal;
                        });
                      },),
                      ElevatedButton(onPressed: (){
                        setState((){
                          listTodo.add(ToDo("Aldi",inputController.text,tag: selectedTag)) ;
                          inputController.text = "";
                          selectedTag = null;
                          print("selectedTag $selectedTag");
                        });
                      }, child: Text("Add"))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
