import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

List<String> _skills = [
  "Flutter",
  "Dart",
  "Firebase",
  "REST APIs",
  "GraphQL",
  "Git",
  "Agile/Scrum",
];

class _AboutMeSectionState extends State<AboutMeSection> {
  bool _isVisible = false; // Track visibility of the section
  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return VisibilityDetector(
      key: const Key('about_me_section'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5 && !_isVisible) {
          // Trigger animations when the section becomes visible
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
        color: context.color.surface,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset(
                    'assets/images/profile.png', // Replace with your image
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 300,
                  )
                      .animate(
                          target:
                              _isVisible ? 1 : 0) // Animate based on visibility
                      .fadeIn(duration: 800.ms)
                      .slideX(
                          begin: -0.3,
                          duration: 800.ms,
                          curve: Curves.easeInOut),
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: context.color.onSurface,
                    ),
                  )
                      .animate(
                          target:
                              _isVisible ? 1 : 0) // Animate based on visibility
                      .fadeIn(duration: 600.ms, delay: 400.ms)
                      .slideY(
                          begin: -0.3,
                          duration: 600.ms,
                          delay: 200.ms,
                          curve: Curves.easeInOut),
                  const SizedBox(height: 20),
                  Text(
                    "I'm a mobile application developer with over 5 years of experience crafting high-quality apps for both Android and iOS platforms. I specialize in Flutter development, helping clients bring their ideas to life efficiently and beautifully.",
                    style: GoogleFonts.inter(
                        fontSize: context.isMobile
                            ? 14
                            : context.isTablet
                                ? 16
                                : 18,
                        color: context.color.secondary,
                        fontWeight: FontWeight.w500),
                  )
                      .animate(
                          target:
                              _isVisible ? 1 : 0) // Animate based on visibility
                      .fadeIn(duration: 800.ms, delay: 800.ms)
                      .slideY(
                          begin: -0.3,
                          duration: 800.ms,
                          delay: 400.ms,
                          curve: Curves.easeInOut),
                  const SizedBox(height: 30),
                  Text(
                    "Skills",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: context.color.onSurface,
                    ),
                  )
                      .animate(
                          target:
                              _isVisible ? 1 : 0) // Animate based on visibility
                      .fadeIn(duration: 1000.ms, delay: 1200.ms)
                      .slideY(begin: -0.3, curve: Curves.easeInOut),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _skills
                        .map((skill) => _SkillChip(label: skill))
                        .toList(),
                  )
                      .animate(
                          target:
                              _isVisible ? 1 : 0) // Animate based on visibility
                      .fadeIn(duration: 1200.ms, delay: 1400.ms)
                      .slideY(begin: -0.2, curve: Curves.easeInOut),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isVisible = false; // Track visibility of the chip

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('skill_chip_${widget.label}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.1 && !_isVisible) {
          // Trigger animations when the chip becomes visible
          setState(() {
            _isVisible = true;
          });
        } else if (visibilityInfo.visibleFraction <= 0.5 && _isVisible) {
          setState(() {
            _isVisible = false; // Reset animation when not visible
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: NeubrutalismColor.primaryText, width: 2),
          color: context.color.primary,
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: context.isMobile ? 12 : 14.0),
        ),
      )
          .animate(
              target:
                  _isVisible ? 1 : 0) // Skill chips are animated independently
          .fadeIn(duration: 1400.ms)
          .scale(
              begin: const Offset(0, 0),
              end: const Offset(1, 1),
              curve: Curves.easeInOut),
    );
  }
}
