import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/Cubit/cubit/note_cibit_cubit.dart';
import 'package:task_app/Models/Notes.dart';

import 'package:task_app/Views/Edit_View.dart';

class CustomItem extends StatelessWidget {
  CustomItem({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // color: BlocProvider.of<NoteCubit>(context).color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  note.description,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    BlocProvider.of<NoteCubit>(context).Removefun(note);
                    await BlocProvider.of<NoteCubit>(context).FetchAllNotes();
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
