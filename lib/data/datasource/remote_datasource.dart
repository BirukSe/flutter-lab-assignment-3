import 'dart:convert';
import 'package:assignment_flutter/data/models/photo.dart';
import 'package:flutter/material.dart';
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

Future<List<dynamic>> fetchPhotos(int id) async {
  print("making api requres");
  final response = await http.get(Uri.parse('$baseUrl/photos?albumId=$id'));
  print('the eesult is');
  print(response.body);
  print("my status code");
  print(response.statusCode);

  print("photo id: $id");
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as List<dynamic>;
  } else {
    throw Exception('Failed to load photo');
  }
}
}