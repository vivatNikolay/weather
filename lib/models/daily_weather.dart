class DailyWeather {
  int dayTemp;
  int nightTemp;
  String icon;
  String summary;

  DailyWeather({
    required this.dayTemp,
    required this.nightTemp,
    required this.icon,
    required this.summary,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      dayTemp : (json['temp']['day'] as double).toInt(),
      nightTemp : (json['temp']['night'] as double).toInt(),
      icon : json['weather'][0]['icon'],
      summary : json['summary'],
    );
  }
}