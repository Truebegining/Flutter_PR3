import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredients_provider.g.dart';

@immutable
class Ingredient {
  const Ingredient({
    required this.id,
    required this.name,
    required this.category,
    required this.icon,
    required this.description,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String category;
  final String icon;
  final String description;
  final bool isFavorite;

  Ingredient copyWith({
    String? id,
    String? name,
    String? category,
    String? icon,
    String? description,
    bool? isFavorite,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

@riverpod
class Ingredients extends _$Ingredients {
  @override
  List<Ingredient> build() {
    // Начальное состояние - тот самый "захардкоженный" список,
    // но теперь он находится в провайдере, а не в UI.
    return [
      const Ingredient(
        id: '1',
        name: 'Помидоры',
        category: 'Овощи',
        icon: '🍅',
        description: 'Свежие томаты для салатов и соусов',
      ),
      const Ingredient(
        id: '2',
        name: 'Лук',
        category: 'Овощи',
        icon: '🧅',
        description: 'Базовый ингредиент для большинства блюд',
      ),
      const Ingredient(
        id: '3',
        name: 'Мясо говядины',
        category: 'Мясо',
        icon: '🥩',
        description: 'Качественная говядина для основных блюд',
      ),
      const Ingredient(
        id: '4',
        name: 'Сыр моцарелла',
        category: 'Молочные',
        icon: '🧀',
        description: 'Итальянский сыр для пиццы и пасты',
      ),
      const Ingredient(
        id: '5',
        name: 'Рис',
        category: 'Крупы',
        icon: '🍚',
        description: 'Длиннозерный рис для азиатских блюд',
      ),
      const Ingredient(
        id: '6',
        name: 'Лосось',
        category: 'Рыба',
        icon: '🐟',
        description: 'Свежий лосось для суши и запекания',
      ),
    ];
  }

  // Метод для переключения статуса "избранное"
  void toggleFavorite(String ingredientId) {
    state = [
      for (final ingredient in state)
        if (ingredient.id == ingredientId)
          ingredient.copyWith(isFavorite: !ingredient.isFavorite)
        else
          ingredient,
    ];
  }
}
