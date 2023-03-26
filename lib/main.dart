import 'package:flutter/material.dart';
import 'package:simple_note/pages/note_edit_page.dart';
import 'package:simple_note/pages/note_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Note',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const NoteEditPage(),
    );
  }
}
