import 'package:flutter/material.dart';
import 'package:simple_note/datas/note.dart';
import 'package:simple_note/datas/note_manager.dart';
import 'package:simple_note/pages/note_edit_page.dart';
import 'package:simple_note/pages/note_view_page.dart';

import '../providers.dart';

class NoteListPage extends StatefulWidget {
  static const routeName = '/';

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
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        children: _buildCards(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NoteEditPage.routeName).then((value) {
            setState(() {});
          });
        },
        tooltip: '새 노트',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _buildCards() {
    // 리스트에 있는 정보를 다른 형태로 변환할 때는 map() 함수 이용.
    // card widge으로 변환하는 코드.
    // return noteManager().listNotes().map((note) => _buildCard(note)).toList();
    // return NoteManager().listNotes()
    final notes = noteManager().listNotes();
    return List.generate(
        notes.length, (index) => _buildCard(index, notes[index]));
  }

  Widget _buildCard(int index, Note note) {
    return InkWell(
      child: Card(
          color: note.color,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title.isEmpty ? '(제목없음)' : note.title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                    child: Text(
                  note.body,
                  overflow: TextOverflow.fade,
                ))
              ],
            ),
          )),
      onTap: () {
        Navigator.pushNamed(context, NoteViewPage.routeName, arguments: index)
            .then((value) {
          setState(() {});
        });
      },
    );
  }
}
