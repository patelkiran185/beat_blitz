import 'package:flutter/material.dart';
import 'package:beat_blitz/screens/arijit_singh_player.dart';
import 'package:beat_blitz/screens/sid_sriram_player.dart';
import 'package:beat_blitz/screens/taylor_swift_player.dart';
import 'package:beat_blitz/utils/bottomNavigator.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Music Lover',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[900]!,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0,
        onTabTapped: (index) {
          _handleBottomNavBarTap(context, index);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black87,
                Colors.blueGrey,
                Colors.grey[800]!,
                Colors.grey[900]!,
              ],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 1),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for songs, albums, artists...',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Albums',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle 'More' button press
                    },
                    child: const Text(
                      'More',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildAlbumCard('Taylor Swift', 'assets/taylor_swift.jpg',
                        context, TaylorSwiftPlayerScreen(),
                        textColor: Colors.black),
                    _buildAlbumCard('Arijit Singh', 'assets/arijit_singh.jpg',
                        context, ArijitSinghPlayerScreen(),
                        textColor: Colors.black),
                    _buildAlbumCard('Sid Sriram', 'assets/sid_sriram.jpg',
                        context, SidSriramPlayerScreen(),
                        textColor: Colors.black),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              const Text(
                'Artists',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 210,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildAlbumCard(
                      'Artist $index',
                      'assets/artists/artist$index.jpeg',
                      context,
                      Container(),
                      textColor: Colors.black,
                    );
                  },
                  itemCount: 6, // Adjust the number of dummy artists as needed
                ),
              ),

              const Text(
                'Songs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Add your song list widgets here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumCard(
      String title, String imagePath, BuildContext context, Widget playerScreen,
      {Color? textColor}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => playerScreen,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _handleBottomNavBarTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/playlist');
      break;
    case 1:
      Navigator.pushNamed(context, '/my_library');
      break;
    case 2:
      Navigator.pushNamed(context, '/play');
      break;
    case 3:
      Navigator.pushNamed(context, '/settings');
      break;
  }
}
