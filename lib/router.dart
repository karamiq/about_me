import 'package:go_router/go_router.dart';
import 'package:about_me/entry_point.dart';
import 'package:about_me/pages/projects_page.dart';
import 'package:about_me/pages/services_page.dart';
import 'package:about_me/pages/about_me_page.dart';

import 'pages/contact_me_page.dart';

final appRouter = GoRouter(
  initialLocation: Routes.contactMe,
  routes: [
    // Defining the shell route for the layout
    ShellRoute(
      builder: (context, state, child) => EntryPoint(child),
      routes: [
        GoRoute(
          path: Routes.contactMe,
          builder: (context, state) => const ContactMePage(),
        ),
        GoRoute(
          path: Routes.projects,
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(
          path: Routes.services,
          builder: (context, state) => const ServicesPage(),
        ),
        GoRoute(
          path: Routes.aboutMe,
          builder: (context, state) => const AboutMePage(),
        ),
      ],
    ),
  ],
);

class Routes {
  static const projects = '/projects';
  static const services = '/services';
  static const aboutMe = '/about-me';
  static const contactMe = '/contact-me';
}
