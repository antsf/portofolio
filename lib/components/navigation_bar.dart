import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/neubrutalism_container.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // For animations
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../providers/scroll_provider.dart';
import '../providers/theme_provider.dart';

/// NavigationBarWidget is the top navigation bar that dynamically animates
/// based on scroll position and includes hover effects for menu items.
class NavigationBarWidget extends StatefulWidget {
  /// Callbacks for navigating to different sections
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
  // bool _showNavBar = false; // Tracks whether the navbar is visible

  // @override
  // void initState() {
  //   super.initState();
  //   // Delayed initialization to create a fade-in effect
  //   Future.delayed(const Duration(milliseconds: 200), () {
  //     if (mounted) setState(() => _showNavBar = true);
  //   });
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Listen to scroll state changes from the provider
  //   final scrollState = Provider.of<ScrollState>(context);
  //   if (mounted) {
  //     setState(() {
  //       _showNavBar = scrollState.isAtTop; // Reset visibility when scrolling
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      height: Const.navigationBarHeight,
      color: Colors.transparent,
      child: _NavBar(
        onHomeTap: widget.onHomeTap,
        onProjectsTap: widget.onProjectsTap,
        onAboutTap: widget.onAboutTap,
        onContactTap: widget.onContactTap,
      )
          .animate(
              target: Provider.of<ScrollState>(context).isNavBarVisible
                  ? 1
                  : 0) // Animate the entire navbar
          .fadeIn(duration: 800.ms)
          .slideY(begin: -0.2, curve: Curves.easeInOut),
    );
  }
}

/// _NavBar is the internal widget that builds the navigation bar content,
/// including the logo and responsive menu.
class _NavBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const _NavBar({
    required this.onHomeTap,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo Text with Animation
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        InkWell(
          onTap: themeState.toggleTheme,
          splashFactory: NoSplash.splashFactory,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Mobile",
                  style: TextStyle(color: context.color.primary),
                ),
                TextSpan(
                  text: "Dev",
                  style: TextStyle(color: context.color.onSurface),
                ),
              ],
              style: GoogleFonts.spaceGrotesk(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
              .animate() // Animate the logo
              .fadeIn(duration: 600.ms, delay: 400.ms)
              .scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                curve: Curves.easeInOut,
              ),
        ),
        //     const SizedBox(
        //       width: 8,
        //     ),
        //     IconButton(
        //         icon: Icon(
        //           themeState.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        //           color: context
        //               .color.onSurface, // Change icon color based on theme
        //           size: 20,
        //         ),
        //         onPressed: themeState.toggleTheme // Toggle theme mode
        //         )
        //   ],
        // ),

        // Responsive Menu with Animation
        context.isMobile
            ? _CollapsedMenu(
                onHomeTap: onHomeTap,
                onProjectsTap: onProjectsTap,
                onAboutTap: onAboutTap,
                onContactTap: onContactTap,
              )
                .animate() // Animate the collapsed menu
                .fadeIn(duration: 600.ms)
                .slideX(begin: -0.2, curve: Curves.easeInOut)
            : _ExpandedMenu(
                onHomeTap: onHomeTap,
                onProjectsTap: onProjectsTap,
                onAboutTap: onAboutTap,
                onContactTap: onContactTap,
              )
                .animate() // Animate the expanded menu
                .fadeIn(duration: 600.ms)
                .slideX(begin: 0.2, curve: Curves.easeInOut),
      ],
    );
  }
}

