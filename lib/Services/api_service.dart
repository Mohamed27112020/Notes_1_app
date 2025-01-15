import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/Models/Notes.dart';
import '../Models/user.dart';

class ApiService {
  
  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Login failed');
    }
  }

  Future<List<Note>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['todos'] as List).map((json) => Note.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }
}
