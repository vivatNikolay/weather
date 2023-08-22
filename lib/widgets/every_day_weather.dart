import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class EveryDayWeather extends StatelessWidget {
  const EveryDayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatDay = DateFormat('EEEE');
    final dailyWeather = Provider.of<WeatherProvider>(context).dailyWeather;
    double rectSize;
    if (MediaQuery.of(context).size.width > 900) {
      rectSize = 240;
    } else if (MediaQuery.of(context).size.width > 620) {
      rectSize = 180;
    } else {
      rectSize = 160;
    }
    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.02,
      runSpacing: MediaQuery.of(context).size.width * 0.02,
      children: List.generate(
        dailyWeather.length,
        (index) {
          final weather = dailyWeather[index];
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              height: rectSize,
              width: rectSize,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6CD3FF), Colors.black],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      '${weather.dayTemp}°C',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Text(
                      formatDay.format(DateTime.now().add(Duration(days: index))),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      '${weather.nightTemp}°C',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          height: rectSize * 0.5,
                          width: rectSize * 0.5,
                          fit: BoxFit.cover,
                          'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                        ),
                        MediaQuery.of(context).size.width > 900
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  weather.summary,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
