import 'package:flutter/foundation.dart';
import 'package:statemanagement/providerdemo/multiprovider/model/cartModel.dart';

class CartItems {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItems(
      {required this.id, required this.name, required this.price, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItems> _items = {};

  Map<String, CartItems> get items => Map.unmodifiable(_items);

  int get itemCount => _items.values.fold(0, (sum, i) => sum + i.quantity);

  double get totalPrice =>
      _items.values.fold(0, (sum, i) => sum + i.price + i.quantity);

  bool get isEmpty => items.isEmpty;

  void addItem(String id, String name, double price) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
    } else {
      _items[id] = CartItems(id: id, name: name, price: price);
      //CartItems(id : id, name : name, price : price);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void decrementQuantity(String id) {
    if (!_items.containsKey(id)) return;
    if(_items[id]!.quantity <= 1) {
      _items.remove(id);
    } else {
      _items[id]!.quantity--;
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }


}

