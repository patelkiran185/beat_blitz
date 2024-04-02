import 'package:flutter/material.dart';
import 'package:beat_blitz/utils/bottomNavigator.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> songs = [
    'Raabta',
    'Lover',
    'Believer',
    'Ride it',
    'Tum Hi Ho',
    'Channa Mereya',
    'Agar Tum Saath Ho',
    'Phir Le Aya Dil',
    'Ae Dil Hai Mushkil',
    'Muskurane',
    'Kabira',
    'Ilahi',
    'Tera Yaar Hoon Main',
    'Pal',
    'Tujhe Kitna Chahne Lage',
    'Pachtaoge',
    'Dil Sambhal Ja Zara',
    'Ennodu Nee Irundhaal',
    'Thalli Pogathey',
    'Adiye',
    'Maruvaarthai Pesathey',
    'Inayae',
    'Vaseegara',
    'Kannamma',
    'High On Love',
    'Mazhai Kuruvi',
    'Nee Nenacha',
    'Thalli Pogathey (Reprise)',
    'Nee Nenacha (Reprise)',
    'Kannamma (Reprise)',
    'Inayae (Reprise)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('My Library', style: TextStyle(color: Color.fromARGB(255, 227, 233, 236))),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0,
        onTabTapped: (index) {
          _handleBottomNavBarTap(context, index);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey[900]!,
              Colors.blueGrey[700]!,
              Colors.blueGrey[500]!,
              Colors.blueGrey[300]!,
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return LibraryTile(
              song: songs[index],
              onTap: () {
                // Handle song tap here
              },
            );
          },
        ),
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

class LibraryTile extends StatelessWidget {
  final String song;
  final VoidCallback? onTap;

  const LibraryTile({
    Key? key,
    required this.song,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(song, style: TextStyle(color: Colors.white)),
          Spacer(), // Add space between song name and download icon
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () {
              // Handle download button tap
              // You can implement the download logic here
            },
          ),
        ],
      ),
      leading: const Icon(Icons.music_note, color: Colors.white),
      onTap: onTap,
    );
  }
}
