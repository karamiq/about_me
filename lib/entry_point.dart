import 'package:about_me/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'utils/constants/sizes.dart';

class EntryPoint extends HookWidget {
  const EntryPoint(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // List of routes to match with tabs
    final pages = [
      Routes.contactMe,
      Routes.projects,
      Routes.services,
      Routes.aboutMe
    ];

    // Create a TabController with length 4
    final tabController = useTabController(initialLength: 4);

    // Get the current location to sync tab index with route
    final currentIndex = pages.indexOf(
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath);

    // Update the tab index when the route changes
    useEffect(() {
      tabController.index = currentIndex != -1 ? currentIndex : 0;
      return null;
    }, [currentIndex]);

    return Scaffold(
      body: child,
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Align(
            alignment: Alignment.centerRight, // Align to the right
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, // Adjust width
              child: TabBar(
                onTap: (value) => GoRouter.of(context)
                    .go(pages[value]), // Navigate on tab tap
                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                controller: tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                
                labelPadding: Insets.extraSmallAll,
                indicator: BoxDecoration(
                  borderRadius: BorderSize.extraLargeRadius,
                  color: Theme.of(context).colorScheme.primary,
                  
                ),
                labelColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.all(10),
                tabs: const [
                  Tab(text: 'Contact Me'),
                  Tab(text: 'Projects'),
                  Tab(text: 'Services'),
                  Tab(text: 'About Me'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
