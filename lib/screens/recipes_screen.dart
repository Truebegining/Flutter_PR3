import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/recipes_provider.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепты'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: recipe.isCooked
                ? Colors.green.withOpacity(0.1)
                : null,
            child: ListTile(
              leading: Text(
                recipe.icon,
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(
                recipe.name,
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
                    'Категория: ${recipe.category}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              trailing: Checkbox(
                value: recipe.isCooked,
                // 4. Вызываем метод из провайдера для изменения состояния
                onChanged: (_) => ref.read(recipesProvider.notifier).toggleCooked(recipe.id),
                activeColor: Colors.green,
              ),
              onTap: () => ref.read(recipesProvider.notifier).toggleCooked(recipe.id),
            ),
          );
        },
      ),
    );
  }
}
