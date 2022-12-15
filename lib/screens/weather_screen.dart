import 'package:flutter/material.dart';
import '../data/http_helper.dart';
import 'dart:developer' as developer;

import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: getData,
              child: const Text('Get Data'),
            ),
            Text(result.name),
          ],
        ));
  }

  Future getData() async {
    // print('****************************');
    developer.log('getData()', name: '_WeatherScreenState');
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('London');
    setState(() {});
  }
}
