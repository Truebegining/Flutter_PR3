import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/counter_provider.dart';

class CookingCounter extends ConsumerWidget {
  const CookingCounter({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookingCount = ref.watch(counterProvider);

    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.withOpacity(0.1),
              Colors.orange.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Text(
              'Счетчик приготовленных блюд',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$cookingCount',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    // 6. Вызываем метод decrement из провайдера
                    ref.read(counterProvider.notifier).decrement();
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                FloatingActionButton.small(
                  onPressed: () {
                    // 7. Вызываем метод increment из провайдера
                    ref.read(counterProvider.notifier).increment();
                  },
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
