import 'package:get/get.dart';
import 'package:percel_point/data/remote/shop_api.dart';
import 'package:percel_point/presentation/controller/shop_controller.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ShopController>(ShopController(shopApi: ShopApi()));
  }
}
