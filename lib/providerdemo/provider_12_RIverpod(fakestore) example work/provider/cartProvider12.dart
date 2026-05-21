
import 'package:flutter_riverpod/legacy.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/model/postModel12.dart';

class CartNotifier extends StateNotifier<List<ApiProducts12>> {
  CartNotifier() : super([]);

  void addToCart(ApiProducts12 product) {
    state = [...state, product];
  }

  void removeFromCart(ApiProducts12 product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}

final cartProvider12 =
StateNotifierProvider<CartNotifier, List<ApiProducts12>>((ref) {
  return CartNotifier();
});