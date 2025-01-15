import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/Cubit/auth_cubit.dart';
import 'package:task_app/Cubit/cubit/note_cibit_cubit.dart';

import 'package:task_app/Views/Login_screen.dart';

void main() async {
  runApp(Notes());
}

class Notes extends StatelessWidget {
  const Notes({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => NoteCubit()),
        ),
        BlocProvider(
          create: ((context) => Authcubit()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasks',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Login_Page(),
      ),
    );
  }
}
