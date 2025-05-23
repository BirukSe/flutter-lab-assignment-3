import 'dart:convert';
import 'package:assignment_flutter/data/models/photo.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String baseUrl;

  RemoteDataSource({this.baseUrl = 'https://jsonplaceholder.typicode.com'});

  Future<List<dynamic>> fetchTodo() async {
    final response = await http.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load posts');
    }
  }

Future<Map<String, dynamic>> fetchPhotos(int id) async {
  final response = await http.get(Uri.parse('$baseUrl/photos/$id'));
  print("photo id: $id");
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load photo');
  }
}
}