import 'package:flutter/material.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final List<Map<String, dynamic>> _ingredients = [
    {
      'name': 'Помидоры',
      'category': 'Овощи',
      'icon': '🍅',
      'description': 'Свежие томаты для салатов и соусов',
      'isFavorite': false,
    },
    {
      'name': 'Лук',
      'category': 'Овощи',
      'icon': '🧅',
      'description': 'Базовый ингредиент для большинства блюд',
      'isFavorite': false,
    },
    {
      'name': 'Мясо говядины',
      'category': 'Мясо',
      'icon': '🥩',
      'description': 'Качественная говядина для основных блюд',
      'isFavorite': false,
    },
    {
      'name': 'Сыр моцарелла',
      'category': 'Молочные',
      'icon': '🧀',
      'description': 'Итальянский сыр для пиццы и пасты',
      'isFavorite': false,
    },
    {
      'name': 'Рис',
      'category': 'Крупы',
      'icon': '🍚',
      'description': 'Длиннозерный рис для азиатских блюд',
      'isFavorite': false,
    },
    {
      'name': 'Лосось',
      'category': 'Рыба',
      'icon': '🐟',
      'description': 'Свежий лосось для суши и запекания',
      'isFavorite': false,
    },
  ];

  void _toggleFavorite(int index) {
    setState(() {
      _ingredients[index]['isFavorite'] = !_ingredients[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ингредиенты'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = _ingredients[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: ingredient['isFavorite'] 
                ? Colors.orange.withOpacity(0.1)
                : null,
            child: ListTile(
              leading: Text(
                ingredient['icon'],
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(
                ingredient['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    ingredient['category'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ingredient['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  ingredient['isFavorite'] 
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: ingredient['isFavorite'] 
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: () => _toggleFavorite(index),
              ),
              onTap: () => _toggleFavorite(index),
            ),
          );
        },
      ),
    );
  }
}
