import 'package:flutter/material.dart';
import 'planet_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'النّظام الشمسي',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  'النّظام الشمسي',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            _buildDrawerItem(context, Icons.search, 'بحث عن الكواكب', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanetListScreen(showGif: true)),
              );
            }),
            _buildDrawerItem(context, Icons.explore, 'استكشاف الكواكب', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanetListScreen(showGif: false)),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: TextStyle(fontSize: 18)),
      onTap: () => onTap(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'أهلاً بك في تطبيق النظام الشمسي',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10.0, color: Colors.black.withOpacity(0.7), offset: Offset(2.0, 2.0))],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildExploreButton(context, 'بحث عن الكواكب', true),
              SizedBox(height: 20),
              _buildExploreButton(context, 'استكشاف الكواكب', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreButton(BuildContext context, String title, bool showGif) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlanetListScreen(showGif: showGif)),
          );
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.deepPurpleAccent),
      ),
    );
  }
}
