import 'package:flutter/material.dart';
import 'package:percel_point/presentation/screens/gb_widgets/single_operation_card.dart';
import 'package:percel_point/presentation/screens/resources/values_manager.dart';

class OperationCardRow extends StatelessWidget {
  final String title1, value1, value2, value3, value4, title2, header;
  final String icon1, icon2;
  final VoidCallback press1, press2;
  final Color color1, color2;
  const OperationCardRow({
    Key? key,
    required this.title1,
    required this.title2,
    required this.header,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.icon1,
    required this.icon2,
    required this.press1,
    required this.press2,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppMargin.m10,
        right: AppMargin.m10,
      ),
      child: Row(
        children: [
          SingleOperationCard(
            press1: press1,
            title1: title1,
            title2: header,
            value: value1,
            value2: value3,
            right: AppMargin.m10,
            left: AppMargin.m0,
            color: color1,
          ),
          SingleOperationCard(
            press1: press2,
            title1: title2,
            title2: header,
            value: value2,
            value2: value4,
            right: AppMargin.m0,
            left: AppMargin.m10,
            color: color2,
          ),
        ],
      ),
    );
  }
}
