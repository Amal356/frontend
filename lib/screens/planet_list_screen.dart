import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../models/planets_data.dart';

class PlanetListScreen extends StatelessWidget {
  final bool showGif; // This parameter determines the image format

  PlanetListScreen({required this.showGif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الكواكب'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: planets.length,
          itemBuilder: (context, index) {
            final planet = planets[index];
            final imagePath = showGif ? planet.imageGifPath : planet.imageJpgPath; // Choose image format

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 25,
                ),
                title: Text(
                  planet.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            imagePath,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'خصائص الكوكب:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Divider(color: Colors.deepPurple),
                        ...planet.otherCharacteristics.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  '${entry.key}: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    entry.value,
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
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
