import 'package:flutter/material.dart';
import '../widgets/cards.dart';
import 'detail_screen.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animals = [
      {'name': 'Bull', 'price': '500 ETB', 'image': 'assets/bull.png'},
      {'name': 'Goat', 'price': '350 ETB', 'image': 'assets/goat.png'},
      {'name': 'Hen', 'price': '120 ETB', 'image': 'assets/hen.png'},
      {'name': 'Pig', 'price': '400 ETB', 'image': 'assets/pig.png'},
      {'name': 'Sheep', 'price': '300 ETB', 'image': 'assets/sheep.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: const Text('Animals for Sale'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: animals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Cards(
            name: animal['name']!,
            price: animal['price']!,
            imagePath: animal['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(
                    name: animal['name']!,
                    price: animal['price']!,
                    imagePath: animal['image']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
