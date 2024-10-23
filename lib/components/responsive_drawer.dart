import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants/sizes.dart';

class ResponsiveDrawer extends StatelessWidget {
  const ResponsiveDrawer({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<String> pages;

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: ResponsiveValue<bool>(
        context,
        conditionalValues: [Condition.smallerThan(name: DESKTOP, value: true)],
        defaultValue: false,
      ).value,
      child: Drawer(
        backgroundColor: ColorsTheme.backgroundColor,
        width: 90,
        child: NavigationRail(
          selectedIconTheme: IconThemeData(color: ColorsTheme.backgroundColor),
          unselectedIconTheme: IconThemeData(color: ColorsTheme.textColor),
          indicatorColor: ColorsTheme.buttonColor,
          unselectedLabelTextStyle: TextStyle(
            color: ColorsTheme.textColor,
          ),
          selectedLabelTextStyle: TextStyle(
            color: ColorsTheme.textColor,
          ),
          backgroundColor: ColorsTheme.backgroundColor,
          selectedIndex: currentIndex != -1 ? currentIndex : 0,
          onDestinationSelected: (index) {
            GoRouter.of(context).go(pages[index]);
            Navigator.pop(context); // Close drawer after selecting
          },
          labelType: NavigationRailLabelType.all,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text('About Me'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.build),
              label: Text('Services'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.work),
              label: Text('Projects'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.contact_mail),
              label: Text('Contact Me'),
            ),
          ],
        ),
      ),
    );
  }
}
