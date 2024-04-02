import 'package:flutter/material.dart';

import 'package:beat_blitz/utils/bottomNavigator.dart';
class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace 'Song Name' with the actual song name
    String songName = 'Song Name';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Now Playing', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0, 
        onTabTapped: (index) {
          _handleBottomNavBarTap(context, index);
        },
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/Pink Music Player Instagram Story.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Song name at the center
              Text(
                songName,
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 58.0), // Adjust spacing

          

              // Playback controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous, color: Colors.white, size: 36.0),
                    onPressed: () {
                      // Handle previous song
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 36.0),
                    onPressed: () {
                      // Handle play/pause
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next, color: Colors.white, size: 36.0),
                    onPressed: () {
                      // Handle next song
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _handleBottomNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Handle Home tab
        Navigator.pushNamed(context, '/playlist');
        break;
      case 1:
        // Handle My Library tab
        Navigator.pushNamed(context, '/my_library');
        break;
      case 2:
        // Handle Play tab
        Navigator.pushNamed(context, '/play');
        break;
      case 3:
        // Handle Settings tab
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }
}
