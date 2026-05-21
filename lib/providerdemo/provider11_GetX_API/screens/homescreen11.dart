import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/providerdemo/provider11_GetX_API/controller/postController11.dart';

class HomeScreen11 extends StatelessWidget {

  final PostController11 controller = Get.put(PostController11());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX API Example"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(itemCount: controller.postList.length,
            itemBuilder: (context, index) {
              final post = controller.postList[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                  ),
                ),
              );
            });
      }),
    );
  }
}
