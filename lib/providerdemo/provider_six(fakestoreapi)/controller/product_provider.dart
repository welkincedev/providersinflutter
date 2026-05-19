import 'package:flutter/foundation.dart';
import 'package:statemanagement/providerdemo/provider_six(fakestoreapi)/model/product_model.dart';
import 'package:statemanagement/providerdemo/provider_six(fakestoreapi)/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  // variables
  final ProductService _service = ProductService();
  bool _isLoading = false;
  String _errorMessage = "";
  late List<Products> _products;

  // getters
  bool get isLoading => _isLoading;
  String get errorMsg => _errorMessage;
  List<Products> get products => _products;

  //methods
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _service.fetchProducts();
      _errorMessage = '';
    } catch (e) {
      e.toString();
    }
  }
}
