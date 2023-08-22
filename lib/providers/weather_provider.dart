import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/current_weather.dart';
import '../models/daily_weather.dart';
import '../services/http_service.dart';

class WeatherProvider extends ChangeNotifier {
  final HttpService _httpService = HttpService();

  City _selectedCity = City(name: 'Minsk', lat: 53.9, lon: 27.5667);
  CurrentWeather? _currentWeather;
  List<DailyWeather> _dailyWeather = [];

  City get selectedCity => _selectedCity;
  CurrentWeather? get currentWeather => _currentWeather;
  List<DailyWeather> get dailyWeather => _dailyWeather;

  WeatherProvider() {
    initWeather();
  }

  Future<void> initWeather() async {
    Map<String, dynamic> weatherData = await _httpService.fetchWeather(_selectedCity.lat, _selectedCity.lon);
    _currentWeather = CurrentWeather.fromJson(weatherData['current']);
    _dailyWeather.clear();
    for (int i = 0; i < 3; i++) {
      _dailyWeather.add(DailyWeather.fromJson(weatherData['daily'][i]));
    }
    notifyListeners();
  }

  Future<void> changeCity(City newCity) async {
    Map<String, dynamic> weatherData = await _httpService.fetchWeather(newCity.lat, newCity.lon);
    _currentWeather = CurrentWeather.fromJson(weatherData['current']);
    _dailyWeather.clear();
    for (int i = 0; i < 3; i++) {
      _dailyWeather.add(DailyWeather.fromJson(weatherData['daily'][i]));
    }
    _selectedCity = newCity;
    notifyListeners();
  }
}