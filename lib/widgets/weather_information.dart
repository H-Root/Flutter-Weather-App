import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/horizontal_scrollable.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation(
      {super.key, required this.street, required this.currentWeather});

  final String street;
  final Weather currentWeather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Icon(Icons.location_pin, size: 30, color: Colors.white),
                Text(
                  street,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Lottie.asset("assets/${currentWeather.iconImage}.json"),
            const SizedBox(
              height: 10,
            ),
            Text(
              currentWeather.weather.main,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            HorizontalScrollable(
              temperatures: currentWeather.mainTemperatures,
              windState: currentWeather.wind,
            )
          ],
        ),
      ),
    );
  }
}
