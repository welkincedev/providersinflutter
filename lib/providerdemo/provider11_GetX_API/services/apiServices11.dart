import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/providerdemo/provider11_GetX_API/model/postModel11.dart';

class APIService11{
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com';

  /// Fetches all posts from the API.
  Future<List<PostModal11>> fetchPosts() async {

    final response = await http.get(
      Uri.parse('$_baseUrl/posts'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList =
      jsonDecode(response.body);
      return jsonList
          .map((json) => PostModal11.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
    }
  }
}