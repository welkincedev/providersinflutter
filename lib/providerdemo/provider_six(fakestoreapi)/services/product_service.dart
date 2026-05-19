import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statemanagement/providerdemo/provider_six(fakestoreapi)/model/product_model.dart';

class ProductService {

  // PostService({http.Client? client})
  //     : _client = client ?? http.Client();

  static const String _baseUrl =
      'https://fakestoreapi.com';

  /// Fetches all posts from the API.
  Future<List<Products>> fetchProducts() async {

    final response = await http.get(
      Uri.parse('$_baseUrl/products'),
    );

    if (response.statusCode == 200) {

      final List<dynamic> jsonList =
      jsonDecode(response.body);

      return jsonList
          .map((json) => Products.fromJson(json))
          .toList();

    } else {

      throw Exception(
        'Failed to load posts: HTTP ${response.statusCode}',
      );
    }
  }
}