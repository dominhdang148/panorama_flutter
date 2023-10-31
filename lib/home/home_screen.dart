import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  final int _panoId = 0;
  List<Image> panoList = [
    Image.asset('assets/panorama.jpg'),
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
