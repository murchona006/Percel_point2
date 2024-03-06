import 'package:get/get.dart';
import 'package:percel_point/data/remote/user_info_api.dart';
import 'package:percel_point/presentation/controller/profile_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PofileController>(PofileController(userInfoApi: UserInfoApi()));
  }
}
