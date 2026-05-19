import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_nine_RIverpod(fakestore)/provider/postProvider9.dart';

class Postscreen9 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postProvider9);
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Api")),
      body: postData.when(
        data: (post) {
          return ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              final posts = post[index];
              return ListTile(
                trailing: Image.network(posts.image, scale: 12),
                title: Text(
                  posts.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "\$${posts.price}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
