import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/deep_link_data.dart';

class PindeepManager {
  final String apiKey;
  final String baseUrl;

  PindeepManager({required this.apiKey, this.baseUrl = "https://pindeep.link/api"});

  Future<String?> createLink(DeepLinkData data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create.php'),
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': apiKey,
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['short_link'];
    } else {
      print('Failed to create link: ${response.body}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getStats(String code) async {
    final response = await http.get(
      Uri.parse('$baseUrl/stats.php?code=$code'),
      headers: {'X-API-KEY': apiKey},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Stats fetch failed: ${response.body}');
      return null;
    }
  }
}