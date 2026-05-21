import 'package:get/get.dart';
import 'package:statemanagement/providerdemo/provider11_GetX_API/model/postModel11.dart';
import 'package:statemanagement/providerdemo/provider11_GetX_API/services/apiServices11.dart';

class PostController11 extends GetxController {
  var postList = <PostModal11>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading (true);
      var posts = await APIService11().fetchPosts();
      postList.assignAll(posts);
    }finally{
      isLoading(false);
    }
  }

}
