import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/Cubit/cubit/note_cibit_cubit.dart';
import 'package:task_app/Models/Notes.dart';

import '../Widget/Addnotebottomsheet.dart';
import '../Widget/Customitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).FetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Addnotebottomsheet();
                });
          },
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Notes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: ((context, state) {
            var notes = BlocProvider.of<NoteCubit>(context).notes;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return CustomItem(
                        note: notes[index],
                      );
                    },
                    itemCount: notes.length,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
