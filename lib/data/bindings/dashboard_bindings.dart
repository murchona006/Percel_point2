import 'package:get/get.dart';
import 'package:percel_point/data/remote/dashboard_api.dart';
import 'package:percel_point/presentation/controller/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
        DashboardController(dashboardApi: DashboardApi()),
        permanent: true);
  }
}
