import 'package:burevi2/features/domain/entities/current_weather_entity/response_current_weather_entity.dart';
import 'package:burevi2/features/presentation/widgets/current_weather_view_widget/place_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'current_weather.dart';
import 'forecasting_card_view.dart';

class CurrentWeatherBody extends StatefulWidget {
  final ResponseCurrentWeatherEntity? responseCurrentWeatherEntity;

  const CurrentWeatherBody({Key? key, this.responseCurrentWeatherEntity})
      : super(key: key);

  @override
  State<CurrentWeatherBody> createState() => _CurrentWeatherBodyState();
}

class _CurrentWeatherBodyState extends State<CurrentWeatherBody> {
  String? country, locality;

  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  getCurrentLocationData() async {
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
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMark[0];
    setState(() {
      country = place.country;
      locality = place.locality;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: widget.responseCurrentWeatherEntity != null
            ? Column(
                children: [
                  PlaceName(
                    height: height,
                    country: country.toString(),
                    name: locality.toString(),
                  ),
                  CurrentWeather(
                    height: height,
                    weather: widget.responseCurrentWeatherEntity,
                  ),
                ],
              )
            : const Center(
                child: CupertinoActivityIndicator(
                radius: 35,
                animating: true,
                color: Colors.black,
              )),
      ),
    );
  }
}
