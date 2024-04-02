

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class  ArijitSinghPlayerScreen extends StatefulWidget {
  @override
  _ArijitSinghScreenState createState() =>
      _ArijitSinghScreenState();
}

class _ArijitSinghScreenState extends State<ArijitSinghPlayerScreen> {
  final List<String> ASsongs = [
    'Bekhayali','ChannaMereya','Dua Karo','Enna Sona','Hawayein','Ik Vaari Aa','Itni Si Baat Hain','Khairiyat','Main Tera Boyfriend','Nashe Si Chadh Gayi','Qaafirana','Roke Na Ruke Naina','Shayad','Soch Na Sake','Tera Fitoor','Tu Hi Yaar Mera','Tujhe Kitna Chahne Lage','Ve Maahi','Woh Din',
  ];

  int _currentIndex = -1;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arijit Singh Songs'),
      ),
      body: ListView.builder(
        itemCount: ASsongs.length,
        itemBuilder: (context, index) {
          final song = ASsongs[index];
          return ListTile(
            title: Text(song),
            leading: _buildLeadingIcon(index),
            onTap: () {
              _selectSong(index);
            },
          );
        },
      ),
    );
  }
Widget _buildLeadingIcon(int index) {
  if (_currentIndex == index) {
    if (audioPlayer.playing) {
      return IconButton(
        icon: Icon(Icons.pause),
        onPressed: () {
          _togglePlayback();
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () {
          _togglePlayback();
        },
      );
    }
  } else {
    return Icon(Icons.play_arrow);
  }
}

void _togglePlayback() {
  if (audioPlayer.playing) {
    audioPlayer.pause();
  } else {
    audioPlayer.play();
  }
}

void _selectSong(int index) async {
  if (_currentIndex == index) {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  } else {
    // Handle the selected song
    setState(() {
      _currentIndex = index;
    });

    // Load and play the selected song
    String songPath = 'assets/arijit_singh_songs/${ASsongs[index]}.mp3';
    await audioPlayer.setAsset(songPath);
    audioPlayer.play();
  }
}


  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
