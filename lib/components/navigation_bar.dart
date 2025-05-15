import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/neubrutalism_container.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:js/js.dart';

import '../constants/constants.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      height: Const.navigationBarHeight,
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
            children: const [
              TextSpan(
                  text: "Mobile", style: TextStyle(color: Color(0xFFAC84F5))),
              TextSpan(
                text: "Dev",
                style: TextStyle(color: Color(0xFF1E2129)),
              ),
            ],
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
          // Use a ternary operator to show either the expanded or collapsed menu
          context.isMobile ? const _CollapsedMenu() : const _ExpandedMenu(),
        ],
      ),
    );
  }
}

class _ExpandedMenu extends StatelessWidget {
  const _ExpandedMenu();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 32,
      children: [
        _NavItem(label: "Home", scrollTo: '#home'),
        _NavItem(label: "Projects", scrollTo: '#projects'),
        _NavItem(label: "About", scrollTo: '#about'),
        _NavItem(label: "Contact", scrollTo: '#contact'),
      ],
    );
  }
}

class _CollapsedMenu extends StatefulWidget {
  const _CollapsedMenu();

  @override
  _CollapsedMenuState createState() => _CollapsedMenuState();
}

class _CollapsedMenuState extends State<_CollapsedMenu> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // Hamburger Icon
          NeubrutalismContainer.action(
            padding: const EdgeInsets.all(4),
            spreadRadius: 4,
            color: NeubrutalismColor.primary,
            onPressed: () {
              setState(() {
                _isMenuOpen = !_isMenuOpen;
              });
            },
            child: const Icon(
                Icons.menu), // You can use a different icon if you prefer
          ),
          // Collapsed Menu Items (Displayed when _isMenuOpen is true)
          if (_isMenuOpen)
            Positioned(
              top: Const
                  .navigationBarHeight, // Position below the navigation bar
              right: 0,
              child: Container(
                width: 200, // Adjust as needed
                decoration: const BoxDecoration(
                  color: Colors.white, // Background color for the menu
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _NavItem(label: "Home", scrollTo: '#home'),
                    const _NavItem(label: "Projects", scrollTo: '#projects'),
                    const _NavItem(label: "About", scrollTo: '#about'),
                    const _NavItem(label: "Contact", scrollTo: '#contact'),
                  ]
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: item,
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

@JS('scrollToSection')
external void scrollToSection(String id);

class _NavItem extends StatefulWidget {
  final String label;
  final String scrollTo;

  const _NavItem({required this.label, required this.scrollTo});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          scrollToSection(widget.scrollTo);
          // Handle smooth scrolling in web using js
        },
        onHover: (value) {
          setState(() => isHover = value);
        },
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
              color: isHover
                  ? NeubrutalismColor.primary
                  : NeubrutalismColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
