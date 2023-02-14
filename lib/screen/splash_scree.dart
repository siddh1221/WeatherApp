// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/screen/home_page.dart';
import 'package:weatherapp/screen/error_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? lat;
  String? lon;
  getLocation() async {
    try {
      bool isServiceEnabled;

      LocationPermission locationPermission;
      isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      locationPermission = await Geolocator.requestPermission();
      if (!isServiceEnabled) {
        print("Location not enabled");
      }
      // status of permission
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        print("Location Permission deniedForever");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ErrorPage(
                      errorMessage:
                          "Location Permission deniedForever go to setting and give permission after press refresh button",
                    )));
      } else if (locationPermission == LocationPermission.denied) {
        // request permission
        locationPermission;
        if (locationPermission == LocationPermission.denied) {
          print("Location Permission denied");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ErrorPage(
                        errorMessage: "Location Permission denied",
                      )));
        }
      } else if (locationPermission == LocationPermission.always ||
          locationPermission == LocationPermission.whileInUse) {
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .then((value) {
          lat = value.latitude.toString();
          lon = value.longitude.toString();
        }).then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        lat: lat ?? "",
                        lon: lon ?? "",
                        isLocationGrantd: true,
                      )));
        });
        print("Location Permission allowed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            "asset/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
