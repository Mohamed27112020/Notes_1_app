import 'package:flutter/material.dart';
import 'package:task_app/Cubit/cubit/note_cibit_cubit.dart';

import 'AddFormNote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addnotebottomsheet extends StatelessWidget {
  Addnotebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteCibitSucess) {
          BlocProvider.of<NoteCubit>(context).FetchAllNotes();
          Navigator.pop(context);
        }
        if (state is NoteCibitError) {
          print('Failed ${state.toString()}');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: AddFormnote(),
          ),
        );
      },
    );
  }
}

