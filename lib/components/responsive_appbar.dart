import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants/sizes.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({
    super.key,
    required this.title,
    required this.pages,
    required this.tabController,
  });

  final Text title;
  final List<String> pages;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ResponsiveValue<Widget>(context,
        conditionalValues: [
          Condition.equals(
              name: DESKTOP,
              value: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Insets.extraLarge,
                      ),
                      child: SizedBox(
                        width: 410,
                        child: TabBar(
                          onTap: (value) => GoRouter.of(context).go(pages[value]),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          controller: tabController,
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: ColorsTheme.textColor,
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: Insets.small),
                          indicator: BoxDecoration(
                            borderRadius: BorderSize.extraLargeRadius,
                            color: ColorsTheme.buttonColor,
                          ),
                          labelColor: ColorsTheme.backgroundColor,
                          tabs: const [
                            Tab(text: 'About Me'),
                            Tab(text: 'Services'),
                            Tab(text: 'Projects'),
                            Tab(text: 'Contact Me'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
        defaultValue: AppBar(
          toolbarHeight: 80,
          title: title,
          //here we are using the IconButton to show the drawer
          leading: Builder(
              builder: (context) => IconButton(
                    onPressed: () =>
                        Scaffold.of(context).openDrawer(), // Open the drawer when pressed
                    icon: Icon(
                      Icons.menu,
                      color: ColorsTheme.textColor,
                    ),
                  )),
        )).value;
  }
}
