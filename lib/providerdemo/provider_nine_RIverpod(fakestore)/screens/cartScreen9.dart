import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/provider/cartProvider9.dart';

class CartScreen9 extends ConsumerWidget {
  const CartScreen9({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider9);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: cartItems.isEmpty ? const Center(
        child: Text("Cart is Empty"),) : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.network(
              product.image,
              width: 50,
              height: 50,
            ),
            title: Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "\$${product.price}",
            ),
            trailing: IconButton(
              onPressed: () {
                ref
                    .read(cartProvider9.notifier).removeFromCart(product);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}