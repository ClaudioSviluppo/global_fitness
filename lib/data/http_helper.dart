import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

import 'weather.dart';

//rimport 'weather.dart';

class HttpHelper {
  //api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=104d76c13f3a9fbe55f8bf18ec002a29
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '104d76c13f3a9fbe55f8bf18ec002a29';

//This return the future because all calls made with HTTP are asynchronous
//Questo future ritorna String
/*
In dart e in Flutter Future class to perform asynchronous tasks. 
Async prima di una funzione ritorna sempre una Promise o Future in dart
await funziona solo nelle funzioni async  e attende fino a quando la promise
risolve e ritorna risultato
*/
  Future<Weather> getWeather(String location) async {
    developer.log('Parametro $location', name: 'getWeather');
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    developer.log(result.body, name: 'Data response');
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
