import 'package:assignment_flutter/data/datasource/local_datasource.dart';
import 'package:assignment_flutter/data/models/todo.dart';
import 'package:assignment_flutter/data/models/photo.dart';
import 'package:assignment_flutter/domain/repository/todo_repository.dart';
import 'package:assignment_flutter/data/datasource/remote_datasource.dart';
// import 'package:assignment_flutter/data/datasource/local_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
 

  @override
  Future<List<TodoModel>> fetchTodos() async {
    try {
      print("i am going to fetch todos");
      final remoteTodos = await remoteDataSource.fetchTodo();
     
      final todos= remoteTodos.map((json)=>TodoModel.fromJson(json)).toList();
      //  await localDataSource.cacheTodos(todos);
      print("my answer is");
      print(todos);
      await localDataSource.cacheTodos(todos);
      return todos;
    } catch (e) {
      // Fallback to local cache if remote fails
      return await localDataSource.getCachedTodos();
      throw Exception('Failed to fetch todos: $e');
    }
  }
@override
Future<List<PhotoModel>> fetchPhotos(int id) async {
  try {
    print("i am going to fetch todos");
      final remoteTodos = await remoteDataSource.fetchPhotos(id);
     
      final todos= remoteTodos.map((json)=>PhotoModel.fromJson(json)).toList();
      //  await localDataSource.cacheTodos(todos);
      print("my answer is");
      print(todos);
      print(todos.toList());
      // await localDataSource.cacheTodos(todos);
      return todos;
  } catch (e) {
    // await localDataSource.getCachedPhoto(id);
    print("poshehal");
    throw Exception('Failed to fetch photo: $e');
  }
}

  // @override
  // Future<Todo?> getTodoById(int id) async {
  //   try {
  //     final todo = await remoteDataSource.getTodoById(id);
  //     if (todo != null) {
  //       await localDataSource.cacheTodo(todo);
  //     }
  //     return todo;
  //   } catch (e) {
  //     return await localDataSource.getCachedTodoById(id);
  //   }
  // }
}