
import 'package:flutter/material.dart';
import 'package:beat_blitz/screens/playlist.dart';

// import 'package:beat_blitz/screens/home.dart';
import 'package:beat_blitz/screens/my_library.dart'; 
import 'package:beat_blitz/screens/play.dart'; 
import 'package:beat_blitz/screens/settings.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beat Blitz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
      
        '/playlist': (context) =>  const PlaylistPage(), 
        '/my_library': (context) => LibraryPage(),
        '/play': (context) => PlayScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background_image.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Discover and Enjoy Music Like Never Before',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cursive',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 400),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlaylistPage()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 23, 19, 61),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
