import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/multiprovider/screens/shopScreen.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/provider/cartProvider12.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/provider/postProvider12.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/screens/detailsScreen12.dart';

class Postscreen12 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postProvider12);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              child: const Icon(Icons.refresh, color: Colors.white),
              radius: 14,
              backgroundColor: Colors.white38,
            ),
          ),
        ],
      ),
      body: postData.when(
        data: (post) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: post.length,
            itemBuilder: (context, index) {
              final posts = post[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailsScreen12(products: posts,)),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.network(
                            posts.image,
                            fit: BoxFit.contain,
                            height: 200,
                            width: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          posts.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${posts.price}",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow.shade600),
                                Text("${posts.rating.rate}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
