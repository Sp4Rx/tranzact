import 'package:flutter/material.dart';
import 'package:tranzact/generated/assets.dart';
import 'package:tranzact/ui/commons/molecules/cta_card.dart';
import 'package:tranzact/ui/commons/molecules/transaction_summary.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: const [
            TransactionSummary(),
            SizedBox(
              height: 24,
            ),
            CtaCard(
              image: Assets.svgTeam,
              title: 'My Team Members',
              subTitle: 'Add Team Member',
            ),
            SizedBox(
              height: 24,
            ),
            CtaCard(
              image: Assets.svgConfused,
              title: 'Still have Doubts?',
              subTitle: 'View All FAQs',
            ),
          ],
        ),
      ),
    );
  }
}
