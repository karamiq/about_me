import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../components/bottom_info_bar.dart';
import '../../utils/constants/sizes.dart';
import 'components/about_image.dart';
import 'components/side_text.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveRowColumn(
              columnCrossAxisAlignment: CrossAxisAlignment.start,
              layout: ResponsiveValue<ResponsiveRowColumnType>(
                context,
                conditionalValues: [
                  Condition.smallerThan(
                      name: TABLET, value: ResponsiveRowColumnType.COLUMN),
                  Condition.largerThan(name: TABLET, value: ResponsiveRowColumnType.ROW),
                ],
                defaultValue: ResponsiveRowColumnType.COLUMN,
              ).value,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  rowOrder: 1,
                  child: const AboutImage(),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 2,
                  rowOrder: 0,
                  child: const SideText(),
                ),
              ],
            ),
            Gap(MediaQuery.of(context).size.height / 3),
            BottonInfoBar(),
          ],
        ),
      ),
    );
  }
}
