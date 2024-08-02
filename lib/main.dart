import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:safe_music/widgets/connection_tile.dart';
import 'package:safe_music/widgets/panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final PanelController controller;
  late ConnectionDetails selectedConnectionDetails = ConnectionDetails(
    clientType: 'Apple Music',
    clientColor: const Color(0xFFFB3E56),
  );

  @override
  void initState() {
    controller = PanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SlidingUpPanel(
          minHeight: 0,
          controller: controller,
          isDraggable: false,
          maxHeight: 400,
          backdropEnabled: true,
          color: Colors.transparent,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          panel: Panel(
            connectionDetails: selectedConnectionDetails,
            controller: controller,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(100),
                const Text(
                  'PurePlay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const Gap(180),
                Row(
                  children: [
                    ConnectionTile(
                      const Color(0xFFFB3E56),
                      'assets/images/appleMusicIcon.png',
                      'Apple Music',
                      connectToAppleMusic,
                    ),
                    ConnectionTile(
                      const Color(0xFF24C55E),
                      'assets/images/spotifyIcon.png',
                      'Spotify',
                      connectToSpotify,
                    ),
                  ],
                ),
                const Expanded(child: Gap(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  connectToAppleMusic() {
    setState(
      () => selectedConnectionDetails = ConnectionDetails.appleMusic(),
    );
    controller.open();
  }

  connectToSpotify() {
    setState(
      () => selectedConnectionDetails = ConnectionDetails.spotify(),
    );
    controller.open();
  }
}

class ConnectionDetails {
  final String clientType;
  final Color clientColor;

  ConnectionDetails({required this.clientType, required this.clientColor});

  ConnectionDetails.appleMusic()
      : clientType = 'Apple Music',
        clientColor = const Color(0xFFFB3E56);

  ConnectionDetails.spotify()
      : clientType = 'Spotify',
        clientColor = const Color(0xFF24C55E);
}
