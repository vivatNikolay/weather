class CurrentWeather {
  int temp;
  String icon;
  String description;

  CurrentWeather({
    required this.temp,
    required this.icon,
    required this.description,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temp : (json['temp'] as double).toInt(),
      icon : json['weather'][0]['icon'],
      description : json['weather'][0]['description'],
    );
  }
}