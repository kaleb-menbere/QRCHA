import 'package:flutter/material.dart';
import '../widgets/cards.dart';
import 'detail_screen.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animals = [
      {
        'name': 'Bull',
        'price': '500 ETB',
        'image': 'assets/bull.png',
      },
      {
        'name': 'Goat',
        'price': '350 ETB',
        'image': 'assets/goat.png',
      },
      {
        'name': 'Hen',
        'price': '120 ETB',
        'image': 'assets/hen.png',
      },
      {
        'name': 'Sheep',
        'price': '300 ETB',
        'image': 'assets/sheep.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: const Text(
          'Animals for Sale',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.1,
          ),
        ),
        elevation: 2,
      ),

      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: animals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
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
      ),
    );
  }
}
