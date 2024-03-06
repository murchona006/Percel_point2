import 'package:get/get.dart';
import 'package:percel_point/data/remote/registration_api.dart';
import 'package:percel_point/presentation/controller/registration_controller.dart';

class RegistrationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RegistrationController>(
        RegistrationController(registrationApi: RegistrationApi()));
  }
}
