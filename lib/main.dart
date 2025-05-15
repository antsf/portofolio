import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sections/home_section.dart';
import 'sections/about_me_section.dart';
import 'sections/projects_section.dart';
// import 'sections/contact_section.dart';
import 'components/navigation_bar.dart';
import 'components/footer.dart';
import 'theme/app_theme.dart';
import 'utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Doe - Portfolio',
      theme: AppTheme.darkTheme.copyWith(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const HomePage(),
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: NavigationBarWidget()),
          const SliverToBoxAdapter(child: HomeSection()),
          SliverToBoxAdapter(child: ProjectsSection()),
          const SliverToBoxAdapter(child: AboutMeSection()),
          // const SliverToBoxAdapter(child: ContactSection()),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }
}
