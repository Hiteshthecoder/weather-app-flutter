class Alerts {
  List<dynamic>? alert;

  Alerts({this.alert});

  factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
        alert: json['alert'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'alert': alert,
      };
}
