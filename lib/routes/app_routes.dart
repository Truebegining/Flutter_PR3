import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/recipes_screen.dart';
import '../screens/ingredients_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/about_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String recipes = '/recipes';
  static const String ingredients = '/ingredients';
  static const String menu = '/menu';
  static const String about = '/about';

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
        ],
      ),
    ],
  );

  static void initialize() {
  }
}
