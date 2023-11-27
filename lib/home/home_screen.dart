import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:paranoma_study/services/coordinate_converter.dart';

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
          //animSpeed: 1.0,
          // sensorControl: SensorControl.orientation,
          hotspots: [
            Hotspot(
              longitude: CoordinateConverter.toLongitude(2175, -1041, -4368),
              latitude: CoordinateConverter.toLatitude(2175, -1041, -4368),
              height: 40,
              width: 40,
              widget: IconButton(
                onPressed: () async {},
                icon: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
          ],
          child: Image.asset('assets/a1.jpg'),
        ),
      ),
    );
  }
}
