import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final List<Map<String, dynamic>> _recipes = [
    {
      'name': 'Борщ украинский',
      'category': 'Супы',
      'icon': '🍲',
      'description': 'Традиционный украинский борщ с мясом и овощами',
      'isCooked': false,
    },
    {
      'name': 'Пицца Маргарита',
      'category': 'Итальянская',
      'icon': '🍕',
      'description': 'Классическая итальянская пицца с томатами и моцареллой',
      'isCooked': false,
    },
    {
      'name': 'Суши роллы',
      'category': 'Японская',
      'icon': '🍣',
      'description': 'Традиционные японские роллы с рисом и рыбой',
      'isCooked': false,
    },
    {
      'name': 'Паэлья',
      'category': 'Испанская',
      'icon': '🥘',
      'description': 'Испанское блюдо из риса с морепродуктами',
      'isCooked': false,
    },
    {
      'name': 'Шницель',
      'category': 'Немецкая',
      'icon': '🥩',
      'description': 'Венский шницель в панировке',
      'isCooked': false,
    },
  ];

  void _toggleCooked(int index) {
    setState(() {
      _recipes[index]['isCooked'] = !_recipes[index]['isCooked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепты'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          final recipe = _recipes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: recipe['isCooked'] 
                ? Colors.green.withOpacity(0.1)
                : null,
            child: ListTile(
              leading: Text(
                recipe['icon'],
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(
                recipe['name'],
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
                    'Категория: ${recipe['category']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              trailing: Checkbox(
                value: recipe['isCooked'],
                onChanged: (_) => _toggleCooked(index),
                activeColor: Colors.green,
              ),
              onTap: () => _toggleCooked(index),
            ),
          );
        },
      ),
    );
  }
}
