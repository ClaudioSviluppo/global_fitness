import 'dart:io';

import 'package:flutter/material.dart';
import '../data/http_helper.dart';
import 'dart:developer' as developer;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String result = '';
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
            Text(result),
          ],
        ));
  }

  Future getData() async {
    print('****************************');
    developer.log('getData', name: 'QQQQQQ');
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('London');
    setState(() {});
  }
}
