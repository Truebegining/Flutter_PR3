import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'shopping_list_provider.g.dart';

const _uuid = Uuid();

@immutable
class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    this.isBought = false,
  });

  final String id;
  final String name;
  final bool isBought;

  ShoppingItem copyWith({
    String? id,
    String? name,
    bool? isBought,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      isBought: isBought ?? this.isBought,
    );
  }
}

@riverpod
class ShoppingList extends _$ShoppingList {
  @override
  List<ShoppingItem> build() {
    return [];
  }

  void addItem(String name) {
    state = [
      ...state,
      ShoppingItem(id: _uuid.v4(), name: name),
    ];
  }

  void toggleItem(String itemId) {
    state = [
      for (final item in state)
        if (item.id == itemId)
          item.copyWith(isBought: !item.isBought)
        else
          item,
    ];
  }

  void deleteItem(String itemId) {
    state = state.where((item) => item.id != itemId).toList();
  }
}
