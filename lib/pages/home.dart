import 'package:flutter/material.dart';
import 'package:weather/widgets/city_button.dart';
import 'package:weather/widgets/current_weather_widget.dart';

import '../widgets/every_day_weather.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/mountain.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CityButton(),
              SizedBox(height: 10),
              CurrentWeatherWidget(),
              SizedBox(height: 10),
              EveryDayWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
