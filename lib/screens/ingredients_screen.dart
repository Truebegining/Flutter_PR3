import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ingredients_provider.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = ref.watch(ingredientsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ингредиенты'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: ingredient.isFavorite
                ? Colors.orange.withOpacity(0.1)
                : null,
            child: ListTile(
              leading: Text(
                ingredient.icon,
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(
                ingredient.name,
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
                    ingredient.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ingredient.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  ingredient.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: ingredient.isFavorite
                      ? Colors.red
                      : Colors.grey,
                ),
                // 4. Вызываем метод из провайдера для изменения состояния
                onPressed: () => ref
                    .read(ingredientsProvider.notifier)
                    .toggleFavorite(ingredient.id),
              ),
              onTap: () => ref
                  .read(ingredientsProvider.notifier)
                  .toggleFavorite(ingredient.id),
            ),
          );
        },
      ),
    );
  }
}
