import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me/layouts/notes_edit.dart';

import '../database/notes_database.dart';

class MyHome extends StatelessWidget {
  late List<Map<String, dynamic>> notesData;
  Future<List<Map<String, dynamic>>> readDatabase() async {
    try {
      NotesDatabase notesDb = NotesDatabase();
      await notesDb.initDatabase();
      List<Map> notesList = await notesDb.getAllNotes();
      await notesDb.closeDatabase();
      List<Map<String, dynamic>> notesData = List<Map<String, dynamic>>.from(notesList);
      notesData.sort((a, b) => (a['title']).compareTo(b['title']));
      return notesData;
    } catch(e) {
      print('Error retrieving notes');
      return [{}];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=> NotesEdit());
        },
      ),
      appBar: AppBar(
        title: Text('All Booking'),
      ),
      body: FutureBuilder(
          future: readDatabase(),
          builder: (context, snapshot) {
            return ListTile(
              title: Text('sas'),
            );
          }
      ),
    );
  }
}
