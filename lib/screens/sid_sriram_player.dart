import 'package:flutter/material.dart';

class SidSriramPlayerScreen extends StatefulWidget {
  @override
  _SidSriramPlayerScreenState createState() => _SidSriramPlayerScreenState();
}

class _SidSriramPlayerScreenState extends State<SidSriramPlayerScreen> {
  final List<String> sidSriramSongs = [
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
    'Inayae (Reprise)',
    
  ];

  int _currentIndex = -1; // Index of the currently selected song

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sid Sriram Songs'),
      ),
      body: ListView.builder(
        itemCount: sidSriramSongs.length,
        itemBuilder: (context, index) {
          final song = sidSriramSongs[index];
          return ListTile(
            title: Text(song),
            leading: _buildLeadingIcon(index),
            
          );
        },
      ),
    );
  }

  Widget _buildLeadingIcon(int index) {
    if (_currentIndex == index) {
      return Icon(Icons.pause);
    } else {
      return Icon(Icons.play_arrow);
    }
  }

  
}
