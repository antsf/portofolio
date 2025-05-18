import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'package:flutter_portfolio/components/neubrutalism_container.dart';
import 'package:flutter_portfolio/utils/extensions.dart';

// import 'constants/colors.dart';
import 'components/cool_refresh.dart';
import 'providers/scroll_provider.dart';
import 'providers/theme_provider.dart';
import 'sections/about_me_section.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';
import 'components/navigation_bar.dart';
import 'components/footer.dart';
import 'theme/app_theme.dart';
import 'utils/scroll_behavior.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ScrollState()),
      ChangeNotifierProvider(create: (_) => ThemeState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to theme changes from the provider
    final themeState = Provider.of<ThemeState>(context);
    return MaterialApp(
      title: 'Arfi Antasofa - Portfolio',
      theme: (themeState.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme)
          .copyWith(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const MainPage(),
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false, // Optional: to hide debug banner
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  // GlobalKeys for each section to enable scrolling to them
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // ScrollController for smooth scrolling
  final ScrollController _scrollController = ScrollController();
  // bool _isNavBarVisible = true; // Tracks whether the navbar is visible
  double _previousScrollOffset = 0; // Tracks the previous scroll position

  // ValueNotifier to track if the user is at the top
  // final ValueNotifier<bool> _isAtTopNotifier = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  /// Handles scroll events to update navigation bar visibility and theme state
  void _onScroll() {
    final currentScrollOffset = _scrollController.offset;
    final scrollState = Provider.of<ScrollState>(context, listen: false);

    // Update navigation bar visibility based on scroll direction
    if (currentScrollOffset > _previousScrollOffset) {
      // Scrolling down
      if (scrollState.isNavBarVisible) {
        scrollState.setNavBarVisible(false);
      }
    } else {
      // Scrolling up
      if (!scrollState.isNavBarVisible) {
        scrollState.setNavBarVisible(true);
      }
    }

    // Update whether the user is at the top of the page
    if (currentScrollOffset < context.screenHeight * 0.5 &&
        !scrollState.isAtTop) {
      scrollState.setAtTop(true); // User is at the top
    } else if (currentScrollOffset > context.screenHeight * 0.5 &&
        scrollState.isAtTop) {
      scrollState.setAtTop(false); // User has scrolled down
    }

    _previousScrollOffset = currentScrollOffset;
  }

  /// Smoothly scrolls to a specific section
  Future<void> scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: 800.ms,
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  /// Scrolls to the top of the page
  void _scrollToTop() {
    _scrollController.animateTo(
      0, // Scroll to the top
      duration: 800.ms,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollState = Provider.of<ScrollState>(context);

    return Scaffold(
        // Floating Action Button for "Back to Top"
        floatingActionButton: scrollState.isNavBarVisible
            ? null
            : SizedBox(
                width: 50,
                height: 50,
                child: NeubrutalismContainer.action(
                  context,
                  spreadRadius: 4,
                  onPressed: _scrollToTop,
                  child: const Icon(Icons.arrow_upward),
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // body: WebSmoothScroll(
        //   controller: _scrollController,
        //   scrollSpeed: 1, // Adjust scroll speed
        //   scrollAnimationLength: 1200, // Animation duration in milliseconds
        //   curve: Curves.easeInOutCirc, // Easing curve for smoothness
        body: CustomScrollView(
          controller: _scrollController, // Attach the ScrollController
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            if (!scrollState.isNavBarVisible)
              MyCupertinoRefreshControl(
                onRefresh: () async {
                  Future.delayed(800.ms, () {
                    // Perform your refresh logic here
                    // For example, fetch new data or update the UI
                    Provider.of<ScrollState>(context, listen: false)
                        .setNavBarVisible(true);
                  });
                },
              )
            else
              // Sticky Navigation Bar
              SliverAppBar(
                pinned: true,
                // snap: true,
                backgroundColor: scrollState.isNavBarVisible
                    ? context.color.surface
                    : Colors.transparent,
                surfaceTintColor: scrollState.isNavBarVisible
                    ? context.color.surface
                    : Colors.transparent,
                title: NavigationBarWidget(
                  onHomeTap: () => scrollToSection(_homeKey),
                  onProjectsTap: () => scrollToSection(projectsKey),
                  onAboutTap: () => scrollToSection(_aboutKey),
                  onContactTap: () => scrollToSection(contactKey),
                ),
                titleSpacing: 0,
                elevation: 8,
                shadowColor: scrollState.isNavBarVisible
                    ? Colors.black.withOpacity(0.3)
                    : Colors.transparent,
              ),

            // Assign the GlobalKeys to your section widgets
            SliverToBoxAdapter(child: HomeSection(key: _homeKey)),
            SliverToBoxAdapter(child: ProjectsSection(key: projectsKey)),
            SliverToBoxAdapter(child: AboutMeSection(key: _aboutKey)),
            SliverToBoxAdapter(child: Footer(key: contactKey)),
          ],
          // ),
        ));
  }
}
