
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_provider.g.dart';

@immutable
class MenuItem {
  const MenuItem({
    required this.id,
    required this.dish,
    required this.date,
    required this.notes,
    this.isCompleted = false,
  });

  final String id;
  final String dish;
  final String date;
  final String notes;
  final bool isCompleted;

  MenuItem copyWith({
    String? id,
    String? dish,
    String? date,
    String? notes,
    bool? isCompleted,
  }) {
    return MenuItem(
      id: id ?? this.id,
      dish: dish ?? this.dish,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

@riverpod
class MenuItems extends _$MenuItems {
  @override
  List<MenuItem> build() {
    return [];
  }

  // Метод для добавления нового блюда
  void addMenuItem({
    required String dish,
    required String date,
    required String notes,
  }) {
    final newItem = MenuItem(
      // Генерируем уникальный ID на основе времени
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dish: dish,
      date: date.isNotEmpty ? date : 'Дата не указана',
      notes: notes.isNotEmpty ? notes : 'Без заметок',
    );
    // Обновляем состояние, добавляя новый элемент в список
    state = [...state, newItem];
  }

  // Метод для переключения статуса "выполнено"
  void toggleCompleted(String itemId) {
    state = [
      for (final item in state)
        if (item.id == itemId)
          item.copyWith(isCompleted: !item.isCompleted)
        else
          item,
    ];
  }

  // Метод для удаления блюда
  void deleteMenuItem(String itemId) {
    state = state.where((item) => item.id != itemId).toList();
  }
}
