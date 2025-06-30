/*
  3. Create a search app that fetches and displays movie information based on user input from an external API.
*/
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _movieData;
  bool _isLoading = false;

  Future<void> fetchMovie(String title) async {
    setState(() {
      _isLoading = true;
    });
    
    const apiKey = '7b62363a';
    final url = Uri.parse('https://www.omdbapi.com/?t=$title&apikey=$apiKey');
    
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _movieData = json.decode(response.body);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching movie: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter movie title',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    fetchMovie(_controller.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _movieData != null
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _movieData!["Title"] ?? "No Title",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              _movieData!["Poster"] != "N/A"
                                  ? Image.network(_movieData!["Poster"])
                                  : Container(),
                              const SizedBox(height: 10),
                              Text("Year: ${_movieData!["Year"]}"),
                              Text("Genre: ${_movieData!["Genre"]}"),
                              Text("Director: ${_movieData!["Director"]}"),
                              Text("Plot: ${_movieData!["Plot"]}"),
                            ],
                          ),
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
