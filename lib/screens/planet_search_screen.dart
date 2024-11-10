import 'package:flutter/material.dart';
import 'package:frontend/models/planet.dart'; // Import the planet model

import '../models/planets_data.dart'; // Import the planets data

class PlanetSearchScreen extends StatefulWidget {
  @override
  _PlanetSearchScreenState createState() => _PlanetSearchScreenState();
}

class _PlanetSearchScreenState extends State<PlanetSearchScreen> {
  // TextEditingController for the search bar
  final TextEditingController _controller = TextEditingController();
  List<Planet> _filteredPlanets = planets; // Initial list of all planets

  // Function to filter planets based on the search query
  void _searchPlanet(String query) {
    final List<Planet> filtered = planets
        .where((planet) =>
    planet.name.contains(query) || planet.description.contains(query))
        .toList();
    setState(() {
      _filteredPlanets = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بحث عن الكواكب'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _searchPlanet,
              decoration: InputDecoration(
                labelText: 'ابحث عن كوكب',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPlanets.length,
                itemBuilder: (context, index) {
                  final planet = _filteredPlanets[index];
                  return Card(
                    child: ListTile(
                      title: Text(planet.name),
                      subtitle: Text(planet.description),
                      onTap: () {
                        // Show the planet details (image and characteristics)
                        _showPlanetDetails(context, planet);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPlanetDetails(BuildContext context, Planet planet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(planet.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(planet.imagePath), // Show planet image (GIF)
            SizedBox(height: 10),
            Text(
              planet.description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('إغلاق'),
          ),
        ],
      ),
    );
  }
}
