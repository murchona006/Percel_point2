import 'package:get/get.dart';
import 'package:percel_point/data/remote/order_history_api.dart';
import 'package:percel_point/data/remote/return_history_api.dart';
import 'package:percel_point/presentation/controller/order_history_controller.dart';
import 'package:percel_point/presentation/controller/return_history_controller.dart';

class ReturnHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ReturnHistoryController>(
        ReturnHistoryController(returnHistoryApi: ReturnHistoryApi()));
  }
}
