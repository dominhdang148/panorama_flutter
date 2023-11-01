import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoList = [
    Image.asset('assets/panorama_0.jpg'),
    Image.asset('assets/panorama_1.jpg'),
    Image.asset('assets/panorama_2.jpg'),
  ];

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPresseed}) {
    return const Column();
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoList.length) {
      case 0:
        panorama = PanoramaViewer(
          animSpeed: .1,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              debugPrint('onTap: $longitude, $latitude, $tilt'),
          onLongPressStart: (longitude, latitude, tilt) =>
              debugPrint('onLongPressStart: $longitude, $latitude, $tilt'),
          onLongPressMoveUpdate: (longitude, latitude, tilt) =>
              debugPrint('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
          onLongPressEnd: (longitude, latitude, tilt) =>
              debugPrint('onLongPressEnd: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 90,
              height: 75,
              widget: hotspotButton(
                text: "Next scene",
                icon: Icons.open_in_browser,
                onPresseed: () => setState(() => _panoId++),
              ),
            ),
          ],
        );
        break;
      case 1:
        break;
      case 2:
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panorama 360 view Flutter"),
      ),
      body: Stack(
        children: [
          Text(
            '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}. ${_tilt.toStringAsFixed(3)}',
          )
        ],
      ),
    );
  }
}
