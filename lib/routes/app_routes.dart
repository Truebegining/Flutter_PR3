import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/home_screen.dart';
import '../screens/recipes_screen.dart';
import '../screens/ingredients_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/about_screen.dart';
import '../screens/shopping_list_screen.dart';
import '../screens/notes_screen.dart';
import '../screens/login_screen.dart';
import '../providers/auth_provider.dart';

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String login = '/login';
  static const String recipes = '/recipes';
  static const String ingredients = '/ingredients';
  static const String menu = '/menu';
  static const String about = '/about';
  static const String shoppingList = '/shopping-list';
  static const String notes = '/notes';

  // Создаем ProviderContainer для доступа к состоянию вне виджетов,
  // но лучше использовать ref в redirect, если GoRouter создается внутри Provider.
  // В данном случае мы используем простой подход с redirect.
  
  static final GoRouter router = GoRouter(
    initialLocation: login,
    redirect: (BuildContext context, GoRouterState state) {
      // Получаем доступ к провайдеру через context
      // В реальном приложении лучше передавать notifier в GoRouter
      final container = ProviderScope.containerOf(context, listen: false);
      final user = container.read(authProvider);
      
      final isLoggedIn = user != null;
      final isLoggingIn = state.matchedLocation == login;

      if (!isLoggedIn && !isLoggingIn) {
        return login;
      }
      
      if (isLoggedIn && isLoggingIn) {
        return home;
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'recipes',
            builder: (BuildContext context, GoRouterState state) {
              return const RecipesScreen();
            },
          ),
          GoRoute(
            path: 'ingredients',
            builder: (BuildContext context, GoRouterState state) {
              return const IngredientsScreen();
            },
          ),
          GoRoute(
            path: 'menu',
            builder: (BuildContext context, GoRouterState state) {
              return const MenuScreen();
            },
          ),
          GoRoute(
            path: 'shopping-list',
            builder: (BuildContext context, GoRouterState state) {
              return const ShoppingListScreen();
            },
          ),
          GoRoute(
            path: 'notes',
            builder: (BuildContext context, GoRouterState state) {
              return const NotesScreen();
            },
          ),
          GoRoute(
            path: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return const AboutScreen();
            },
          ),
        ],
      ),
    ],
  );

  static void initialize() {
    // This can be used for any setup if needed in the future.
  }
}
