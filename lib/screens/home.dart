import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/widgets/error.dart';
import 'package:weather_app/widgets/weather_information.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Weather? currentWeather;
  String street = "";
  String currentStatus = "";
  bool loading = true;
  bool error = false;
  String errorMsg = "";

  void handleRequest() async {
    final loc = LocationService();

    setState(() {
      loading = true;
      error = false;
      currentStatus = "Getting your current location";
    });

    loc.requestPermission().then((accepted) {
      if (accepted) {
        setState(() {
          currentStatus = "Getting weather data in your location";
        });

        loc.getLocation().then((value) async {
          // ignore: no_leading_underscores_for_local_identifiers
          var _street = await loc.getLocationLocality(
              lat: value.latitude, lon: value.longitude);
          var url = Uri.https(
            "api.openweathermap.org",
            "data/2.5/weather",
            {
              "lat": value.latitude.toString(),
              "lon": value.longitude.toString(),
              "appid": dotenv.env['OPEN_WEATHER_KEY'],
              "units": "metric"
            },
          );
          http.post(
            url,
            headers: {
              "contentType": "application/json",
            },
          ).then((value) {
            final responseBody = json.decode(value.body);

            final Weather weather = Weather.fromJson(responseBody);

            setState(() {
              currentWeather = weather;
              street = _street;
              loading = false;
            });
          }).catchError((e) {
            setState(() {
              loading = false;
              errorMsg = "Request Error";
              error = true;
            });
          });
        });
      } else {
        setState(() {
          loading = false;
          errorMsg = "oh no it seems like you don't want to use my application";
          error = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    handleRequest();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(
            currentStatus,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    if (!error && !loading && currentWeather != null) {
      setState(() {
        body =
            WeatherInformation(currentWeather: currentWeather!, street: street);
      });
    }

    if (error) {
      setState(() {
        body = ErrorComponent(
          errorMsg: errorMsg,
          handlePress: handleRequest,
          buttonContent: "Retry",
        );
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 39, 39),
      body: body,
    );
  }
}
