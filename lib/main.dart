

import "package:geolocator/geolocator.dart";

import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Locator(),
    );
  }
}

class Locator extends StatefulWidget {
  const Locator({Key? key}) : super(key: key);

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  findlocation() async {
   
    
          
    LocationPermission askd = await Geolocator.requestPermission();
    
    
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print(currentPosition.longitude);
      print(currentPosition.latitude);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geo-Locator"),
      ),
      body: SafeArea(
          child: Center(
        child: InkWell(
          child: Container(
            height: 50,
            width: 120,
            child: Text(
              'Find your location',
              style:
                  TextStyle(color: Color.fromARGB(179, 16, 0, 0),
                   fontSize: 20),
            ),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 212, 204, 204)),
          ),
          onTap: () {
            findlocation();
          },
        ),
      )),
    );
  }
}
