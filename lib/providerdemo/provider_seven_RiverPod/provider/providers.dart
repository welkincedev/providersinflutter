import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/models/productModel.dart';

final productProvider = Provider<List<ProductModel>>((ref) {
  return[
    ProductModel(
      id: 1,
      title: "iPhone 15",
      price: 999,
    ),

    ProductModel(
      id: 2,
      title: "MacBook Air",
      price: 1299,
    ),

    ProductModel(
      id: 3,
      title: "AirPods Pro",
      price: 249,
    ),

    ProductModel(
      id: 4,
      title: "Gaming Keyboard",
      price: 120,
    ),

    ProductModel(
      id: 5,
      title: "Smart Watch",
      price: 199,
    ),
  ];
});
