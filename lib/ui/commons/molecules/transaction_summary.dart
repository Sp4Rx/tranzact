import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/atoms/big_text.dart';
import 'package:tranzact/ui/commons/atoms/colored_action_text.dart';
import 'package:tranzact/ui/commons/atoms/colored_line.dart';
import 'package:tranzact/ui/commons/atoms/plain_text.dart';
import 'package:tranzact/ui/commons/atoms/shadow_container.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class TransactionSummary extends StatelessWidget {
  final String? totalAmount;
  final String? itemCount;
  final VoidCallback? onDownLoadPressed;

  const TransactionSummary(
      {Key? key, this.totalAmount, this.itemCount, this.onDownLoadPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.area_chart,
                    color: TColors.neutral6,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  PlainText('Inventory'),
                ],
              ),
              const Chip(
                label: Text(
                  'INCLUDES DUMMY',
                  style: TextStyle(
                      color: TColors.primary3,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
                backgroundColor: TColors.blueLight,
              ),
              GestureDetector(
                onTap: onDownLoadPressed,
                child: const Icon(
                  Icons.download,
                  color: TColors.secondaryDefault,
                ),
              ),
            ],
          ),
          BigText('₹ ${totalAmount ?? 0}'),
          PlainText('${itemCount ?? 0} Items'),
          const SizedBox(
            height: 12,
          ),
          const ColoredLine(color: TColors.neutral5),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: TColors.secondaryDefault,
              ),
              ColoredActionText(
                'Add New Item',
                color: TColors.secondaryDefault,
              ),
            ],
          )
        ],
      ),
    );
  }
}
