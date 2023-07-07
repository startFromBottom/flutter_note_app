import 'package:flutter_note_app/data/data_source/note_db_helper.dart';
import 'package:flutter_note_app/data/repository/note_repository_impl.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute("""CREATE TABLE note 
    (id INTEGER PRIMARY KEY AUTOINCREMENT,  
    title TEXT, 
    content TEXT, 
    color INTEGER, 
    timestamp INTEGER)""");
    },
  );

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
  NotesViewModel notesViewModel = NotesViewModel(repository: repository);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
