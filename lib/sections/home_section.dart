import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import 'package:provider/provider.dart';

import '../components/neubrutalism_container.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../providers/scroll_provider.dart';
import '../utils/extensions.dart'; // Import the extensions file

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the isMobile, isTablet, and isDesktop extensions
    final isMobile = context.isMobile;
    final isTablet = context.isTablet;
    // final isDesktop = context.isDesktop;

    // Calculate padding based on screen size
    final horizontalPadding = context.horizontalPadding;
    final verticalPadding =
        context.isMobile ? context.screenHeight * 0.1 : .0; // Adjust as needed

    return Container(
      key: const Key('home_section'),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      color: Colors.white,
      height:
          isMobile ? null : context.screenHeight - Const.navigationBarHeight,
      child:
          // Use a Column for the main layout, and adjust children based on screen size
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (isMobile)
          //   _MainContent(isMobile: isMobile, isTablet: isTablet)
          // else
          // Hero Image and Squares Row
          Flex(
            // Use Flex instead of Row
            direction: isMobile
                ? Axis.vertical
                : Axis.horizontal, // Vertical on mobile, horizontal on others
            children: [
              _MainContent(isMobile: isMobile, isTablet: isTablet),
              // Show the squares grid only on tablet and desktop
              if (!isMobile) ...[const Spacer(), _RightSide(isTablet: isTablet)]
            ],
          ),
        ],
      ),
    );
  }
}

class _MainContent extends StatefulWidget {
  const _MainContent({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  State<_MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<_MainContent> {
  bool _isVisible = false; // Track visibility of the section

  @override
  void initState() {
    setState(() {
      if (mounted) _isVisible = true; // Initialize visibility to true
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen to the ValueNotifier from HomePage
    // final isAtTopNotifier =
    //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
    // if (isAtTopNotifier != null) {
    //   isAtTopNotifier.addListener(_handleScrollReset);
    // }

    final scrollState = Provider.of<ScrollState>(context);
    // scrollState.addListener(_handleScrollReset);
    if (mounted) {
      setState(() {
        _isVisible = scrollState.isAtTop; // Reset visibility
      });
    }
  }

  // @override
  // void dispose() {
  //   // Stop listening to the ValueNotifier
  //   // final isAtTopNotifier =
  //   //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
  //   // if (isAtTopNotifier != null) {
  //   //   isAtTopNotifier.removeListener(_handleScrollReset);
  //   // }

  //   final scrollState = Provider.of<ScrollState>(context, listen: false);
  //   scrollState.removeListener(_handleScrollReset);
  //   super.dispose();
  // }

  // // Handler for resetting animations
  // void _handleScrollReset() {
  //   setState(() {
  //     _isVisible = false; // Reset visibility
  //   });
  //   Future.delayed(const Duration(milliseconds: 1000), () {
  //     setState(() {
  //       _isVisible = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _ExpandedWrapper(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brief Introduction
          Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Crafting Mobile Experiences That ',
                  style: TextStyle(
                    color: NeubrutalismColor.primaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Matter',
                  style: TextStyle(color: NeubrutalismColor.primary),
                ),
              ],
              style: GoogleFonts.spaceGrotesk(
                fontSize: widget.isMobile
                    ? 40
                    : widget.isTablet
                        ? 40
                        : 56,
                fontWeight: FontWeight.bold,
                color: NeubrutalismColor.primaryText,
              ),
            ),
            key: const Key('intro_title'),
            textAlign: TextAlign.start,
          )
              .animate(target: _isVisible ? 1 : 0) // Use flutter_animate
              .fadeIn(duration: 800.ms)
              .slide(begin: const Offset(-0.1, 0), curve: Curves.easeOutExpo),
          const SizedBox(height: 20),
          // Description Text
          Text(
            'Transform your ideas into powerful mobile applications with modern technology and exceptional user experience.',
            style: GoogleFonts.inter(
              fontSize: widget.isMobile
                  ? 18
                  : widget.isTablet
                      ? 18
                      : 20,
              fontWeight: FontWeight.w500,
              color: NeubrutalismColor.secondaryText,
              height: 1.6,
            ),
            key: const Key('intro_description'),
            textAlign: TextAlign.left,
          )
              .animate(target: _isVisible ? 1 : 0) // Use flutter_animate
              .fadeIn(duration: 800.ms, delay: 400.ms)
              .slide(begin: const Offset(-0.1, 0), curve: Curves.easeOutExpo),

          const SizedBox(height: 30),
          // Call-to-Action Buttons Row
          Wrap(
            alignment:
                widget.isMobile ? WrapAlignment.center : WrapAlignment.start,
            spacing: 16,
            runSpacing: 10,
            children: [
              NeubrutalismContainer.button(
                key: const Key('view_projects_button'),
                width: widget.isMobile ? 120 : 150,
                color: NeubrutalismColor.primary,
                spreadRadius: 4,
                label: 'View Projects',
                labelColor: Colors.white,
                onPressed: () {},
              ),
              NeubrutalismContainer.button(
                key: const Key('contact_me_button'),
                width: widget.isMobile ? 120 : 150,
                color: Colors.white,
                onPressed: () async {
                  // Removed url_launcher
                },
                label: 'Contact Me',
              ),
            ],
          )
              .animate(target: _isVisible ? 1 : 0) // Use flutter_animate
              .fadeIn(duration: 800.ms, delay: 800.ms)
              .slide(begin: const Offset(-0.1, 0), curve: Curves.easeOutExpo),
        ],
      ),
    );
  }
}

