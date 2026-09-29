import 'package:flutter/material.dart';
import '../data/animals_data.dart';
import '../pages/animal_detail_page.dart';
import '../widgets/animal_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final int crossAxisCount = constraints.maxWidth >= 600 ? 3 : 2;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: dummyAnimals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) {
              final animal = dummyAnimals[index];
              return AnimalCard(
                animal: animal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimalDetailPage(animal: animal),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
