import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Meteo extends StatefulWidget {
  const Meteo({Key? key}) : super(key: key);

  @override
  _MeteoState createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {
  final TextEditingController _controller = TextEditingController();
  String? _weatherData;
  String? _temperatureData;

  Future<void> fetchWeather() async {
    WeatherFactory wf = new WeatherFactory(
        "af035b3e6a744952ee55d0ef8ff73323");
    Weather weather = await wf.currentWeatherByCityName(_controller.text);

    setState(() {
      _weatherData = 'Sky :' + weather.weatherMain!;
      _temperatureData = 'Temp : ' + weather.temperature!.celsius!.round().toString() + '°C';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meteo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: fetchWeather,
            child: Text('Fetch Weather'),
          ),
          Text('${_weatherData ?? ""}'),
          Text(' ${_temperatureData ?? ""}'),
        ],
      ),
    );
  }
}