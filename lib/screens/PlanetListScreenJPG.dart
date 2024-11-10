import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../models/planets_data.dart';

class PlanetListScreenJPG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الكواكب (JPG)')),
      body: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) {
          Planet planet = planets[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(planet.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(planet.imageJpgPath),  // Display JPG
                  ...planet.otherCharacteristics.entries.map((entry) => Text('${entry.key}: ${entry.value}')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
