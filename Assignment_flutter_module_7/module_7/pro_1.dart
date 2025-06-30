/*
  1. Create a basic weather app that fetches weather data from a public API and displays it. 
*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  String _temperature = "";
  String _weather = "";
  String _humidity = "";
  String _icon = "";
  final String _apiKey = "547c64955f877f49647379feb7f1f68f";

  Future<void> fetchWeather(String city) async {
    final url = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _temperature = "${data['main']['temp']}°C";
        _weather = "${data['weather'][0]['description']}";
        _humidity = "Humidity: ${data['main']['humidity']}%";
        _icon = data['weather'][0]['icon'];
      });
    } else {
      setState(() {
        _temperature = "City not found!";
        _weather = "";
        _humidity = "";
        _icon = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.green.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Enter city name",
                  labelStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  fetchWeather(_cityController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text("Get Weather", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 30),
              _icon.isNotEmpty
                  ? Column(
                      children: [
                        Image.network(
                          "http://openweathermap.org/img/w/$_icon.png",
                          scale: 1.5,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(
                _temperature,
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                _weather,
                style: const TextStyle(fontSize: 24, color: Colors.white70),
              ),
              Text(
                _humidity,
                style: const TextStyle(fontSize: 18, color: Colors.white60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
