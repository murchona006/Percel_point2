import 'package:get/get.dart';
import 'package:percel_point/data/remote/user_info_api.dart';
import 'package:percel_point/presentation/controller/incomplete_controller.dart';

class IncompleteBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IncompleteController>(
        IncompleteController(userInfoApi: UserInfoApi()));
  }
}
