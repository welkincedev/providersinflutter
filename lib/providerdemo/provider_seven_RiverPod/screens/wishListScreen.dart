import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/provider/wishlist_provider.dart';

class WishListScreen extends ConsumerWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(wishlistProvider);
    return Scaffold(
      appBar: AppBar(title: Text("WishList")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final items = cartItems[index];
          return Card(
            child: ListTile(
              title: Text(items.title),
              subtitle: Text(items.price.toString()),
              trailing: IconButton(onPressed: (){
                ref.read(wishlistProvider.notifier).removeFromWishlist(items);
              }, icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
