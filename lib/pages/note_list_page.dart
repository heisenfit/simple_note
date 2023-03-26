import 'package:flutter/material.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoteListPageSate();
  }
}

class _NoteListPageSate extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notes'),
      ),
    );
  }
}
