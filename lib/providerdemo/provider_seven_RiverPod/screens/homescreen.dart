import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/provider/providers.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/screens/cartScreenRP.dart';
import 'package:statemanagement/providerdemo/provider_seven_RiverPod/screens/wishListScreen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final cartItem = ref.watch(productProvider);
    final wishListItems = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod Shop"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen9()),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  radius: 8,
                  child: Text(
                    cartItem.length.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.title),
              subtitle: Text("${product.price}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen9()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WishListScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
