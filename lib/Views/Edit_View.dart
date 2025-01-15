import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/Cubit/cubit/note_cibit_cubit.dart';
import 'package:task_app/Models/Notes.dart';

import 'package:task_app/Services/local_storage_service.dart';
import '../Widget/CustomBottom.dart';
import '../Widget/CustomTextField.dart';

class EditNoteView extends StatelessWidget {
  final Note note;
  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Addformnote(
          note: note,
        ),
      ),
    );
  }
}

class Addformnote extends StatelessWidget {
  Addformnote({super.key, required this.note});
  final Note note;

  String? title, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onChanged: (value) {
            title = value;
          },
          Htext: 'title',
          Maxline: 1,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          onChanged: (value) {
            desc = value;
          },
          Htext: 'description',
          Maxline: 5,
        ),
        SizedBox(
          height: 20,
        ),
        CustomBottom(
          ontap: () async {
            var taskslist = BlocProvider.of<NoteCubit>(context).notes;
            note.title = title ?? note.title;
            note.description = desc ?? note.description;
            BlocProvider.of<NoteCubit>(context).SaveTasks('notes', taskslist);
            // title == null ? note.title : title;
            // desc == null ? note.description : desc;

            //    BlocProvider.of<NoteCubit>(context).Addnote(
            //       note: note,
            //       title: title!,
            //       desc: desc!,
            //     );

            BlocProvider.of<NoteCubit>(context).FetchAllNotes();
            Navigator.pop(context);

            /*
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {
              
            });
            }
            */
          },
          name: 'Save',
        ),
      ],
    );
  }
}
