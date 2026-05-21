import 'package:get/get.dart';
import 'package:statemanagement/providerdemo/provider_GetX_MVVM_UserAPI/model/usermodal.dart';
import 'package:statemanagement/providerdemo/provider_GetX_MVVM_UserAPI/service/user_service.dart';

class UserController extends GetxController {
  //states
  var users = <User>[].obs;
  var isLoading = false.obs;
  var errorMsg = ''.obs;

  //services
  final _service = UserService();

  // called auto when the controller is called
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    errorMsg.value = '';

    try {
      final result = await _service.getUsers();
      users.assignAll(result);
    } catch (e) {
      errorMsg.value = 'Something Went wrong,Please try again';
    } finally {
      isLoading.value = false;
    }
  }
}
