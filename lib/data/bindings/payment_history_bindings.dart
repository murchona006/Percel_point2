import 'package:get/get.dart';
import 'package:percel_point/data/remote/payment_history_api.dart';
import 'package:percel_point/presentation/controller/payment_history_controller.dart';

class PaymentHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentHistoryController>(
        PaymentHistoryController(paymentHistoryApi: PaymentHistoryApi()));
  }
}
