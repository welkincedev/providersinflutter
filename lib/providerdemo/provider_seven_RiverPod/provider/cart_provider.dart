import 'package:flutter_riverpod/legacy.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/models/productModel.dart';

class CartNotifier extends StateNotifier<List<ProductModel>> {
  CartNotifier(): super([]);

  void addToCart(ProductModel product) {
    state = [...state, product]; // ...state = it copies old items
  }

  void removeFromCart(ProductModel product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<ProductModel>>((ref) {
  return CartNotifier();
});