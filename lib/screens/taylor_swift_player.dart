// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class TaylorSwiftPlayerScreen extends StatefulWidget {
//   @override
//   _TaylorSwiftPlayerScreenState createState() =>
//       _TaylorSwiftPlayerScreenState();
// }

// class _TaylorSwiftPlayerScreenState extends State<TaylorSwiftPlayerScreen> {
//   final List<String> taylorSwiftSongs = [
//     'BlankSpace','lovestory','ShakeItOff','YouBelongWithMe',
    
//   ];

//   int _currentIndex = -1;
//   final AudioPlayer audioPlayer = AudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Taylor Swift Songs'),
//       ),
//       body: ListView.builder(
//         itemCount: taylorSwiftSongs.length,
//         itemBuilder: (context, index) {
//           final song = taylorSwiftSongs[index];
//           return ListTile(
//             title: Text(song),
//             leading: _buildLeadingIcon(index),
//             onTap: () {
//               _selectSong(index);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildLeadingIcon(int index) {
//     if (_currentIndex == index) {
//       return Icon(Icons.pause);
//     } else {
//       return Icon(Icons.play_arrow);
//     }
//   }

//   void _selectSong(int index) async {
//     if (_currentIndex == index) {
//       // If the same song is tapped again, pause or resume playback
//       if (audioPlayer.playing) {
//         audioPlayer.pause();
//       } else {
//         audioPlayer.play();
//       }
//     } else {
//       // Handle the selected song
//       setState(() {
//         _currentIndex = index;
//       });

//       // Load and play the selected song
//       String songPath = 'assets/audio/${taylorSwiftSongs[index]}.mp3';
//       await audioPlayer.setAsset(songPath);
//       audioPlayer.play();
//     }
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
// }



import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TaylorSwiftPlayerScreen extends StatefulWidget {
  @override
  _TaylorSwiftPlayerScreenState createState() =>
      _TaylorSwiftPlayerScreenState();
}

class _TaylorSwiftPlayerScreenState extends State<TaylorSwiftPlayerScreen> {
  final List<String> taylorSwiftSongs = [
    'BlankSpace', 'lovestory', 'ShakeItOff', 'YouBelongWithMe',
  ];

  int _currentIndex = -1;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taylor Swift Songs'),
      ),
      body: ListView.builder(
        itemCount: taylorSwiftSongs.length,
        itemBuilder: (context, index) {
          final song = taylorSwiftSongs[index];
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
    String songPath = 'assets/audio/${taylorSwiftSongs[index]}.mp3';
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
