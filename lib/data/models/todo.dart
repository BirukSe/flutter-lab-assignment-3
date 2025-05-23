import 'package:assignment_flutter/domain/entity/todo.dart';
import "package:hive/hive.dart";
part 'todo.g.dart';
@HiveType(typeId: 2)
class TodoModel extends Todo{
  @HiveField(0)
  int id;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String title;
  @HiveField(3)
  bool completed;

  TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    this.completed = false,
  }):super(id: id, userId: userId, title: title, completed: completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }
}