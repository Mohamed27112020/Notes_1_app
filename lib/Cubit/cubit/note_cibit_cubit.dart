import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/Models/Notes.dart';

import '../../constant.dart';
part 'note_cibit_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteCibitInitial());
  List<Note> notes = [];
  Addnote(
      {required Note note, required String title, required String desc}) async {
    try {
      emit(NoteCibitLoading());
      note.title = title;
      note.description = desc;
      notes.add(note);
      await saveListData('notes', notes);
      print(notes);
      print('note added sucessfully');
      emit(NoteCibitSucess());
    } on Exception catch (e) {
      print(e.toString());
      emit(NoteCibitError());
    }
  }

  Future<void> Removefun(Note note) async {
    await notes.remove(note);
    if (note == null) {
      print('Data removed successfully.');
    } else {
      print('Failed to remove data.');
    }
  }

  FetchAllNotes() {
    emit(NotesLoading());
    var notesbox = loadTasks();
    //print(notesbox.toString());
    emit(NotesSucess());
  }

  Future<void> SaveTasks(String key, List<Note> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        key, jsonEncode(tasks.map((task) => task.toJson()).toList()));
  }

  /// Saves a list of strings to SharedPreferences.
  ///
  /// [key] is the identifier for the list.
  /// [list] is the list of strings to be saved.
  Future<void> saveListData(String key, List<Note> list) async {
    List<dynamic> castlist = list.cast();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        key, jsonEncode(castlist.map((task) => task.toJson()).toList()));
  }

  /// Retrieves a list of strings from SharedPreferences.
  ///
  /// [key] is the identifier for the list.
  /// Returns the list of strings, or an empty list if no data is found.
  /*
  Future<List<String>> getListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }
*/
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
