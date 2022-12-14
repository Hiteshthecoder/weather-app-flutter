import 'alerts.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;
  Alerts? alerts;

  Weather({this.location, this.current, this.forecast, this.alerts});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
        alerts: json['alerts'] == null
            ? null
            : Alerts.fromJson(json['alerts'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
        'alerts': alerts?.toJson(),
      };
}
