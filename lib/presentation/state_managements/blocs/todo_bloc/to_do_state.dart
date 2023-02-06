part of 'to_do_bloc.dart';

abstract class ToDoState extends Equatable {
  const ToDoState();
}

class ToDoInitial extends ToDoState {
  @override
  List<Object> get props => [];
}

class LoadingTodo extends ToDoState {
  @override
  List<Object?> get props => [];

}

class SuccesFetchTodoList extends ToDoState {
  List<ToDo> todoList;
  SuccesFetchTodoList(this.todoList);
  @override
  List<Object> get props => [todoList];
}

class FailedFetchTodoList extends ToDoState {
  const FailedFetchTodoList();
  @override
  List<Object> get props => [];
}

class SuccessCreateTodo extends ToDoState {
  const SuccessCreateTodo();
  @override
  List<Object> get props => [];
}

class FailedCreateTodo extends ToDoState {
  const FailedCreateTodo();
  @override
  List<Object> get props => [];
}

class SuccessUpdateTodo extends ToDoState {
  const SuccessUpdateTodo();
  @override
  List<Object> get props => [];
}


class FailedUpdateTodo extends ToDoState {
  const FailedUpdateTodo();
  @override
  List<Object> get props => [];
}

class SuccessDeleteTodo extends ToDoState {
  const SuccessDeleteTodo();
  @override
  List<Object> get props => [];
}


class FailedDeleteTodo extends ToDoState {
  const FailedDeleteTodo();
  @override
  List<Object> get props => [];
}

class DoneInitToDoService extends ToDoState {
  @override
  List<Object?> get props => [];

}
