import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/city.dart';
import '../pages/custom_search_delegate.dart';
import '../providers/weather_provider.dart';

class CityButton extends StatelessWidget {
  const CityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCity = Provider.of<WeatherProvider>(context).selectedCity;
    return OutlinedButton.icon(
      onPressed: () async {
        City newCity = await showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
        if (newCity != selectedCity) {
          Provider.of<WeatherProvider>(context, listen: false).changeCity(newCity);
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        side: const BorderSide(color: Colors.deepOrange),
        minimumSize: const Size(130, 60),
        elevation: 3,
        textStyle: const TextStyle(fontSize: 20),
      ),
      label: Text(selectedCity.name),
      icon: const Icon(
        Icons.location_on,
        size: 28,
      ),
    );
  }
}
