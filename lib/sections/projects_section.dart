import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import 'package:flutter_portfolio/utils/extensions.dart';

import '../components/neubrutalism_container.dart';
import '../constants/colors.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Project> _projects = [
    Project(
      title: "E-Commerce App",
      description:
          "A fully-featured Flutter e-commerce app with cart, checkout, and Firebase backend.",
      imageUrl: 'assets/images/project1.jpg',
    ),
    Project(
      title: "Task Manager",
      description:
          "A productivity app built with Hive local database and state management.",
      imageUrl: 'assets/images/project2.jpg',
    ),
    Project(
      title: "Weather App",
      description:
          "Real-time weather updates using OpenWeatherMap API with beautiful animations.",
      imageUrl: 'assets/images/project3.png',
    ),
    Project(
      title: "Fitness Tracker",
      description:
          "Tracks workouts, steps, and calories burned using sensors and Google Fit integration.",
      imageUrl: 'assets/images/project4.jpg',
    ),
  ];

  bool _isTitleVisible = false; // Track visibility of the title

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Listen to the ValueNotifier from HomePage
  //   // final isAtTopNotifier =
  //   //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
  //   // if (isAtTopNotifier != null) {
  //   //   isAtTopNotifier.addListener(_handleScrollReset);
  //   // }

  //   // Listen to the ScrollState provider
  //   final scrollState = Provider.of<ScrollState>(context);
  //   scrollState.addListener(_handleScrollReset);
  // }

  // @override
  // void dispose() {
  //   // Stop listening to the ValueNotifier
  //   // final isAtTopNotifier =
  //   //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
  //   // if (isAtTopNotifier != null) {
  //   //   isAtTopNotifier.removeListener(_handleScrollReset);
  //   // }

  //   final scrollState = Provider.of<ScrollState>(context, listen: false);
  //   scrollState
  //       .removeListener(_handleScrollReset); // Stop listening to scroll state
  //   super.dispose();
  // }

  // // Handler for resetting animations
  // void _handleScrollReset() {
  //   setState(() {
  //     _isTitleVisible = false; // Reset visibility
  //   });
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     setState(() {
  //       _isTitleVisible = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: context.verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VisibilityDetector(
            key: const Key('project_title'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > .3 && !_isTitleVisible) {
                setState(() {
                  _isTitleVisible = true; // Trigger animation when visible
                });
              } else if (visibilityInfo.visibleFraction <= .3 &&
                  _isTitleVisible) {
                setState(() {
                  _isTitleVisible = false; // Reset animation when not visible
                });
              }
            },
            child: Text(
              "Featured Projects",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: NeubrutalismColor.primaryText,
              ),
            )
                .animate(
                    target:
                        _isTitleVisible ? 1 : 0) // Animate only when visible
                .fadeIn(duration: 800.ms)
                .slide(begin: const Offset(0, 0.2), curve: Curves.easeInOut),
          ),
          const SizedBox(height: 40),
          _GridLayout(projects: _projects),
        ],
      ),
    );
  }
}

class _GridLayout extends StatefulWidget {
  const _GridLayout({required this.projects});
  final List<Project> projects;

  @override
  State<_GridLayout> createState() => _GridLayoutState();
}

class _GridLayoutState extends State<_GridLayout> {
  final List<bool> _isVisible = []; // Track visibility of each card

  @override
  void initState() {
    super.initState();
    _isVisible.addAll(List.filled(
        widget.projects.length, false)); // Initialize visibility list
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Listen to the ValueNotifier from HomePage
  //   // final isAtTopNotifier =
  //   //     (context.findAncestorStateOfType<MainPageState>())?.isAtTopNotifier;
  //   // if (isAtTopNotifier != null) {
  //   //   isAtTopNotifier.addListener(_handleScrollReset);
  //   // }

  //   final scrollState = Provider.of<ScrollState>(context);
  //   scrollState.addListener(_handleScrollReset);
  // }

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
  //     _isVisible.clear(); // Reset visibility
  //   });
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     setState(() {
  //       _isVisible.addAll(List.filled(
  //           widget.projects.length, false)); // Initialize visibility list
  //     });
  //   });
  // }

  // Widget _projectCard(Project project, int index) {
  //   return VisibilityDetector(
  //     key: Key('project_cards_$index'),
  //     onVisibilityChanged: (visibilityInfo) {
  //       if (visibilityInfo.visibleFraction > 0.5 && !_isVisible[index]) {
  //         setState(() {
  //           _isVisible[index] = true; // Trigger animation when visible
  //         });
  //       }
  //     },
  //     child: NeubrutalismContainer.action(
  //       onPressed: () {},
  //       padding: const EdgeInsets.all(20.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Flexible(
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(4),
  //               child: Image.asset(
  //                 project.imageUrl,
  //                 width: double.infinity,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           Text(
  //             project.title,
  //             style: GoogleFonts.spaceGrotesk(
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //               color: NeubrutalismColor.primaryText,
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           Text(
  //             project.description,
  //             style: GoogleFonts.inter(
  //               fontSize: 14,
  //               color: NeubrutalismColor.secondaryText,
  //             ),
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ],
  //       ),
  //     )
  //         .animate(
  //             target: _isVisible[index] ? 1 : 0) // Animate only when visible
  //         .fadeIn(duration: 600.ms + (index * 200).ms)
  //         .slide(
  //             begin: context.isMobile
  //                 ? const Offset(-0.2, 0)
  //                 : const Offset(0, 0.2),
  //             curve: Curves.easeInOut),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 1;
    double childAspectRatio = 1;

    if (context.isTablet) {
      crossAxisCount = 2;
      childAspectRatio = 1.2; // Adjust as needed for tablet
    } else if (context.isDesktop) {
      crossAxisCount = 3;
      childAspectRatio = 1;
    }

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: widget.projects.length,
        itemBuilder: (context, index) => VisibilityDetector(
              key: Key('project_cards_$index'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > .5 && !_isVisible[index]) {
                  setState(() {
                    _isVisible[index] = true; // Trigger animation when visible
                  });
                } else if (visibilityInfo.visibleFraction <= .5 &&
                    _isVisible[index]) {
                  setState(() {
                    _isVisible[index] =
                        false; // Reset animation when not visible
                  });
                }
              },
              child: _ProjectCard(project: widget.projects[index])
                  .animate(
                      target: _isVisible[index]
                          ? 1
                          : 0) // Animate only when visible
                  .fadeIn(duration: 600.ms + (index * 200).ms)
                  .slide(
                      begin: context.isMobile
                          ? const Offset(-0.2, 0)
                          : const Offset(0, 0.2),
                      curve: Curves.easeInOut),
            ));
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return NeubrutalismContainer.action(
        onPressed: () {},
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  project.imageUrl,
                  width: double.infinity,
                  // height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              project.title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: NeubrutalismColor.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              project.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: NeubrutalismColor.secondaryText,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ));
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
