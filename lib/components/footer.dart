import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'neubrutalism_container.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isVisible = false; // Track visibility of the footer
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('footer_section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5 && !_isVisible) {
          // Trigger animations when the footer becomes visible
          setState(() {
            _isVisible = true;
          });
        } else if (visibilityInfo.visibleFraction <= .5 && _isVisible) {
          setState(() {
            _isVisible = false; // Reset animation when not visible
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
            vertical: context.verticalPadding),
        color: NeubrutalismColor.primary,
        child: Column(
          children: [
            Text(
              "Let's Build Something Amazing Together",
              style: GoogleFonts.spaceGrotesk(
                  fontSize: context.isMobile
                      ? 24
                      : context.isTablet
                          ? 32
                          : 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
                .animate(
                    target: _isVisible ? 1 : 0) // Animate based on visibility
                .fadeIn(duration: 800.ms)
                .slideY(begin: -0.3, duration: 800.ms, curve: Curves.easeInOut),
            const SizedBox(height: 32.0),
            Text(
              "Have a mobile app idea? Let's bring it to life with modern technology and exceptional\nuser experience.",
              style: GoogleFonts.inter(
                fontSize: context.isMobile
                    ? 14
                    : context.isTablet
                        ? 16
                        : 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            )
                .animate(
                    target: _isVisible ? 1 : 0) // Animate based on visibility
                .fadeIn(duration: 1000.ms, delay: 400.ms)
                .slideY(begin: -0.3, duration: 800.ms, curve: Curves.easeInOut),
            const SizedBox(height: 32.0),
            Wrap(
              direction: context.isMobile ? Axis.vertical : Axis.horizontal,
              spacing: context.isMobile ? 10 : 16,
              children: const [
                _SocialIcon(
                  icon: FontAwesomeIcons.envelope,
                  url: "mailto:you@example.com",
                  text: 'Email Me',
                ),
                _SocialIcon(
                  icon: FontAwesomeIcons.github,
                  url: "https://github.com/yourusername ",
                  text: 'Github',
                ),
                _SocialIcon(
                  icon: FontAwesomeIcons.linkedinIn,
                  url: "https://linkedin.com/in/yourprofile ",
                  text: 'LinkedIn',
                ),
              ],
            )
                .animate(target: _isVisible ? 1 : 0) // Animate the social icons
                .fadeIn(duration: 1200.ms, delay: 800.ms)
                .slideY(begin: -0.3, duration: 800.ms, curve: Curves.easeInOut),
            const SizedBox(height: 32),
            Text(
              "© 2025 John Doe. All rights reserved.",
              style: GoogleFonts.inter(
                  color: Colors.white70, fontSize: context.isMobile ? 12 : 14),
            )
                .animate(
                    target: _isVisible ? 1 : 0) // Animate the copyright text
                .fadeIn(duration: 1400.ms, delay: 1200.ms)
                .slideY(begin: -0.3, duration: 800.ms, curve: Curves.easeInOut),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const _SocialIcon({
    required this.icon,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return NeubrutalismContainer.button(
      color: Colors.white,
      icon: FaIcon(
        icon,
        size: context.isMobile ? 14.0 : 16.0,
        color: NeubrutalismColor.primaryText,
      ),
      label: text,
      labelColor: NeubrutalismColor.primaryText,
      onPressed: () => _launchUrl(url),
    );
    // .animate() // Animate each social icon
    // .fadeIn(duration: 600.ms)
    // .scale(
    //     begin: const Offset(0, 0),
    //     end: const Offset(1, 1),
    //     curve: Curves.easeInOut);
  }

  void _launchUrl(String url) {
    // Use dart:js or url_launcher later
  }
}
