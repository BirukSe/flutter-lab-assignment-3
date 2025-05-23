

import 'package:assignment_flutter/domain/entity/photo.dart';
import 'package:assignment_flutter/domain/entity/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<Photo> fetchPhotos(int id);
 
 

 
}