import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<Map<String, dynamic>> _shoppingItems = [];
  final TextEditingController _itemController = TextEditingController();

  // Метод для добавления нового пункта в список
  void _addItem() {
    if (_itemController.text.isNotEmpty) {
      setState(() {
        _shoppingItems.add({
          'name': _itemController.text,
          'isBought': false,
        });
      });
      _itemController.clear();
    }
  }

  // Метод для отметки пункта как купленного
  void _toggleItem(int index) {
    setState(() {
      _shoppingItems[index]['isBought'] = !_shoppingItems[index]['isBought'];
    });
  }

  // Метод для удаления пункта
  void _deleteItem(int index) {
    setState(() {
      _shoppingItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список покупок'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Поле для ввода нового пункта
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Что нужно купить?',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.orange, size: 30),
                  onPressed: _addItem,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Список пунктов
            Expanded(
              child: _shoppingItems.isEmpty
                  ? const Center(
                      child: Text('Список покупок пуст!', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    )
                  : ListView.builder(
                      itemCount: _shoppingItems.length,
                      itemBuilder: (context, index) {
                        final item = _shoppingItems[index];
                        return Card(
                          color: item['isBought'] ? Colors.grey[200] : null,
                          child: ListTile(
                            title: Text(
                              item['name'],
                              style: TextStyle(
                                decoration: item['isBought']
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            leading: Checkbox(
                              value: item['isBought'],
                              onChanged: (_) => _toggleItem(index),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteItem(index),
                            ),
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
