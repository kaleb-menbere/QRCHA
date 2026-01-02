import 'package:flutter/material.dart';

class QrchaScreen extends StatelessWidget {
  const QrchaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample featured products
    final featured = [
      {'name': 'Premium Beef', 'price': '400 ETB', 'image': 'https://via.placeholder.com/150'},
      {'name': 'Free-range Chicken', 'price': '180 ETB', 'image': 'https://via.placeholder.com/150'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Qrcha')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: featured.length,
        itemBuilder: (context, index) {
          final item = featured[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(item['image']!, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
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
