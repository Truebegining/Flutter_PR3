import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_provider.g.dart';

@immutable
class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.icon,
    required this.description,
    this.isCooked = false,
  });

  final String id;
  final String name;
  final String category;
  final String icon;
  final String description;
  final bool isCooked;

  Recipe copyWith({
    String? id,
    String? name,
    String? category,
    String? icon,
    String? description,
    bool? isCooked,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      isCooked: isCooked ?? this.isCooked,
    );
  }
}

@riverpod
class Recipes extends _$Recipes {
  @override
  List<Recipe> build() {
    // Начальное состояние - переносим статический список сюда
    return [
      const Recipe(
        id: '1',
        name: 'Борщ украинский',
        category: 'Супы',
        icon: '🍲',
        description: 'Традиционный украинский борщ с мясом и овощами',
      ),
      const Recipe(
        id: '2',
        name: 'Пицца Маргарита',
        category: 'Итальянская',
        icon: '🍕',
        description: 'Классическая итальянская пицца с томатами и моцареллой',
      ),
      const Recipe(
        id: '3',
        name: 'Суши роллы',
        category: 'Японская',
        icon: '🍣',
        description: 'Традиционные японские роллы с рисом и рыбой',
      ),
      const Recipe(
        id: '4',
        name: 'Паэлья',
        category: 'Испанская',
        icon: '🥘',
        description: 'Испанское блюдо из риса с морепродуктами',
      ),
      const Recipe(
        id: '5',
        name: 'Шницель',
        category: 'Немецкая',
        icon: '🥩',
        description: 'Венский шницель в панировке',
      ),
    ];
  }

  // Метод для переключения статуса "приготовлено"
  void toggleCooked(String recipeId) {
    state = [
      for (final recipe in state)
        if (recipe.id == recipeId)
          recipe.copyWith(isCooked: !recipe.isCooked)
        else
          recipe,
    ];
  }
}
