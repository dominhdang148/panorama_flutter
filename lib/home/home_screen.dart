import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panorama360 view on Flutter"),
      ),
      body: Center(
        child: PanoramaViewer(
          animSpeed: 1,
          hotspots: [
            Hotspot(
              latitude: 0,
              longitude: 0,
              name: "demo",
              widget: ElevatedButton(
                onPressed: () {
                  debugPrint("Hello");
                },
                child: const Text("Hello"),
              ),
            )
          ],
          animReverse: true,
          child: Image.asset('assets/panorama.jpg'),
        ),
      ),
    );
  }
}
