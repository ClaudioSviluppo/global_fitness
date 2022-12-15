class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];

    /*Per ottenere i gradi Farhenheith  dai Kelvin
         devo moltiplicare il valore per 9/5 e sottrarre  459.67
        */
    //  this.temperature = (weatherMap['main']['temp'] * (9/5) -459.67) ?? 0;

    /*Per ottenere i gradi Celsius dai Kelvin 
         devo sottrarre 273.15
        */
    temperature = (weatherMap['main']['temp'] * (9 / 5) - 459.67) ?? 0;
    perceived = (weatherMap['main']['feels_like'] * (9 / 5) - 459.67) ?? 0;
    pressure = weatherMap['main']['perceived'] ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
    description = weatherMap['weather'][0]['main'] ?? '';
  }
}