/// _ExpandedMenu displays navigation items in a horizontal layout
/// for larger screens (desktop/tablet).
class _ExpandedMenu extends StatelessWidget {
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
        _NavItem(label: "Home", onTap: onHomeTap)
            .animate() // Animate the dialog appearance
            .fadeIn(duration: 400.ms, delay: 200.ms)
            .slideY(
              begin: -.3,
              end: 0,
              curve: Curves.easeInOutCubicEmphasized,
            ),
        _NavItem(label: "Projects", onTap: onProjectsTap)
            .animate() // Animate the dialog appearance
            .fadeIn(duration: 400.ms, delay: 500.ms)
            .slideY(
              begin: -.3,
              end: 0,
              curve: Curves.easeInOutCubicEmphasized,
            ),
        _NavItem(label: "About", onTap: onAboutTap)
            .animate() // Animate the dialog appearance
            .fadeIn(duration: 400.ms, delay: 800.ms)
            .slideY(
              begin: -.3,
              end: 0,
              curve: Curves.easeInOutCubicEmphasized,
            ),
        _NavItem(label: "Contact", onTap: onContactTap)
            .animate() // Animate the dialog appearance
            .fadeIn(duration: 400.ms, delay: 1100.ms)
            .slideY(
              begin: -.3,
              end: 0,
              curve: Curves.easeInOutCubicEmphasized,
            ),
      ],
    );
  }
}

/// _CollapsedMenu displays a hamburger icon that opens a dialog menu
/// for smaller screens (mobile).
class _CollapsedMenu extends StatelessWidget {
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

  /// Shows a dialog menu with navigation options
  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: context.color.surface,
          surfaceTintColor: context.color.surface,
          insetAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          insetAnimationDuration: 400.ms,
          child: SizedBox(
            height: 200,
            child: NeubrutalismContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NavItem(label: "Home", onTap: onHomeTap)
                      .animate() // Animate the dialog appearance
                      .fadeIn(duration: 400.ms, delay: 200.ms)
                      .slideX(
                        begin: -.3,
                        end: 0,
                        curve: Curves.easeInOutCubicEmphasized,
                      ),
                  _NavItem(label: "Projects", onTap: onProjectsTap)
                      .animate() // Animate the dialog appearance
                      .fadeIn(duration: 400.ms, delay: 400.ms)
                      .slideX(
                        begin: -.3,
                        end: 0,
                        curve: Curves.easeInOutCubicEmphasized,
                      ),
                  _NavItem(label: "About", onTap: onAboutTap)
                      .animate() // Animate the dialog appearance
                      .fadeIn(duration: 400.ms, delay: 600.ms)
                      .slideX(
                        begin: -.3,
                        end: 0,
                        curve: Curves.easeInOutCubicEmphasized,
                      ),
                  _NavItem(label: "Contact", onTap: onContactTap)
                      .animate() // Animate the dialog appearance
                      .fadeIn(duration: 400.ms, delay: 800.ms)
                      .slideX(
                        begin: -.3,
                        end: 0,
                        curve: Curves.easeInOutCubicEmphasized,
                      ),
                ]
                    .map((item) => SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: item,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
            .animate() // Animate the dialog appearance
            .fadeIn(duration: 400.ms)
            .slideY(
                begin: -.2,
                end: 0,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: 400.ms);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: NeubrutalismContainer.action(
          context,
          padding: const EdgeInsets.all(4),
          spreadRadius: 4,
          color: context.color.primary,
          onPressed: () => _showMenuDialog(context),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ));
  }
}

/// _NavItem represents a single navigation item with hover and click effects.
class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHover = false; // Tracks hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: () {
          if (context.isMobile) {
            Navigator.of(context).pop(); // Close the dialog on mobile
          }
          widget.onTap.call();
        },
        // onHover: (value) => setState(() => isHover = value),
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        child: Text(
          widget.label,
          style: isHover
              ? GoogleFonts.spaceGrotesk(
                  color: context.color.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : GoogleFonts.inter(
                  color: context.color.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
        )
            .animate() // Animate hover effect
            .scale(
              begin: const Offset(0.9, 0.9),
              end: const Offset(1, 1),
              curve: Curves.easeInOut,
            )
            .fadeIn(duration: 300.ms, delay: 100.ms, curve: Curves.easeInOut),
      ),
    );
  }
}
