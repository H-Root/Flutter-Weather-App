import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/single_horizontal_child.dart';
import 'package:weather_icons/weather_icons.dart';

class HorizontalScrollable extends StatelessWidget {
  const HorizontalScrollable({
    super.key,
    required this.temperatures,
    required this.windState,
  });

  final Temperatures temperatures;
  final WindState windState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HorizontalChild(
            data: "${temperatures.temp!.ceil().toString()}°",
            icon: Icons.thermostat,
          ),
          HorizontalChild(
            data: "${windState.speed.toString()}m/s",
            icon: Icons.wind_power,
          ),
          HorizontalChild(
            data: "${windState.gust.toString()}m/s",
            icon: Icons.storm,
          ),
          HorizontalChild(
            data: "${temperatures.pressure.toString()} hPa",
            icon: WeatherIcons.barometer,
          ),
          HorizontalChild(
            data: "${temperatures.humidity.toString()}%",
            icon: WeatherIcons.humidity,
          ),
        ],
      ),
    );
  }
}
