import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'neubrutalism_container.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ),
          const SizedBox(height: 32.0),
          Text(
            "Have a mobile app idea? Let's bring it to life with modern technology and exceptional\nuser experience.",
            style: GoogleFonts.inter(
              fontSize: context.isMobile
                  ? 14
                  : context.isTablet
                      ? 16
                      : 18,
              // fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "© 2025 John Doe. All rights reserved.",
          //       style: TextStyle(
          //         color: Colors.white70,
          //         fontFamily: 'Poppins',
          //       ),
          //     ),
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
          ),
          const SizedBox(height: 32),
          Text(
            "© 2025 John Doe. All rights reserved.",
            style: GoogleFonts.inter(
                color: Colors.white70, fontSize: context.isMobile ? 12 : 14),
          ),
        ],
      ),
      //   ],
      // ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const _SocialIcon(
      {required this.icon, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return NeubrutalismContainer.button(
        color: Colors.white,
        // icon: Image.asset(
        //   "assets/icons/$icon.png",
        //   width: context.isMobile ? 14.0 : 16.0,
        // ),
        icon: FaIcon(
          icon,
          size: context.isMobile ? 14.0 : 16.0,
          color: NeubrutalismColor.primaryText,
        ),
        label: text,
        labelColor: NeubrutalismColor.primaryText,
        onPressed: () => _launchUrl(url));
    // return MouseRegion(
    //   cursor: SystemMouseCursors.click,
    //   child: GestureDetector(
    //     onTap: () => _launchUrl(url),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(color: Colors.white, width: 2),
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       padding: const EdgeInsets.all(8),
    //       child: Row(
    //         children: [Icon(icon, color: Colors.white, size: 20), Text(text, style: GoogleFonts.inter(fontSize: 12.0))],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _launchUrl(String url) {
    // Use dart:js or url_launcher later
  }
}
