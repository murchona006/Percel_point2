import 'package:get/get.dart';
import 'package:percel_point/data/remote/order_api.dart';
import 'package:percel_point/presentation/controller/user_info_controller.dart';

import '../../presentation/controller/internetchecker_controller.dart';
import '../../presentation/controller/order_create_controller.dart';

class RootBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserInfoController>(UserInfoController());
    Get.put<InternetcheckerController>(InternetcheckerController(),
        permanent: true);
    
  }
}
