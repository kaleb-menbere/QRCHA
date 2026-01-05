import 'package:flutter/material.dart';
import '../widgets/cards.dart';
import 'detail_screen.dart';

class QrchaScreen extends StatelessWidget {
  const QrchaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrhcaItems = [
      {'name': 'Bull', 'price': '500 ETB', 'image': 'assets/bull.png'},
      {'name': 'Goat', 'price': '350 ETB', 'image': 'assets/goat.png'},
      {'name': 'Hen', 'price': '120 ETB', 'image': 'assets/hen.png'},
      {'name': 'Sheep', 'price': '300 ETB', 'image': 'assets/sheep.png'},
      {'name': 'Bull 2', 'price': '520 ETB', 'image': 'assets/bull2.png'},
      {'name': 'Goat 2', 'price': '360 ETB', 'image': 'assets/goat2.png'},
    ];

    return Scaffold(
      appBar: AppBar(  
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: const Text(
          'Qrcha for Sale',
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
          itemCount: qrhcaItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = qrhcaItems[index];
            return Cards(
              name: item['name']!,
              price: item['price']!,
              imagePath: item['image']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      name: item['name']!,
                      price: item['price']!,
                      imagePath: item['image']!,
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
