import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kwg/model/post_model.dart';

class ApiUtils {
  static const String baseURL = "https://jsonplaceholder.typicode.com";
  static const String postUrl = baseURL + "/commments";

  static var client = http.Client();

  static Future<List<Post>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
