import 'package:get/get.dart';
import 'package:percel_point/data/remote/order_history_api.dart';
import 'package:percel_point/presentation/controller/order_history_controller.dart';

class OrderHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderHistoryController>(
        OrderHistoryController(orderHistoryApi: OrderHistoryApi()));
  }
}
