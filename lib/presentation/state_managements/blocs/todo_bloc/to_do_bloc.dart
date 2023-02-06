import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/to_do.dart';
import '../../../../service/todo_service.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  TodoService todoService;
  ToDoBloc(this.todoService) : super(ToDoInitial()) {
    on<InitToDoService>((event, emit) async {
      await todoService.init();
      emit(DoneInitToDoService());
    });
    on<CreateToDo>((event, emit) async {
      emit(LoadingTodo());
      var prefs = await SharedPreferences.getInstance();
      var username = prefs.getString("username") ?? "Guest";
      var newTask = ToDo(event.task.task,username,tag: event.task.tag!);
      await todoService.addTask(newTask);
      emit(SuccessCreateTodo());
    });
    on<ReadToDo>((event, emit) async {
      emit(LoadingTodo());

      var prefs = await SharedPreferences.getInstance();
      var username = prefs.getString("username") ?? "Guest";
      var todoList = await todoService.getTasks(username);
      emit(SuccesFetchTodoList(todoList));
    });
    on<UpdateToDo>((event, emit) async {
      // emit(LoadingTodo());
      await todoService.updateTask(event.oldTask, event.newTask);
      emit(SuccessUpdateTodo());
    });
    on<DeleteToDo>((event, emit) async {
      emit(LoadingTodo());
      await todoService.removeTask(event.task);
      emit(SuccessDeleteTodo());
    });
  }
}
