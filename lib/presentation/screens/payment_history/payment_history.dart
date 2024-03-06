import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percel_point/presentation/controller/internetchecker_controller.dart';
import 'package:percel_point/presentation/controller/payment_history_controller.dart';
import 'package:percel_point/presentation/no_internet/internetchecker_view.dart';
import 'package:percel_point/presentation/screens/gb_widgets/data_loader.dart';
import 'package:percel_point/presentation/screens/payment_history/components/payment_history_card.dart';
import 'package:percel_point/presentation/screens/payment_history/components/payment_history_header.dart';
import 'package:percel_point/presentation/screens/resources/assets_manager.dart';
import 'package:percel_point/presentation/screens/resources/string_manager.dart';
import 'package:percel_point/presentation/screens/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import 'components/history_filter.dart';

class PaymentHistoryView extends GetView<PaymentHistoryController> {
  const PaymentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color:Colors.white,
          child: Column(
            children: [
              const PaymentHistoryHeader(),
              const SizedBox(
                height: AppSize.s10,
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () async {
                  await controller.getPaymentHistories();
                },
                child: Obx(
                  () => Get.find<InternetcheckerController>()
                              .connectionStatus
                              .value ==
                          1
                      ? controller.obx(
                          (response) => response!.isEmpty
                              ? EmptyFailureNoInternetView(
                                  image: ImageAssets.noData,
                                  title: AppStrings.noData,
                                  description: AppStrings.noDataMsg,
                                  buttonText: AppStrings.retry,
                                  onPressed: () {
                                    controller.getPaymentHistories();
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => PaymentCard(
                                    payment: response[index],
                                  ),
                                  itemCount: response.length,
                                ),
                          onEmpty: EmptyFailureNoInternetView(
                            image: ImageAssets.noData,
                            title: AppStrings.noData,
                            description: AppStrings.noDataMsg,
                            buttonText: AppStrings.retry,
                            onPressed: () {
                              controller.getPaymentHistories();
                            },
                          ),
                          onLoading: const DataLoader(),
                          onError: (error) => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: EmptyFailureNoInternetView(
                              image: ImageAssets.noData,
                              title: AppStrings.error,
                              description: error.toString(),
                              buttonText: AppStrings.retry,
                              onPressed: () {
                                controller.getPaymentHistories();
                              },
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: EmptyFailureNoInternetView(
                            image: ImageAssets.noInternet,
                            title: AppStrings.noInternet,
                            description: AppStrings.checkConnection,
                            buttonText: AppStrings.retry,
                            onPressed: () {
                              controller.getPaymentHistories();
                            },
                          ),
                        ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
