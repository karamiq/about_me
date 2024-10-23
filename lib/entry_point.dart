import 'package:about_me/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/responsive_appbar.dart';
import 'components/responsive_drawer.dart';
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
      body: Padding(
        padding: Insets.mediumAll,
        child: child,
      ),
      drawer: ResponsiveDrawer(currentIndex: currentIndex, pages: pages),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child:
              ResponsiveAppBar(title: title, pages: pages, tabController: tabController)),
    );
  }
}
