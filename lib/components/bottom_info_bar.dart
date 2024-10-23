import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../utils/constants/sizes.dart';

class BottonInfoBar extends StatelessWidget {
  const BottonInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Insets.mediumAll,
      padding: Insets.mediumAll,
      color: ColorsTheme.contactsInfoBackgroundColor,
      child: Column(
        children: [
          ResponsiveRowColumn(
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            layout: ResponsiveValue<ResponsiveRowColumnType>(
              context,
              conditionalValues: [
                Condition.smallerThan(
                  name: TABLET,
                  value: ResponsiveRowColumnType.COLUMN,
                ),
                Condition.largerThan(
                  name: TABLET,
                  value: ResponsiveRowColumnType.ROW,
                ),
              ],
              defaultValue: ResponsiveRowColumnType.COLUMN,
            ).value,
            children: [
              _buildLeftColumn(),
              ResponsiveRowColumnItem(child: Gap(Insets.medium)),
              _buildRightColumn(),
            ],
          ),
          Gap(Insets.medium),
          const Divider(),
        ],
      ),
    );
  }

  ResponsiveRowColumnItem _buildLeftColumn() {
    return ResponsiveRowColumnItem(
      rowFlex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Karam Rashed',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(Insets.medium),
          const Text('Flutter Developer'),
          Gap(Insets.medium),
          const Text('Contact me at'),
          const Text('mppp5119@gmail.com'),
        ],
      ),
    );
  }

  ResponsiveRowColumnItem _buildRightColumn() {
    return ResponsiveRowColumnItem(
      rowFlex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lets Talk!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(Insets.medium),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Magna morbi massa dictum tristique convallis pretium eleifend habitant. '
            'Libero a arcu purus, elit, volutpat in nunc amet. '
            'Fermentum risus vel dolor id scelerisque senectus et, id nunc. '
            'Consectetur metus tristique ullamcorper semper purus massa eget urna.',
          ),
        ],
      ),
    );
  }
}
