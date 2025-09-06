import 'dart:convert';

import 'package:learn_bloc_clean/data/data_provider/weather_data_provider.dart';
import 'package:learn_bloc_clean/model/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this.weatherDatProvider);
  final WeatherDatProvider weatherDatProvider;


  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final weatherData = await weatherDatProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }
      print(data);
      return WeatherModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
