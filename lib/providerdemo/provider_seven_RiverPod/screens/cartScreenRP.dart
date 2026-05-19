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
        title: Text("Cart"),
      ),
      body: cartItems.isEmpty ?  Center(
        child: Text("Cart is Empty"),
      ) : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final items = cartItems[index];
          return Card(
            margin:  EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: Image.network(
                items.image,
                width: 40,
                height: 40,
              ),
              title: Text(
                items.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:  TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "\$${items.price}",
                style:  TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(cartProvider9.notifier)
                      .removeFromCart(items);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}