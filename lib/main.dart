import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/app_routes.dart';

void main() {
  AppRoutes.initialize();
  runApp(const ProviderScope(child: CookingApp()));
}

class CookingApp extends ConsumerWidget {
  const CookingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Важный момент: чтобы редирект работал при изменении состояния авторизации,
    // нам нужно, чтобы маршрутизатор перестраивался или слушал изменения.
    // В текущей реализации GoRouter создан как статическое поле, что не идеально
    // для реактивности, но сработает при переходах. 
    // Для полноценной реактивности лучше перенести router в провайдер.
    
    return MaterialApp.router(
      title: 'Кулинарный дневник',
      routerConfig: AppRoutes.router,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
