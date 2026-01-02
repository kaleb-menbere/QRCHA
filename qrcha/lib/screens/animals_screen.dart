import 'package:flutter/material.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Temporary sample data
    final animals = [
      {'name': 'Beef', 'price': '200 ETB', 'image': 'https://via.placeholder.com/150'},
      {'name': 'Chicken', 'price': '120 ETB', 'image': 'https://via.placeholder.com/150'},
      {'name': 'Goat', 'price': '350 ETB', 'image': 'https://via.placeholder.com/150'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Animals')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(animal['image']!, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(animal['name']!),
              subtitle: Text(animal['price']!),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: Add to cart functionality
                },
                child: const Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
