import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/neubrutalism_container.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/scroll_provider.dart';

class NavigationBarWidget extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const NavigationBarWidget({
    super.key,
    required this.onHomeTap,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  bool _showNavBar = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() => _showNavBar = true);
    });
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
        _showNavBar = scrollState.isAtTop; // Reset visibility
      });
    }
    // scrollState.addListener(_handleScrollReset);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      height: Const.navigationBarHeight,
      // color: NeubrutalismColor.primary.withAlpha(10),
      child: _NavBar(
        onHomeTap: widget.onHomeTap,
        onProjectsTap: widget.onProjectsTap,
        onAboutTap: widget.onAboutTap,
        onContactTap: widget.onContactTap,
      )
          .animate(target: _showNavBar ? 1 : 0) // Animate the entire navbar
          .fadeIn(duration: 800.ms)
          .slideY(begin: -0.2, curve: Curves.easeInOut),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    required this.onHomeTap,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  final VoidCallback onHomeTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo Text with Animation
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
        ))
            .animate() // Animate the logo
            .fadeIn(duration: 600.ms, delay: 400.ms)
            .scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                curve: Curves.easeInOut),

        // Responsive Menu with Animation
        context.isMobile
            ? _CollapsedMenu(
                onHomeTap: onHomeTap,
                onProjectsTap: onProjectsTap,
                onAboutTap: onAboutTap,
                onContactTap: onContactTap,
              )
                .animate() // Animate the collapsed menu
                .fadeIn(duration: 800.ms)
                .slideX(begin: -0.2, curve: Curves.easeInOut)
            : _ExpandedMenu(
                onHomeTap: onHomeTap,
                onProjectsTap: onProjectsTap,
                onAboutTap: onAboutTap,
                onContactTap: onContactTap,
              )
                .animate() // Animate the expanded menu
                .fadeIn(duration: 800.ms)
                .slideX(begin: 0.2, curve: Curves.easeInOut),
      ],
    );
  }
}

class _ExpandedMenu extends StatelessWidget {
  // Callbacks for tapping navigation items
  final VoidCallback onHomeTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const _ExpandedMenu({
    required this.onHomeTap,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32, // Spacing between navigation items
      children: [
        _NavItem(label: "Home", onTap: onHomeTap),
        _NavItem(label: "Projects", onTap: onProjectsTap),
        _NavItem(label: "About", onTap: onAboutTap),
        _NavItem(
            label: "Contact",
            onTap: onContactTap), // Assumes a contact section/handler
      ],
    );
  }
}

class _CollapsedMenu extends StatelessWidget {
  // Callbacks for tapping navigation items
  final VoidCallback onHomeTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const _CollapsedMenu({
    required this.onHomeTap,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

//   @override
//   _CollapsedMenuState createState() => _CollapsedMenuState();
// }

// class _CollapsedMenuState extends State<_CollapsedMenu> {
//   bool _isMenuOpen = false;

  // Helper function to close the menu and then navigate
  void _closeMenuAndNavigate(
      BuildContext context, VoidCallback navigationAction) {
    // if (mounted) {
    //   // Check if the widget is still in the tree
    //   setState(() {
    //     _isMenuOpen = false;
    //   });
    // }

    Navigator.of(context).pop();

    // Add a small delay to allow the menu to visually close before scrolling
    Future.delayed(const Duration(milliseconds: 100), () {
      navigationAction();
    });
  }

  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Optional rounded corners
          elevation: 0,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.122).withOpacity(.3),
          child: SizedBox(
            height: 200,
            child: NeubrutalismContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Fit content
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  _NavItem(
                      label: "Home",
                      onTap: () {
                        _closeMenuAndNavigate(
                            context,
                            // Navigator.of(context).pop(); // Close the dialog
                            onHomeTap);
                      }),
                  _NavItem(
                      label: "Projects",
                      onTap: () {
                        _closeMenuAndNavigate(context, onProjectsTap);
                      }),
                  _NavItem(
                      label: "About",
                      onTap: () {
                        _closeMenuAndNavigate(context, onAboutTap);
                      }),
                  _NavItem(
                      label: "Contact",
                      onTap: () {
                        _closeMenuAndNavigate(context, onContactTap);
                      }),
                ]
                    .map((item) => SizedBox(
                          // Wrap item in SizedBox for consistent width and padding
                          width:
                              double.infinity, // Make each item take full width
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: item,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Explicit height for the touch target
      width: 40, // Explicit width for the touch target
      child:
          // Stack(
          //   alignment: Alignment.centerRight,
          //   children: [
          // Hamburger Icon Button
          NeubrutalismContainer.action(
        padding: const EdgeInsets.all(4), // Padding inside the button
        spreadRadius: 4, // Shadow spread
        color: NeubrutalismColor.primary,
        onPressed: () {
          // setState(() {
          //   _isMenuOpen = !_isMenuOpen;
          // });
          _showMenuDialog(context);
        },
        child: const Icon(
          // _isMenuOpen ? Icons.close :
          Icons.menu, // Change icon based on state
          color: Colors.white, // Icon color
        ),
      ),
      // Collapsed Menu Items (Displayed when _isMenuOpen is true)
      // if (_isMenuOpen)
      //   Positioned(
      //     // Position the menu below the navigation bar
      //     // Adjust 'top' if your Const.navigationBarHeight is different or if there's other padding/margin
      //     top: Const.navigationBarHeight -
      //         10, // Slightly adjusted for better visual alignment
      //     right: 0,
      //     child: Container(
      //       width: 200, // Width of the dropdown menu
      //       decoration: BoxDecoration(
      //         color: Colors.white, // Background color for the menu
      //         border: Border.all(
      //             color: NeubrutalismColor.primaryText,
      //             width: 2), // Neubrutalist border
      //         boxShadow: const [
      //           // Neubrutalist shadow
      //           BoxShadow(
      //             color: Colors.black,
      //             offset: Offset(2, 2),
      //             blurRadius: 0,
      //           )
      //         ],
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min, // Fit content
      //         crossAxisAlignment:
      //             CrossAxisAlignment.start, // Align text to the left
      //         children: [
      //           _NavItem(
      //               label: "Home",
      //               onTap: () => _closeMenuAndNavigate(widget.onHomeTap)),
      //           _NavItem(
      //               label: "Projects",
      //               onTap: () =>
      //                   _closeMenuAndNavigate(widget.onProjectsTap)),
      //           _NavItem(
      //               label: "About",
      //               onTap: () => _closeMenuAndNavigate(widget.onAboutTap)),
      //           _NavItem(
      //               label: "Contact",
      //               onTap: () =>
      //                   _closeMenuAndNavigate(widget.onContactTap)),
      //         ]
      //             .map((item) => SizedBox(
      //                   // Wrap item in SizedBox for consistent width and padding
      //                   width: double
      //                       .infinity, // Make each item take full width of the menu
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         vertical: 12, horizontal: 16),
      //                     child: item,
      //                   ),
      //                 ))
      //             .toList(),
      //       ),
      //     ),
      //   ),
      //   ],
      // ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) {
          setState(() => isHover = value);
        },
        child: Text(
          widget.label,
          style: isHover
              ? GoogleFonts.spaceGrotesk(
                  color: NeubrutalismColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : GoogleFonts.inter(
                  color: NeubrutalismColor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
        )
            .animate() // Animate hover effect
            .scale(
                begin: const Offset(0.2, 0),
                end: const Offset(1, 1),
                curve: Curves.easeInOut)
            .fadeIn(duration: 300.ms, delay: 100.ms, curve: Curves.easeInOut),
      ),
    );
  }
}
