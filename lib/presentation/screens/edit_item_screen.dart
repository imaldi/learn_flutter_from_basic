import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_from_basic/presentation/widgets/tag_dropdown_button.dart';

import '../../model/to_do.dart';
import '../state_managements/blocs/todo_bloc/to_do_bloc.dart';

class EditItemScreen extends StatefulWidget {
  // final String textItem;
  final ToDo theTask;

  const EditItemScreen(this.theTask, {Key? key}) : super(key: key);

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  late var controller;
  var selectedTag;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.theTask.task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: controller,
              ),
            ),
            // disinikan state internal widget custom berubah, tapi widget
            // tapi widget parent nya (edit_screen) ga berubah, karena
            // Karena, yg d gambar ulang cuma widget customnya (method build nya di panggil lagi oleh setState di dalam widget custom)
            TagDropdownButton(
              selectedTag,
              callbackSetState: (valueFromInternal) {
                setState(() {
                  selectedTag = valueFromInternal;
                  print("Dropdown kepencet di dalam Edit Screen");
                });
              },
            ),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                var todoBloc = context.read<ToDoBloc>();
                return ElevatedButton(
                    onPressed: () {
                      var currentTodo = widget.theTask;
                      todoBloc.add(UpdateToDo(widget.theTask, ToDo(
                          controller.text,
                          currentTodo.username,
                          tag: selectedTag,
                          isDone: currentTodo.isDone,
                          jadwal: currentTodo.jadwal)));
                      // var newTask = widget.theTask;
                      // newTask.task = controller.text;
                      // newTask.tag = selectedTag;
                      Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => BasicScreen(textItem: controller.text),
                      // ));
                    },
                    child: Text("Update"));
              },
            )
          ],
        ),
        // Text("Value dari halaman sebelumnya: ${widget.textItem}"),
      ),
    );
  }
}
