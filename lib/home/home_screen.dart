import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:paranoma_study/services/coordinate_converter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
        text != null
            ? Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

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
        hotspots: [
          Hotspot(
            longitude: CoordinateConverter.toLongitude(0, 0),
            latitude: CoordinateConverter.toLatitude(
              0,
              ImageSizeGetter.getSize(
                FileInput(
                  File("assets/panorama_0.jpg"),
                ),
              ).width.toDouble(),
            ),
            // longitude: 0,
            // latitude: 0,
            height: 40,
            width: 40,
            widget: hotspotButton(icon: Icons.arrow_upward, onPressed: () {}),
          ),
        ],
        child: Image.asset('assets/panorama_0.jpg'),
      )),
    );
  }
}
