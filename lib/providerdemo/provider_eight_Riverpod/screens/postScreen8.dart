import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_eight_Riverpod/provider/postProvider.dart';

class Postscreen8 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postProvider);
    return Scaffold(
        appBar: AppBar(title: Text("Riverpod Api"),),
        body: postData.when(data: (post) {
          return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                final posts = post[index];
                return Card(margin:EdgeInsets.all(20),
                child: Padding(padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(posts.title,style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text(posts.body)
                  ],
                ),),);
              });
        }, error: (error, stack) {
          return Center(child: Text("Error: $error"),);
        }, loading: () {
          return Center(child: CircularProgressIndicator(color: Colors.blue,),);
        },)
    );
  }

}