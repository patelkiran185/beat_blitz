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
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildAlbumCard('Taylor Swift', 'assets/taylor_swift.jpg',
                        context, TaylorSwiftPlayerScreen()),
                    _buildAlbumCard('Arijit Singh', 'assets/arijit_singh.jpg',
                        context, ArijitSinghPlayerScreen()),
                    _buildAlbumCard('Sid Sriram', 'assets/sid_sriram.jpg',
                        context, SidSriramPlayerScreen()),
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _buildArtistCard(
                    'Artist $index', 
                    'assets/artists/artist$index.jpeg',
                    context,
                    Container(), 
                  );
                },
                itemCount: 6, 
              ),
              const SizedBox(height: 32),
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
      String title, String imagePath, BuildContext context, Widget playerScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => playerScreen,
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(
      String title, String imagePath, BuildContext context, Widget playerScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => playerScreen,
          ),
        );
      },
      child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 160,
                height: 160,
                fit: BoxFit.cover,
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
