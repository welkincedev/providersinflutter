import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/model/postModel9.dart';

class ApiService9 {

  static const String _baseUrl =
      'https://fakestoreapi.com';

  /// Fetches all posts from the API.
  Future<List<ApiProducts9>> fetchPosts() async {

    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
    );

    if (response.statusCode == 200) {

      final List<dynamic> jsonList =
      jsonDecode(response.body);

      return jsonList
          .map((json) => ApiProducts9.fromJson(json))
          .toList();

    } else {

      throw Exception(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
    }
  }
}