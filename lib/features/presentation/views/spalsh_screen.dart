import 'package:burevi2/core/constatnts/constants.dart';
import 'package:burevi2/features/presentation/views/current_weather_view/current_weather_view.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool haveData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocationData();
    Future.delayed(const Duration(seconds: 3)).then((val) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const CurrentWeatherView(),
          ),
          (route) => false);
    });
  }

  Future<void> getCurrentLocationData() async {
    Position position = await _determinePosition();
    await getAddressFromLatLong(position);
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(
        position.latitude.toDouble(), position.longitude.toDouble());
    Placemark place = placeMark[0];

    print(position.latitude);
    print(position.longitude);

    AppConstant.lat = position.latitude.toDouble();
    AppConstant.lon = position.longitude.toDouble();
    AppConstant.country = place.country!;
    AppConstant.locality = place.locality!;
    if (position.latitude != null && position.longitude != null) {
      setState(() {
        haveData = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
