import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providerdemo/multiprovider/provider/auth_provider.dart';
import 'package:statemanagement/providerdemo/multiprovider/provider/cart_Provider.dart';

class CartScreenMP extends StatelessWidget {
  const CartScreenMP({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("${auth.displayName}'s Cart"),
        actions: [
          if (!cart.isEmpty)
            TextButton(
              onPressed: () => context.read<CartProvider>().clearCart(),
              child: const Text(
                'Clear All',
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.grey, size: 64),
                  SizedBox(height: 12),
                  Text("Your Cart is Empty", style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: cart.items.values.map((item) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          '\$${item.price.toStringAsFixed(2)} each',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => context
                                  .read<CartProvider>()
                                  .decrementQuantity(item.id),
                            ),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => context
                                  .read<CartProvider>()
                                  .addItem(item.id, item.name, item.price),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => context
                                  .read<CartProvider>()
                                  .removeItem(item.id),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Order placed! (demo)')),
                          );
                          context.read<CartProvider>().clearCart();
                          Navigator.pop(context);
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
