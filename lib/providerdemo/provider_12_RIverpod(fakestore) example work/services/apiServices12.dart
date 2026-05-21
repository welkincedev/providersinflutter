import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/model/postModel12.dart';

class ApiService12 {

  static const String _baseUrl =
      'https://fakestoreapi.com';

  /// Fetches all posts from the API.
  Future<List<ApiProducts12>> fetchPosts() async {

    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
    );

    if (response.statusCode == 200) {

      final List<dynamic> jsonList =
      jsonDecode(response.body);

      return jsonList
          .map((json) => ApiProducts12.fromJson(json))
          .toList();

    } else {

      throw Exception(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
    }
  }
}