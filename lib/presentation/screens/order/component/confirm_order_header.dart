// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percel_point/presentation/screens/order/component/history_filter.dart';
// import 'package:percel_point/presentation/screens/order/component/search_orders.dart';
// import 'package:percel_point/presentation/screens/resources/color_manager.dart';
// import 'package:percel_point/presentation/screens/resources/string_manager.dart';
// import 'package:percel_point/presentation/screens/resources/values_manager.dart';
//
// import '../../resources/fonts_manager.dart';
// import '../../resources/style_manager.dart';
//
// class ConfirmOrderHeader extends StatelessWidget {
//   const ConfirmOrderHeader({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(AppPadding.p8),
//       color: Colormanager.darkPrimary,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Material(
//             child: InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: AppSize.s10,
//                   ),
//                   Icon(
//                     Icons.arrow_back_ios,
//                     color: Colormanager.white,
//                     semanticLabel: 'Back',
//                     size: AppSize.s22,
//                   ),
//                   Text(
//                     AppStrings.back,
//                     style: getSemiBoldStyle(
//                         color: Colormanager.white, fontSize: FontSize.s18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Text(
//             AppStrings.confirmOrders,
//             style: getSemiBoldStyle(
//                 color: Colormanager.white, fontSize: FontSize.s18),
//           ),
//
//           Material(
//             child: GestureDetector(
//               onTap: () {
//                 showOrderModal(context);
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(right: AppMargin.m8),
//                 decoration: BoxDecoration(
//                     color: Colormanager.darkblue, shape: BoxShape.circle),
//                 child: Icon(
//                   Icons.filter_list_sharp,
//                   color: Colormanager.white,
//                   size: AppSize.s35,
//                 ),
//               ),
//
//             ),
//           ),
//
//           InkWell(
//             onTap: () {
//               searchOrderModal(context);
//             },
//             child: Container(
//               margin: const EdgeInsets.only(right: AppMargin.m8),
//               decoration: BoxDecoration(
//                   color: Colormanager.darkblue, shape: BoxShape.circle),
//               child: Icon(
//                 Icons.search,
//                 color: Colormanager.white,
//                 size: AppSize.s35,
//               ),
//             ),
//
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percel_point/presentation/screens/order/component/history_filter.dart';
import 'package:percel_point/presentation/screens/order/component/search_orders.dart';
import 'package:percel_point/presentation/screens/resources/color_manager.dart';
import 'package:percel_point/presentation/screens/resources/string_manager.dart';
import 'package:percel_point/presentation/screens/resources/values_manager.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class ConfirmOrderHeader extends StatelessWidget {
  const ConfirmOrderHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      color: Colormanager.darkPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colormanager.white,
                    semanticLabel: 'Back',
                    size: AppSize.s22,
                  ),
                  Text(
                    AppStrings.back,
                    style: getSemiBoldStyle(
                        color: Colormanager.white, fontSize: FontSize.s18),
                  )
                ],
              ),
            ),
          ),
          Text(
            AppStrings.confirmOrders,
            style: getSemiBoldStyle(
                color: Colormanager.white, fontSize: FontSize.s18),
          ),

          Material(
            child: GestureDetector(
              onTap: () {
                showOrderModal(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: AppMargin.m8),
                decoration: BoxDecoration(
                    color: Colormanager.darkblue, shape: BoxShape.circle),
                child: Icon(
                  Icons.filter_list_sharp,
                  color: Colormanager.white,
                  size: AppSize.s35,
                ),
              ),
            ),
          ),

          Material(
            child: GestureDetector(
              onTap: () {
                searchOrderModal(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: AppMargin.m8),
                decoration: BoxDecoration(
                    color: Colormanager.darkblue, shape: BoxShape.circle),
                child: Icon(
                  Icons.search,
                  color: Colormanager.white,
                  size: AppSize.s35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
