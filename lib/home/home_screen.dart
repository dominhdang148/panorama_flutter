import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panorama view test"),
      ),
      body: Center(
          child: PanoramaViewer(
        animSpeed: 1.0,
        sensorControl: SensorControl.orientation,
        hotspots: const [],
        child: Image.asset('assets/panorama_0.jpg'),
      )),
    );
  }
}
