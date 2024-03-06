import 'package:get/get.dart';
import 'package:percel_point/data/remote/payment_api.dart';
import 'package:percel_point/presentation/controller/payment_controller.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(PaymentController(paymentApi: PaymentApi()));
  }
}
