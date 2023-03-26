import 'package:simple_note/datas/note_manager.dart';

NoteManager? _noteManager;

NoteManager noteManager() {
  if (_noteManager == null) {
    _noteManager = NoteManager();
  }

  return _noteManager!;
}
