import 'package:flutter/material.dart';
import 'package:simple_note/pages/note_edit_page.dart';
import 'package:simple_note/pages/note_list_page.dart';
import 'package:simple_note/pages/note_view_page.dart';

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
      // home: const NoteEditPage(),
      // initialRoute 속성은 home: 속성과 같이 사용할 수 없으므로
      initialRoute: NoteListPage.routeName,
      routes: {
        NoteListPage.routeName: (context) => const NoteListPage(),
        NoteEditPage.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final index = args != null ? args as int : null;
          return NoteEditPage(index);
        },
        NoteViewPage.routeName: (context) {
          final index = ModalRoute.of(context)!.settings.arguments as int;
          return NoteViewPage(index);
        },
      },
    );
  }
}
