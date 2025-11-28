import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/menu_provider.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  final TextEditingController _dishController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();


  void _addMenuItem() {
    if (_dishController.text.isNotEmpty) {
      ref.read(menuItemsProvider.notifier).addMenuItem(
            dish: _dishController.text,
            date: _dateController.text,
            notes: _notesController.text,
          );
      _dishController.clear();
      _dateController.clear();
      _notesController.clear();
    }
  }

  void _goBack() {
    context.pop();
  }
  
  void _toggleCompleted(String itemId) {
      ref.read(menuItemsProvider.notifier).toggleCompleted(itemId);
  }

  void _deleteMenuItem(String itemId) {
      ref.read(menuItemsProvider.notifier).deleteMenuItem(itemId);
  }


  @override
  Widget build(BuildContext context) {
    final menuItems = ref.watch(menuItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Добавить блюдо в меню',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _dishController,
                      decoration: const InputDecoration(
                        labelText: 'Какое блюдо планируете?',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        labelText: 'Когда? (например: 15.10.2025)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Заметки (необязательно)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _addMenuItem,
                            child: const Text('Добавить в меню'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _goBack,
                            child: const Text('Назад'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // --- Список блюд теперь использует данные из провайдера ---
            Expanded(
              child: menuItems.isEmpty
                  ? Center(
                      child: Text(
                        'Пока нет блюд в меню\nДобавьте первое!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        // 6. Используем нашу модель MenuItem вместо Map
                        final menuItem = menuItems[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          color: menuItem.isCompleted
                              ? Colors.green.withOpacity(0.1)
                              : null,
                          child: ListTile(
                            leading: Checkbox(
                              value: menuItem.isCompleted,
                              onChanged: (_) => _toggleCompleted(menuItem.id),
                              activeColor: Colors.green,
                            ),
                            title: Text(
                              menuItem.dish,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: menuItem.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  menuItem.date,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                if (menuItem.notes != 'Без заметок') ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    menuItem.notes,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _deleteMenuItem(menuItem.id),
                            ),
                            onTap: () => _toggleCompleted(menuItem.id),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
