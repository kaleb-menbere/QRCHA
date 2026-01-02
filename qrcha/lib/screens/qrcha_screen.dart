import 'package:flutter/material.dart';
import '../widgets/cards.dart';
import 'animal_detail_screen.dart';

class QrchaScreen extends StatelessWidget {
  const QrchaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animals = [
      {'name': 'Bull', 'price': '500 ETB', 'image': 'assets/bull.png'},
      {'name': 'Goat', 'price': '350 ETB', 'image': 'assets/goat.png'},
      {'name': 'Hen', 'price': '120 ETB', 'image': 'assets/hen.png'},
      {'name': 'Pig', 'price': '400 ETB', 'image': 'assets/pig.png'},
      {'name': 'Sheep', 'price': '300 ETB', 'image': 'assets/sheep.png'},
      {'name': 'Bull 2', 'price': '520 ETB', 'image': 'assets/bull2.png'},
      {'name': 'Goat 2', 'price': '360 ETB', 'image': 'assets/goat2.png'},
    ];

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: const Text('Qrcha for Sale'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: animals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cards per row
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
                    builder: (_) => AnimalDetailScreen(
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
