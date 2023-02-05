part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class CreateToDo extends ToDoEvent {
  ToDo task;
  CreateToDo(this.task);
  @override
  List<Object?> get props => [task];
}
class ReadToDo extends ToDoEvent {
  String username;
  ReadToDo(this.username);
  @override
  List<Object?> get props => [username];
}
class UpdateToDo extends ToDoEvent {
  ToDo oldTask;
  ToDo newTask;
  UpdateToDo(this.oldTask,this.newTask);
  @override
  List<Object?> get props => [oldTask,this.newTask];
}
class DeleteToDo extends ToDoEvent {
  ToDo task;
  DeleteToDo(this.task);
  @override
  List<Object?> get props => [task];
}
