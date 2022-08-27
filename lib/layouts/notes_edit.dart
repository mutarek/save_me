import 'package:flutter/material.dart';
import 'package:save_me/models/note_model.dart';

import '../database/notes_database.dart';

class NotesEdit extends StatefulWidget {
  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  String busName = '';
  String customerName = '';
  String seat = '';
  String number = '';
  String journey_date = '';
  String booking_time ='';

  TextEditingController busNamecon = TextEditingController();
  TextEditingController customerNameCon = TextEditingController();
  TextEditingController seatCon = TextEditingController();
  TextEditingController numberCon = TextEditingController();
  TextEditingController journeyCon = TextEditingController();
  TextEditingController bookingCon = TextEditingController();

  Future<void> _insertNote(Note note) async {
    NotesDatabase notesDb = NotesDatabase();
    await notesDb.initDatabase();
    int result = await notesDb.insertNote(note);
    await notesDb.closeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bookings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
            TextField(
            controller: busNamecon,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(0),
              counter: null,
              counterText: "",
              hintText: 'Bus Name',
              hintStyle: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            maxLength: 31,
            maxLines: 1,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
            textCapitalization: TextCapitalization.words,
          ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: customerNameCon,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  counter: null,
                  counterText: "",
                  hintText: 'Customer Name',
                  hintStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                maxLength: 31,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: seatCon,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  counter: null,
                  counterText: "",
                  hintText: 'Seat No',
                  hintStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                maxLength: 31,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: numberCon,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  counter: null,
                  counterText: "",
                  hintText: 'Number',
                  hintStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                maxLength: 31,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: journeyCon,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  counter: null,
                  counterText: "",
                  hintText: 'Journey Time',
                  hintStyle: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                maxLength: 31,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Note note = Note(
                      bus_name: busNamecon.text,
                      customer_name: customerNameCon.text,
                      seat: seatCon.text,
                      number: numberCon.text,
                      journey_date: journeyCon.text,
                      booking_time: DateTime.now().toString()
                    );
                    try {
                      await _insertNote(note);
                    } catch (e) {
                      print('Error inserting row');
                    } finally {
                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: Text('Add Booking'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
