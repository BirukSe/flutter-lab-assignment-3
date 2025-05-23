part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
class TodoLoading extends TodoState {}

class TodosLoaded extends TodoState {  // All todos + their thumbnails
  final List<TodoModel> todos;
 
  TodosLoaded({required this.todos});
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}

class TodoSelected extends TodoState {
  final TodoModel todo;
  final PhotoModel photos;
  TodoSelected({required this.todo, required this.photos});
} 
