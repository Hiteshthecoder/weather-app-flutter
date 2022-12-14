class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json['sunrise'] as String?,
        sunset: json['sunset'] as String?,
        moonrise: json['moonrise'] as String?,
        moonset: json['moonset'] as String?,
        moonPhase: json['moon_phase'] as String?,
        moonIllumination: json['moon_illumination'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
      };
}
