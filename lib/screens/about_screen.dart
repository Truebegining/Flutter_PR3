import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_routes.dart';

// 1. Заменили StatefulWidget на StatelessWidget, так как у экрана нет состояния
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // 2. Метод навигации теперь просто метод класса, а не класса State
  void _goToHomeWithReplacement(BuildContext context) {
    context.go(
      AppRoutes.home,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              '🍳 Кулинарный дневник',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Версия 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'О приложении',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Это простое приложение для изучения Flutter, которое поможет вам:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Сохранять и просматривать рецепты\n'
                      '• Управлять базой ингредиентов\n'
                      '• Планировать меню на неделю\n'
                      '• Отслеживать приготовленные блюда\n'
                      '• Ведение кулинарного дневника',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Разработчик',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Гаджиев Самир Надирович\n'
                      'Группа: ИКБО-11-22\n'
                      'Студенческий билет: 22И0571.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              color: Colors.orange.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Горизонтальная навигация',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Кнопка ниже демонстрирует горизонтальную навигацию:\n'
                      '• Использует pushReplacement вместо push\n'
                      '• Заменяет текущий экран новым\n'
                      '• Не сохраняет текущую страницу в истории\n'
                      '• Невозможно вернуться к "О приложении" через кнопку "назад"',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        // 3. Передали context в метод навигации
                        onPressed: () => _goToHomeWithReplacement(context),
                        icon: const Icon(Icons.home),
                        label: const Text('Вернуться на главную (замена экрана)'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
