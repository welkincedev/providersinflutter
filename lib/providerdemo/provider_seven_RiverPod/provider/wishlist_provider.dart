import 'package:flutter_riverpod/legacy.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/models/productModel.dart';

class WishlistNotifier extends StateNotifier<List<ProductModel>> {
  WishlistNotifier(): super([]);

  void addToWishlist(ProductModel product) {
    state = [...state, product]; // ...state = it copies old items
  }

  void removeFromWishlist(ProductModel product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<ProductModel>>((ref) {
  return WishlistNotifier();
});