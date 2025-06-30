/*
  2. Implement a news feed app that retrieves and displays articles from an API.
*/
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List articles = [];
  String apiKey = "0bd709959ded43a2922f3cf4c25bae5b"; // Replace with your NewsAPI key

  Future<void> fetchNews() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        articles = data['articles'];
      });
    } else {
      print("Error: ${response.body}");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Feed")),
      body: articles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article['title'] ?? "No Title"),
                  subtitle: Text(article['source']['name'] ?? "Unknown Source"),
                  leading: article['urlToImage'] != null
                      ? Image.network(article['urlToImage'], width: 100, fit: BoxFit.cover)
                      : const SizedBox(width: 100, height: 50, child: Placeholder()),
                  onTap: () {
                    
                  },
                );
              },
            ),
    );
  }
}
