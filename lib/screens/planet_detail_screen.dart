import 'package:flutter/material.dart';
import '../models/planet.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(planet.imagePath),
            SizedBox(height: 16),
            Text(
              'خصائص الكوكب',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('التصنيف: ${planet.otherCharacteristics['التصنيف']}'),
            Text('القطر: ${planet.otherCharacteristics['القطر']}'),
            Text('مدة الدورة المدارية: ${planet.otherCharacteristics['مدة الدورة المدارية']}'),
            Text('المسافة من الشمس: ${planet.otherCharacteristics['المسافة من الشمس']}'),
          ],
        ),
      ),
    );
  }
}
