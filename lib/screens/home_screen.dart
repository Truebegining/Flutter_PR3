import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'recipes_screen.dart';
import 'ingredients_screen.dart';
import 'menu_screen.dart';
import 'about_screen.dart';
import 'cooking_counter.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кулинарный дневник'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const CookingCounter(),
            const SizedBox(height: 30),
            const Text(
              'Выберите раздел:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildMenuButton(
              context,
              '🍳 Рецепты',
              'Коллекция ваших любимых рецептов',
              () {
                context.push(
                  AppRoutes.recipes,
                );
              },
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '🥕 Ингредиенты',
              'База продуктов и ингредиентов',
              () {
                context.push(AppRoutes.ingredients);
              },
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '📋 Меню',
              'Планирование блюд и меню',
              () {
                context.push(AppRoutes.menu);
              },
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              'ℹ️ О приложении',
              'Информация о приложении',
              () {
                context.push(AppRoutes.about);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
