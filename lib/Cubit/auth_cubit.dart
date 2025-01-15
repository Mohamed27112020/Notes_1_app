import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/Cubit/auth_states.dart';

class Authcubit extends Cubit<AuthState> {
  Authcubit() : super(LoginInitial());

  Future<void> login(
      {required String username, required String password}) async {
    emit(LoginLoading());
    try {
      final url = Uri.parse('https://dummyjson.com/auth/login');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30, // optional, defaults to 60
      });

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(LoginSucces());
        print(data); // Handle the parsed JSON data
      } else {
        emit(LoginFailure());
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  void showSnackbar(context, text, Color color) {
    var snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Color(0xFFFF303030),
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        color: color,
        title: 'On Snap!',
        message: text,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
