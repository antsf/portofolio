import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/neubrutalism_container.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
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
    final verticalPadding = context.isMobile ? 32.0 : .0; // Adjust as needed

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
          if (isMobile)
            _MainContent(isMobile: isMobile, isTablet: isTablet)
          else
            // Hero Image and Squares Row
            Row(
              // Use Flex instead of Row
              // direction: isMobile
              //     ? Axis.vertical
              //     : Axis.horizontal, // Vertical on mobile, horizontal on others
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: isMobile ? 20 : 0), // Add padding for mobile
                    child: _MainContent(isMobile: isMobile, isTablet: isTablet),
                  ),
                ),
                // Show the squares grid only on tablet and desktop
                const Spacer(),
                _RightSide(isTablet: isTablet)
              ],
            ),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Ensure text is left-aligned
      children: [
        // Brief Introduction
        Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Crafting Mobile Experiences That ',
                  style: TextStyle(
                      color: NeubrutalismColor.primaryText,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Matter',
                  style: TextStyle(color: NeubrutalismColor.primary),
                ),
              ],
              style: GoogleFonts.spaceGrotesk(
                // Responsive font size
                fontSize: isMobile
                    ? 40
                    : isTablet
                        ? 40
                        : 56,
                fontWeight: FontWeight.bold,
                color: NeubrutalismColor.primaryText,
              ),
            ),
            key: const Key('intro_title'),
            textAlign: TextAlign.start),
        const SizedBox(height: 20),
        Text(
            'Transform your ideas into powerful mobile applications with modern technology and exceptional user experience.',
            style: GoogleFonts.inter(
              // Responsive font size
              fontSize: isMobile
                  ? 18
                  : isTablet
                      ? 18
                      : 20,
              fontWeight: FontWeight.w500,
              color: NeubrutalismColor.secondaryText,
              height: 1.6,
            ),
            key: const Key('intro_description'),
            textAlign: TextAlign.left),
        const SizedBox(height: 30),
        // Call-to-Action Buttons Row
        Wrap(
          // Use Wrap for buttons on mobile
          alignment: isMobile
              ? WrapAlignment.center
              : WrapAlignment.start, // Center on mobile
          spacing: 16,
          runSpacing: 10,
          children: [
            NeubrutalismContainer.button(
              key: const Key('view_projects_button'),
              width: isMobile ? 120 : 150,
              color: NeubrutalismColor.primary,
              spreadRadius: 4,
              label: 'View Projects',
              labelColor: Colors.white,
              onPressed: () {},
            ),
            NeubrutalismContainer.button(
              key: const Key('contact_me_button'),
              width: isMobile ? 120 : 150,
              color: Colors.white,
              onPressed: () async {
                // Removed url_launcher
              },
              label: 'Contact Me',
            ),
          ],
        ),
      ],
    );
  }
}

class _RightSide extends StatelessWidget {
  const _RightSide({
    required this.isTablet,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isTablet ? 4 : 3, // Adjust flex for desktop
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        // Responsive padding
        padding: EdgeInsets.symmetric(vertical: isTablet ? 20 : 60.0),
        children: [
          const NeubrutalismContainer(
            child: Icon(Icons.smartphone,
                size: 60.0, color: NeubrutalismColor.primary),
          ),
          const NeubrutalismContainer(
            color: NeubrutalismColor.primary,
            child: Icon(Icons.rocket, size: 60.0, color: Colors.white),
          ),
          const NeubrutalismContainer(
            color: Color(0xFFE9471C),
            child: Icon(Icons.code, size: 60.0, color: Colors.white),
          ),
          NeubrutalismContainer(
            color: const Color(0xFFE0E0E0),
            child: Text('5+',
                style: GoogleFonts.spaceGrotesk(
                    fontSize: 40,
                    color: NeubrutalismColor.primaryText,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
