part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}
class SelectTodo extends TodoEvent {
  final TodoModel album;
  
  SelectTodo(this.album);
} 
class FetchTodos extends TodoEvent {

}
