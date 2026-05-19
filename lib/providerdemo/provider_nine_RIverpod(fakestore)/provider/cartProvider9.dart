
import 'package:flutter_riverpod/legacy.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/model/postModel9.dart';

class CartNotifier extends StateNotifier<List<ApiProducts9>> {
  CartNotifier() : super([]);

  void addToCart(ApiProducts9 product) {
    state = [...state, product];
  }

  void removeFromCart(ApiProducts9 product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}

final cartProvider9 =
StateNotifierProvider<CartNotifier, List<ApiProducts9>>((ref) {
  return CartNotifier();
});