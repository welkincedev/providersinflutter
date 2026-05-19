import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/providerdemo/api_provider_five/model/post.dart';

class PostService {

  // PostService({http.Client? client})
  //     : _client = client ?? http.Client();

  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com';

  /// Fetches all posts from the API.
  Future<List<Post>> fetchPosts() async {

    final response = await http.get(
      Uri.parse('$_baseUrl/posts'),
    );

    if (response.statusCode == 200) {

      final List<dynamic> jsonList =
      jsonDecode(response.body);

      return jsonList
          .map((json) => Post.fromJson(json))
          .toList();

    } else {

      throw Exception(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
    }
  }
}