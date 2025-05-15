import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/neubrutalism_container.dart';
import '../constants/colors.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('projects'),
      padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: context.verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Projects",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: NeubrutalismColor.primaryText,
            ),
          ),
          const SizedBox(height: 40),
          // LayoutBuilder(
          //   builder: (context, constraints) {
          //     if (context.isMobile) {
          //       return _buildColumnLayout();
          //     } else {
          //       return _buildGridLayout(context, constraints);
          //     }
          //   },
          // ),
          _buildGridLayout(context)
        ],
      ),
    );
  }

  Widget _buildGridLayout(BuildContext context) {
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
      itemCount: _projects.length,
      itemBuilder: (context, index) => _ProjectCard(project: _projects[index]),
    );
  }

  // Widget _buildColumnLayout() {
  //   return Column(
  //       children: List.generate(
  //           _projects.length,
  //           (index) => _ProjectCard(
  //                 project: _projects[index],
  //               )));
  // }
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
      ),
    );
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
