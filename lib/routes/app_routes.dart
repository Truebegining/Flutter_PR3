import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/recipes_screen.dart';
import '../screens/ingredients_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/about_screen.dart';
import '../screens/shopping_list_screen.dart'; // 1. Импортировали новый экран

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String recipes = '/recipes';
  static const String ingredients = '/ingredients';
  static const String menu = '/menu';
  static const String about = '/about';
  static const String shoppingList = '/shopping-list'; // 2. Добавили константу маршрута

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
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
            path: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return const AboutScreen();
            },
          ),
          // 3. Добавили новый маршрут
          GoRoute(
            path: 'shopping-list',
            builder: (BuildContext context, GoRouterState state) {
              return const ShoppingListScreen();
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
