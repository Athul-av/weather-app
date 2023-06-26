// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Location? location;
    Current? current;

    Weather({
        this.location,
        this.current,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        current: json["current"] == null ? null : Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
    };
}

class Current {
    String? lastUpdated;
    double? tempC;
    Condition? condition;
    double? windKph;
    String? windDir;
    double? pressureMb;
    double? precipMm;
    int? humidity;
    double? uv;
    double? gustKph;

    Current({
        this.lastUpdated,
        this.tempC,
        this.condition,
        this.windKph,
        this.windDir,
        this.pressureMb,
        this.precipMm,
        this.humidity,
        this.uv,
        this.gustKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
        windKph: json["wind_kph"]?.toDouble(),
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"]?.toDouble(),
        precipMm: json["precip_mm"]?.toDouble(),
        humidity: json["humidity"],
        uv: json["uv"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "condition": condition?.toJson(),
        "wind_kph": windKph,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "precip_mm": precipMm,
        "humidity": humidity,
        "uv": uv,
        "gust_kph": gustKph,
    };
}

class Condition {
    String? text;
    String? icon;

    Condition({
        this.text,
        this.icon,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
    };
}

class Location {
    String? name;

    Location({
        this.name,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
 