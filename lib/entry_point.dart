import 'package:about_me/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'utils/constants/sizes.dart';

class EntryPoint extends HookWidget {
  const EntryPoint(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Karam Rashed',
      style: TextStyle(
        color: ColorsTheme.textColor,
        fontWeight: FontWeight.w700,
        fontFamily: GoogleFonts.cairo().fontFamily,
      ),
    );
    // List of routes to match with tabs
    final pages = [Routes.aboutMe, Routes.services, Routes.projects, Routes.contactMe];

    // Create a TabController with length 4
    final tabController = useTabController(initialLength: 4);

    // Get the current location to sync tab index with route
    final currentIndex =
        pages.indexOf(GoRouter.of(context).routerDelegate.currentConfiguration.fullPath);

    // Update the tab index when the route changes
    useEffect(() {
      tabController.index = currentIndex != -1 ? currentIndex : 0;
      return null;
    }, [currentIndex]);

    return Scaffold(
      body: child,
      // Show drawer only on screens smaller than desktop
      drawer: ResponsiveDrawer(currentIndex: currentIndex, pages: pages),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child:
              ResponsiveAppBar(title: title, pages: pages, tabController: tabController)),
    );
  }
}

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
