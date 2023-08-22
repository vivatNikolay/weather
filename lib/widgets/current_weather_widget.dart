import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context).currentWeather;
    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.02,
      runSpacing: MediaQuery.of(context).size.width * 0.02,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        weather != null
            ? Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Colors.white),
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${weather?.temp ?? ' '}°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            Text(weather?.description.toString() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ],
    );
  }
}
