class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  /// Factory method to parse JSON response
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final currentWeatherData = json['list'][0];
    return WeatherModel(
      currentTemp: (currentWeatherData['main']['temp'] as num).toDouble(),
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: (currentWeatherData['wind']['speed'] as num).toDouble(),
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }
}
