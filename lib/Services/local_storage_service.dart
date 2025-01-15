import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/Models/Notes.dart';

class LocalStorageService {
/*
void saveData() async {
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', 'JohnDoe'); // Save string data
  prefs.setInt('age', 30); // Save integer data
  prefs.setBool('isLoggedIn', true); // Save boolean data
}
void loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  int? age = prefs.getInt('age');
  bool? isLoggedIn = prefs.getBool('isLoggedIn');

  print('Username: $username');
  print('Age: $age');
  print('Is Logged In: $isLoggedIn');
}



*/

  Future<void> saveTasks(List<Note> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'tasks', jsonEncode(tasks.map((task) => task.toJson()).toList()));
  }

  Future<List<Note>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('tasks');
    if (data != null) {
      final List<dynamic> decoded = jsonDecode(data);
      return decoded.map((json) => Note.fromJson(json)).toList();
    }
    return [];
  }
}
