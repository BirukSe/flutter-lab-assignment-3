import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:assignment_flutter/data/models/todo.dart';
import 'package:assignment_flutter/data/models/photo.dart';

class LocalDataSource {
  static const String todosBoxName = 'todosBox';
  static const String photosBoxName = 'photosBox';

  // Store todos
  Future<void> cacheTodos(List<dynamic> todos) async {
    final box = await Hive.openBox<TodoModel>(todosBoxName);
    await box.clear();
    await box.addAll(todos as Iterable<TodoModel>);
    await box.close();
  }

  // Get todos
  Future<List<TodoModel>> getCachedTodos() async {
    final box = await Hive.openBox<TodoModel>(todosBoxName);
    final todos = box.values.toList();
    await box.close();
    if (todos.isEmpty) throw Exception('No cached todos');
    return todos;
  }

  // Store a photo
  Future<void> cachePhoto(PhotoModel photo) async {
    final box = await Hive.openBox<PhotoModel>(photosBoxName);
    await box.put(photo.id, photo);
    await box.close();
  }

  // Get a photo by id


Future<PhotoModel> getCachedPhoto(int id) async {
  late Box<PhotoModel> box;
  try {
    box = await Hive.openBox<PhotoModel>(photosBoxName);
    final photo = box.get(id);
    if (photo == null) {
      throw Exception('No cached photo for id $id');
    }
    return photo;
  } catch (e) {
    debugPrint('Error accessing cached photo: $e');
    rethrow;
  } finally {
    await box.close();
  }
}
}