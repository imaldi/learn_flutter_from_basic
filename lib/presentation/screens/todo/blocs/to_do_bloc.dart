import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../model/to_do.dart';
import '../../../../service/todo_service.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  TodoService todoService;
  ToDoBloc(this.todoService) : super(ToDoInitial()) {
    on<CreateToDo>((event, emit) async {
      emit(LoadingTodo());
      todoService.addTask(event.task);
      emit(SuccessCreateTodo());
    });
    on<ReadToDo>((event, emit) async {
      emit(LoadingTodo());
      var todoList = await todoService.getTasks(event.username);
      emit(SuccesFetchTodoList(todoList));
    });
    on<UpdateToDo>((event, emit)async {
      emit(LoadingTodo());
      var todoList = await todoService.updateTask(event.oldTask, event.newTask);
      emit(SuccessUpdateTodo());
    });
    on<DeleteToDo>((event, emit)async {
      emit(LoadingTodo());
      var todoList = await todoService.removeTask(event.task);
      emit(SuccessDeleteTodo());
    });
  }
}
