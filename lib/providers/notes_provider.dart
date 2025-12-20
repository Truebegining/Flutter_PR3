import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class NoteItem {
  const NoteItem({
    required this.id,
    required this.content,
    required this.date,
  });

  final String id;
  final String content;
  final DateTime date;

  NoteItem copyWith({
    String? id,
    String? content,
    DateTime? date,
  }) {
    return NoteItem(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }
}

class NotesList extends Notifier<List<NoteItem>> {
  @override
  List<NoteItem> build() {
    return [];
  }

  void addNote(String content) {
    final newId = DateTime.now().millisecondsSinceEpoch.toString();
    state = [
      NoteItem(
        id: newId,
        content: content,
        date: DateTime.now(),
      ),
      ...state,
    ];
  }

  void deleteNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }
}

// Создаем провайдер вручную, чтобы не требовалась генерация кода
final notesListProvider = NotifierProvider<NotesList, List<NoteItem>>(NotesList.new);
