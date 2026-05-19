class CartItems {
  final String id;
  final String name;
  final num price;
  int quantity;

  CartItems({required this.id, required this.name, required this.price, this.quantity = 1});
}