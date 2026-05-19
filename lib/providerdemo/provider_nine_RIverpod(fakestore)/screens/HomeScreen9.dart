import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/provider/cartProvider9.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/provider/postProvider9.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/screens/cartScreen9.dart';

class Postscreen9 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postProvider9);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Api"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen9()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: postData.when(
        data: (post) {
          return ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              final posts = post[index];
              return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    ref.read(cartProvider9.notifier).addToCart(posts);
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                title: Text(
                  posts.title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "\$${posts.price}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                leading: Image.network(
                  posts.image,
                  scale: 12,
                  height: 200,
                  width: 50,
                ),
              );
            },
          );
        },
        error: (error, stack) {
          return Center(child: Text("Error: $error"));
        },
        loading: () {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        },
      ),
    );
  }
}
