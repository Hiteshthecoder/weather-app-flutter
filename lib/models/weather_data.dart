import 'package:weather_app/models/weather/current.dart';
import 'package:weather_app/models/weather/forecast.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? weatherDataHourly;
  WeatherData([this.current, this.weatherDataHourly]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getWeatherDataHoury() => weatherDataHourly!;
}
