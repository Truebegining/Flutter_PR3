import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_routes.dart';
import '../providers/auth_provider.dart';
import 'cooking_counter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Кулинарный дневник'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              // После выхода сработает редирект в AppRoutes
              // Но для надежности можно явно перейти
              context.go(AppRoutes.login);
            },
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (user != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Привет, ${user.username}!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
              () => context.push(AppRoutes.recipes),
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '🥕 Ингредиенты',
              'База продуктов и ингредиентов',
              () => context.push(AppRoutes.ingredients),
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '📋 Меню',
              'Планирование блюд и меню',
              () => context.push(AppRoutes.menu),
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '🛒 Список покупок',
              'Что нужно купить в магазине',
              () => context.push(AppRoutes.shoppingList),
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              '📝 Заметки',
              'Ваши кулинарные идеи и заметки',
              () => context.push(AppRoutes.notes),
            ),
            const SizedBox(height: 12),
            _buildMenuButton(
              context,
              'ℹ️ О приложении',
              'Информация о приложении',
              () => context.push(AppRoutes.about),
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
