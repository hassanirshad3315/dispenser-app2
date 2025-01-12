import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  final List<Map<String, String>> products = const [
    {"name": "Dispenser Cooler", "image": "assets/cooler.png"},
    {"name": "Compressor", "image": "assets/compressor.png"},
    {"name": "Fan Motor", "image": "assets/fan_motor.png"},
    {"name": "Water Tank", "image": "assets/water_tank.png"},
    {"name": "Filter", "image": "assets/filter.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coolers & Spare Parts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      products[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      products[index]['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
