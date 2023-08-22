import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherProvider weatherProvider = WeatherProvider();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: weatherProvider,
          ),
        ],
        builder: (context, _) {
          precacheImage(const AssetImage('assets/mountain.png'), context);
          return MaterialApp(
            title: 'Weather',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
            ),
            home: const Home(),
          );
        },
      );
  }
}