class _RightSide extends StatefulWidget {
  const _RightSide({
    required this.isTablet,
  });

  final bool isTablet;

  @override
  State<_RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<_RightSide> {
  bool _isVisible = false; // Track visibility of the section

  @override
  void initState() {
    setState(() {
      if (mounted) _isVisible = true; // Initialize visibility to true
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen to the ValueNotifier from HomePage
    // final isAtTopNotifier =
    //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
    // if (isAtTopNotifier != null) {
    //   isAtTopNotifier.addListener(_handleScrollReset);
    // }

    final scrollState = Provider.of<ScrollState>(context);
    if (mounted) {
      setState(() {
        _isVisible = scrollState.isAtTop; // Reset visibility
      });
    }
    // scrollState.addListener(_handleScrollReset);
  }

  // @override
  // void dispose() {
  //   // Stop listening to the ValueNotifier
  //   // final isAtTopNotifier =
  //   //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
  //   // if (isAtTopNotifier != null) {
  //   //   isAtTopNotifier.removeListener(_handleScrollReset);
  //   // }

  //   final scrollState = Provider.of<ScrollState>(context, listen: false);
  //   scrollState.removeListener(_handleScrollReset);
  //   super.dispose();
  // }

  // // Handler for resetting animations
  // void _handleScrollReset() {
  //   setState(() {
  //     _isVisible = false; // Reset visibility
  //   });
  //   Future.delayed(const Duration(milliseconds: 1000), () {
  //     setState(() {
  //       _isVisible = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _ExpandedWrapper(
      flex: widget.isTablet ? 4 : 3, // Adjust flex for desktop
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        // Responsive padding
        padding: EdgeInsets.symmetric(vertical: widget.isTablet ? 20 : 60.0),
        children: [
          const NeubrutalismContainer(
            child: Icon(Icons.smartphone,
                size: 60.0, color: NeubrutalismColor.primary),
          ).animate(target: _isVisible ? 1 : 0).fadeIn(duration: 800.ms).slide(
              begin: const Offset(0, 0.2),
              curve: Curves.easeOut), //animate widget
          const NeubrutalismContainer(
            color: NeubrutalismColor.primary,
            child: Icon(Icons.rocket, size: 60.0, color: Colors.white),
          )
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 800.ms, delay: 400.ms)
              .slide(
                  begin: const Offset(0, 0.2),
                  curve: Curves.easeOut), //animate widget
          const NeubrutalismContainer(
            color: Color(0xFFE9471C),
            child: Icon(Icons.code, size: 60.0, color: Colors.white),
          )
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 800.ms, delay: 800.ms)
              .slide(
                  begin: const Offset(0, 0.2),
                  curve: Curves.easeOut), //animate widget
          NeubrutalismContainer(
            color: const Color(0xFFE0E0E0),
            child: Text('5+',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 40,
                    color: NeubrutalismColor.primaryText,
                    fontWeight: FontWeight.bold)),
          )
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 800.ms, delay: 1200.ms)
              .slide(
                  begin: const Offset(0, 0.2),
                  curve: Curves.easeOut), //animate widget
        ],
      ),
    );
  }
}

class _ExpandedWrapper extends StatelessWidget {
  final Widget child;
  final int flex;

  const _ExpandedWrapper({super.key, required this.child, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? child : Expanded(flex: flex, child: child);
  }
}
