import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter_from_basic/presentation/screens/edit_item_screen.dart';
import 'package:learn_flutter_from_basic/presentation/screens/login_screen.dart';
import 'package:learn_flutter_from_basic/presentation/widgets/tag_dropdown_button.dart';
import 'package:learn_flutter_from_basic/service/todo_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/to_do.dart';
import '../state_managements/blocs/todo_bloc/to_do_bloc.dart';

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
    return BlocProvider<ToDoBloc>(
      create: (context) => ToDoBloc(TodoService())..add(InitToDoService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Basic Screen"),
          actions: [
            InkWell(
              onTap: () async {
                SharedPreferences.getInstance().then((prefValue) async {
                  await prefValue.clear();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          // ini dipakai karena kadang widget berupa list, melebihi tinggi dari layar
          child: Center(
            child:

                /// ini komen dlu
                // Column(children: widgetTodo()
                //   ,)
                // 2. dengan ListView.builder
                BlocConsumer<ToDoBloc, ToDoState>(
              listener: (context, state) {
                if (state is DoneInitToDoService) {
                  context.read<ToDoBloc>().add(ReadToDo());
                }
                if (state is SuccessCreateTodo) {
                  context.read<ToDoBloc>().add(ReadToDo());
                }
                if (state is SuccessUpdateTodo) {
                  context.read<ToDoBloc>().add(ReadToDo());
                }
                if (state is SuccessDeleteTodo) {
                  context.read<ToDoBloc>().add(ReadToDo());
                }
              },
              builder: (context, state) {
                var todoBloc = context.read<ToDoBloc>();
                print("Sekarang Statenya apa? ${state.runtimeType}");
                if (state is SuccesFetchTodoList) {
                  var listTodo = state.todoList;
                  return Column(
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
                            var currentTodo = listTodo[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: listTodo[index].isDone,
                                      onChanged: (val) {
                                        context.read<ToDoBloc>().add(UpdateToDo(
                                            listTodo[index],
                                            ToDo(currentTodo.task,
                                                currentTodo.username,
                                                tag: currentTodo.tag,
                                                isDone: !currentTodo.isDone,
                                                jadwal: currentTodo.jadwal)));
                                        // setState(() {
                                        //   listTodo[index].isDone =
                                        //       !listTodo[index].isDone;
                                        // });
                                      }),
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () async {
                                            var newValue =
                                                await Navigator.of(context)
                                                    .push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BlocProvider.value(
                                                  value:
                                                  todoBloc,
                                                  child: EditItemScreen(
                                                      listTodo[index]),
                                                ),
                                              ),
                                            );
                                            setState(() {
                                              listTodo[index] = newValue;
                                            });
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(listTodo[index].task),
                                              Text(
                                                  "Tag: ${listTodo[index].tag ?? "-"}"),
                                            ],
                                          ))),
                                  ElevatedButton(
                                      onPressed: () async {
                                        var todoBloc = context.read<ToDoBloc>();
                                        var theDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2050));
                                        var theTime = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                DateTime.now()));
                                        var nonNullDate =
                                            theDate ?? DateTime.now();
                                        var nonNullTime = theTime ??
                                            TimeOfDay.fromDateTime(
                                                DateTime.now());
                                        var dateWithTime = DateTime(
                                            nonNullDate.year,
                                            nonNullDate.month,
                                            nonNullDate.day,
                                            nonNullTime.hour,
                                            nonNullTime.minute);
                                        todoBloc.add(UpdateToDo(
                                            listTodo[index],
                                            ToDo(currentTodo.task,
                                                currentTodo.username,
                                                tag: currentTodo.tag,
                                                isDone: currentTodo.isDone,
                                                jadwal: dateWithTime)));
                                        // setState(() {
                                        //   listTodo[index].jadwal = dateWithTime;
                                        // });
                                      },
                                      child: Text((listTodo[index].jadwal ==
                                                  null
                                              ? "Pilih Tanggal"
                                              : DateFormat(
                                                      "dd - MMM - yyyy \nHH:mm")
                                                  .format(
                                                      listTodo[index].jadwal ??
                                                          DateTime.now()))
                                          .toString())),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 16, left: 16),
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ToDoBloc>()
                                              .add(DeleteToDo(currentTodo));
                                          setState(() {
                                            listTodo.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.clear)),
                                  ),
                                ],
                              ),
                            );
                          }),
                      // bagian input
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: inputController,
                              ),
                              TagDropdownButton(
                                selectedTag,
                                callbackSetState: (valueFromInternal) {
                                  setState(() {
                                    selectedTag = valueFromInternal;
                                  });
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    var todoBloc = context.read<ToDoBloc>();
                                    todoBloc.add(CreateToDo(ToDo(
                                        inputController.text, "-",
                                        tag: selectedTag)));
                                    setState(() {
                                      // listTodo.add(ToDo(
                                      //     "Aldi", inputController.text,
                                      //     tag: selectedTag));
                                      inputController.text = "";
                                      selectedTag = null;
                                      print("selectedTag $selectedTag");
                                    });
                                  },
                                  child: Text("Add"))
                            ],
                          )),
                    ],
                  );
                }
                if (state is LoadingTodo) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
