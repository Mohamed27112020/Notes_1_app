part of 'note_cibit_cubit.dart';


abstract class NoteState {}

class NoteCibitInitial extends NoteState {}

class NoteCibitLoading extends NoteState {}

class NoteCibitSucess extends NoteState {}

class NoteCibitError extends NoteState {}
class NotesInitial extends NoteState {}

class NotesLoading extends NoteState {}

class NotesSucess extends NoteState {
 //final List<dynamic> notes;

//  NotesSucess(this.notes);
}

class NotesError extends NoteState {}
