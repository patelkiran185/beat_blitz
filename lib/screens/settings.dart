import 'package:flutter/material.dart';
import 'package:beat_blitz/utils/bottomNavigator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedTheme = 0;
  bool _highQualityAudio = true;
  bool _crossfadeEnabled = false;
  bool _offlineMode = false;
  bool _swipeToSkip = true;
  bool _shakeToShuffle = false;
  bool _notificationsEnabled = true;
  bool _pushNotificationsEnabled = true;
  bool _downloadQualityHigh = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
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
      backgroundColor: Colors.blueGrey[900],
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0,
        onTabTapped: (index) {
          _handleBottomNavBarTap(context, index);
        },
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Theme', Icons.color_lens),
                  const SizedBox(height: 8.0),
                  _buildThemeOptions(),
                  const Divider(height: 24.0),
                  _buildSectionTitle('Playback Settings', Icons.music_note),
                  const SizedBox(height: 8.0),
                  _buildSwitchListTile(
                    'High Quality Audio',
                    _highQualityAudio,
                    (value) {
                      setState(() {
                        _highQualityAudio = value;
                      });
                    },
                  ),
                  _buildSwitchListTile('Crossfade', _crossfadeEnabled, (value) {
                    setState(() {
                      _crossfadeEnabled = value;
                    });
                  }),
                  _buildSwitchListTile('Offline Mode', _offlineMode, (value) {
                    setState(() {
                      _offlineMode = value;
                    });
                  }),
                  _buildSwitchListTile('Swipe to Skip', _swipeToSkip, (value) {
                    setState(() {
                      _swipeToSkip = value;
                    });
                  }),
                  _buildSwitchListTile(
                    'Shake to Shuffle',
                    _shakeToShuffle,
                    (value) {
                      setState(() {
                        _shakeToShuffle = value;
                      });
                    },
                  ),
                  const Divider(height: 24.0),
                  _buildSectionTitle('Notifications', Icons.notifications),
                  const SizedBox(height: 8.0),
                  _buildSwitchListTile(
                    'Enable Notifications',
                    _notificationsEnabled,
                    (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Enable Push Notifications',
                    _pushNotificationsEnabled,
                    (value) {
                      setState(() {
                        _pushNotificationsEnabled = value;
                      });
                    },
                  ),
                  const Divider(height: 24.0),
                  _buildSectionTitle('Downloads', Icons.file_download),
                  const SizedBox(height: 8.0),
                  _buildSwitchListTile(
                    'High Quality Downloads',
                    _downloadQualityHigh,
                    (value) {
                      setState(() {
                        _downloadQualityHigh = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  Widget _buildSwitchListTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.white,
      inactiveTrackColor: Colors.grey,
    );
  }

  Widget _buildThemeOptions() {
    return Column(
      children: [
        _buildThemeOption(0, 'Dark Theme', Icons.dark_mode),
        _buildThemeOption(1, 'Colorful Theme', Icons.palette),
      ],
    );
  }

  Widget _buildThemeOption(int index, String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: Radio(
        value: index,
        groupValue: _selectedTheme,
        onChanged: (int? value) {
          setState(() {
            _selectedTheme = value!;
          });
        },
        activeColor: Colors.white,
      ),
      onTap: () {
        setState(() {
          _selectedTheme = index;
        });
      },
      trailing: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 8.0),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
