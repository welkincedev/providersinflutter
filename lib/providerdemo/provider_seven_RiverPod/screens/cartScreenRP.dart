import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/provider/cart_provider.dart';

class CartScreenRP extends ConsumerWidget {
  const CartScreenRP({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final items = cartItems[index];
          return Card(
            child: ListTile(
              title: Text(items.title),
              subtitle: Text(items.price.toString()),
              trailing: IconButton(onPressed: (){
                ref.read(cartProvider.notifier).removeFromCart(items);
              }, icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
