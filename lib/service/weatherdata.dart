import 'dart:convert';
// import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weathermodel.dart';

class WeatherData{

  Future<Weather> getData(var lat,var long)async{
      var uricall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=59c11d6a8bf44deb984154314231906&q=$lat,$long&aqi=yes');

      var response = await http.get(uricall);

      final body = response.body;

      var json = jsonDecode(body);

   return  Weather.fromJson(json);  
   
  }
}