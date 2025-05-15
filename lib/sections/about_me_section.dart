import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: context.verticalPadding),
      color: Colors.white,
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
                ),
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
                    color: NeubrutalismColor.primaryText,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "I'm a mobile application developer with over 5 years of experience crafting high-quality apps for both Android and iOS platforms. I specialize in Flutter development, helping clients bring their ideas to life efficiently and beautifully.",
                  // textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: context.isMobile
                          ? 14
                          : context.isTablet
                              ? 16
                              : 18,
                      color: NeubrutalismColor.secondaryText,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                Text(
                  "Skills",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: NeubrutalismColor.primaryText,
                  ),
                ),
                const SizedBox(height: 10),
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _SkillChip(label: "Flutter"),
                    _SkillChip(label: "Dart"),
                    _SkillChip(label: "Firebase"),
                    _SkillChip(label: "REST APIs"),
                    _SkillChip(label: "UI/UX Design"),
                    _SkillChip(label: "Git & GitHub"),
                    _SkillChip(label: "Agile Development"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: NeubrutalismColor.primaryText, width: 2),
        // borderRadius: BorderRadius.circular(8),
        color: NeubrutalismColor.primary,
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: context.isMobile ? 12 : 14.0),
      ),
    );
  }
}
