import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_routes.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  // Навигационный делегат доступен через контекст приложения в любом месте
  // Метод context.pop() автоматически вызывается кнопкой "назад" в AppBar
  // Он удаляет текущую страницу из стека навигации и возвращает к предыдущей
  // Можно также использовать context.pop() программно для возврата
  
  // Вертикальная навигация: context.push() добавляет маршрут в стек навигации
  // Вместо передачи MaterialPageRoute мы передаем маршрут из маршрутной карты
  // Предыдущая страница сохраняется в памяти и доступна для возврата

  // Горизонтальная навигация: context.go() заменяет текущий маршрут
  // В отличие от context.push, который добавляет в стек, go заменяет текущий маршрут
  // Пользователь не сможет вернуться к предыдущей странице через кнопку "назад"
  // В качестве аргумента передается маршрут из маршрутной карты, а не страница
  void _goToHomeWithReplacement() {
    // Доступ к навигационному делегату через контекст
    // Метод pushReplacement теперь принимает маршрут, а не страницу
    context.go(
      // Использование маршрута из маршрутной карты вместо создания MaterialPageRoute
      AppRoutes.home,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
        centerTitle: true,
        // Кнопка "назад" в AppBar автоматически вызывает навигационный делегат через контекст
        // Используется context.pop() вместо Navigator.pop(context)
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
            // Пример горизонтальной навигации с использованием pushReplacement
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
                        onPressed: _goToHomeWithReplacement,
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
