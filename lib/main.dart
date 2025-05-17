import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'package:flutter_portfolio/components/neubrutalism_container.dart';
import 'package:flutter_portfolio/utils/extensions.dart';

import 'constants/colors.dart';
import 'providers/scroll_provider.dart';
import 'sections/about_me_section.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';
import 'components/navigation_bar.dart';
import 'components/footer.dart';
import 'theme/app_theme.dart';
import 'utils/scroll_behavior.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ScrollState(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Doe - Portfolio',
      theme: AppTheme.lightTheme.copyWith(
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
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // ScrollController for smooth scrolling
  final ScrollController _scrollController = ScrollController();
  bool _isNavBarVisible = true; // Tracks whether the navbar is visible
  double _previousScrollOffset = 0; // Tracks the previous scroll position

  // ValueNotifier to track if the user is at the top
  final ValueNotifier<bool> isAtTopNotifier = ValueNotifier(true);

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

  // Function to handle scroll events
  void _onScroll() {
    final currentScrollOffset = _scrollController.offset;

    // // Update the ValueNotifier when the user scrolls to the top
    // if (currentScrollOffset == 0 && !isAtTopNotifier.value) {
    //   isAtTopNotifier.value = true;
    //   // _resetAnimations();
    // } else if (currentScrollOffset > 0 && isAtTopNotifier.value) {
    //   isAtTopNotifier.value = false;
    // }

    final scrollState = Provider.of<ScrollState>(context, listen: false);

    // Update the isAtTop state based on the scroll position
    if (currentScrollOffset < context.screenHeight * .5 &&
        !scrollState.isAtTop) {
      scrollState.setAtTop(true); // User is at the top
    } else if (currentScrollOffset > context.screenHeight * .5 &&
        scrollState.isAtTop) {
      scrollState.setAtTop(false); // User has scrolled down
    }

    // Handle navigation bar visibility
    if (currentScrollOffset > _previousScrollOffset) {
      // Scrolling down
      if (_isNavBarVisible) {
        setState(() => _isNavBarVisible = false);
      }
    } else {
      // Scrolling up
      if (!_isNavBarVisible) {
        setState(() => _isNavBarVisible = true);
      }
    }
    _previousScrollOffset = currentScrollOffset;
  }

  // Function to smoothly scroll to a given section
  Future<void> _scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        alignment: 0.0,
      );
    }
  }

  // Function to scroll to the top of the page
  void _scrollToTop() {
    _scrollController.animateTo(
      0, // Scroll to the top
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  // Function to reset animations in all sections
  // void _resetAnimations() {
  //   // Reset animations for each section
  //   _resetHomeSectionAnimation();
  //   _resetProjectsSectionAnimation();
  //   _resetAboutMeSectionAnimation();
  //   _resetFooterAnimation();
  // }

  // void _resetHomeSectionAnimation() {
  //   final homeSectionState = _homeKey.currentState;
  //   if (homeSectionState is HomeSectionState) {
  //     homeSectionState.resetAnimations();
  //   }
  // }

  // void _resetProjectsSectionAnimation() {
  //   final projectsSectionState = _projectsKey.currentState;
  //   if (projectsSectionState is ProjectsSectionState) {
  //     projectsSectionState.resetAnimations();
  //   }
  // }

  // void _resetAboutMeSectionAnimation() {
  //   final aboutMeSectionState = _aboutKey.currentState;
  //   if (aboutMeSectionState is AboutMeSectionState) {
  //     aboutMeSectionState.resetAnimations();
  //   }
  // }

  // void _resetFooterAnimation() {
  //   final footerState = _contactKey.currentState;
  //   if (footerState is FooterState) {
  //     footerState.resetAnimations();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Floating Action Button for "Back to Top"
        floatingActionButton: _isNavBarVisible
            ? null
            : SizedBox(
                width: 50,
                height: 50,
                child: NeubrutalismContainer.action(
                  spreadRadius: 4,
                  onPressed: _scrollToTop,
                  child: const Icon(Icons.arrow_upward),
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: WebSmoothScroll(
          controller: _scrollController,
          scrollSpeed: 5, // Adjust scroll speed
          scrollAnimationLength: 800, // Animation duration in milliseconds
          curve: Curves.easeInOutCirc, // Easing curve for smoothness
          child: CustomScrollView(
            controller: _scrollController, // Attach the ScrollController
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              // Sticky Navigation Bar
              if (_isNavBarVisible)
                SliverAppBar(
                  pinned: true,
                  // snap: true,
                  backgroundColor: Colors.white,
                  title: NavigationBarWidget(
                    onHomeTap: () => _scrollToSection(_homeKey),
                    onProjectsTap: () => _scrollToSection(_projectsKey),
                    onAboutTap: () => _scrollToSection(_aboutKey),
                    onContactTap: () => _scrollToSection(_contactKey),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.1),
                ),
              // Assign the GlobalKeys to your section widgets
              SliverToBoxAdapter(child: HomeSection(key: _homeKey)),
              SliverToBoxAdapter(child: ProjectsSection(key: _projectsKey)),
              SliverToBoxAdapter(child: AboutMeSection(key: _aboutKey)),
              SliverToBoxAdapter(child: Footer(key: _contactKey)),
            ],
          ),
        ));
  }
}
