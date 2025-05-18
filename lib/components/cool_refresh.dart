// import 'dart:math';

import 'package:flutter/cupertino.dart';
// For animations
// import 'package:flutter_svg/flutter_svg.dart'; //for the svg
// import 'package:flutter/material.dart' as material;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_portfolio/utils/extensions.dart';

// class _RefreshIndicatorPainter extends CustomPainter {
//   final RefreshIndicatorMode refreshState;
//   final double progress;

//   _RefreshIndicatorPainter({
//     required this.refreshState,
//     required this.progress,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = material.Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.0;

//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2 * 0.8;

//     switch (refreshState) {
//       case RefreshIndicatorMode.drag:
//         // Draw an arrow pointing down
//         final path = Path();
//         path.moveTo(center.dx, center.dy - radius * 0.5);
//         path.lineTo(center.dx, center.dy + radius * 0.5);
//         path.moveTo(center.dx - radius * 0.2, center.dy + radius * 0.2);
//         path.lineTo(center.dx, center.dy + radius * 0.5);
//         path.lineTo(center.dx + radius * 0.2, center.dy + radius * 0.2);
//         canvas.drawPath(path, paint..strokeWidth = 2.0 * progress);

//         // Draw a circle that fills as you pull
//         canvas.drawArc(
//           Rect.fromCircle(center: center, radius: radius),
//           -pi / 2,
//           2 * pi * progress,
//           false,
//           paint,
//         );
//         break;

//       // case RefreshIndicatorMode.armed:
//       //   // Draw a spinning arrow
//       //   canvas.drawArc(
//       //     Rect.fromCircle(center: center, radius: radius),
//       //     -pi / 2,
//       //     2 * pi * 0.75,
//       //     false,
//       //     paint,
//       //   );
//       //   // Arrow head
//       //   final path = Path();
//       //   path.moveTo(
//       //       center.dx + radius * cos(pi / 4), center.dy + radius * sin(pi / 4));
//       //   path.lineTo(center.dx + radius * 0.7 * cos(pi / 4 + 0.2),
//       //       center.dy + radius * 0.7 * sin(pi / 4 + 0.2));
//       //   path.lineTo(center.dx + radius * 0.7 * cos(pi / 4 - 0.2),
//       //       center.dy + radius * 0.7 * sin(pi / 4 - 0.2));
//       //   path.close();
//       //   canvas.drawPath(path, paint..style = PaintingStyle.fill);
//       //   break;

//       case RefreshIndicatorMode.refresh:
//         // Draw a spinning circle
//         final animation = AlwaysStoppedAnimation(progress);
//         final sweepAngle =
//             2 * pi * (1 - Curves.easeInOut.transform(animation.value));
//         canvas.drawArc(
//           Rect.fromCircle(center: center, radius: radius),
//           -pi / 2 + 2 * pi * animation.value,
//           sweepAngle,
//           false,
//           paint,
//         );
//         break;

//       case RefreshIndicatorMode.done:
//         // Draw a checkmark
//         final path = Path();
//         path.moveTo(center.dx - radius * 0.3, center.dy);
//         path.lineTo(center.dx - radius * 0.1, center.dy + radius * 0.2);
//         path.lineTo(center.dx + radius * 0.3, center.dy - radius * 0.2);
//         canvas.drawPath(path, paint..strokeWidth = 3.0);
//         // Draw a circle around it
//         canvas.drawCircle(center, radius, paint..style = PaintingStyle.stroke);
//         break;

//       default:
//         break;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _RefreshIndicatorPainter oldDelegate) {
//     return oldDelegate.refreshState != refreshState ||
//         oldDelegate.progress != progress;
//   }
// }

class MyCupertinoRefreshControl extends StatelessWidget {
  const MyCupertinoRefreshControl({
    super.key,
    required this.onRefresh,
    // this.backgroundColor,
    // this.indicatorColor,
  });

  final RefreshCallback onRefresh;
  // final Color? backgroundColor;
  // final Color? indicatorColor;

  // late AnimationController _pullController;
  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: () async {
        await Future.delayed(2000.ms, onRefresh);
      },
      builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance,
          refreshIndicatorExtent) {
        return Container(
          height: context.screenWidth * .3,
          color: context.color.surface,
          alignment: Alignment.center,
          child: _RefreshIndicatorContent(
            refreshState: refreshState,
            pulledExtent: pulledExtent,
            refreshTriggerPullDistance: refreshTriggerPullDistance,
          ),

          // child: CustomPaint(
          //   size: const Size(80, 80),
          //   painter: _RefreshIndicatorPainter(
          //     refreshState: refreshState,
          //     progress: refreshState == RefreshIndicatorMode.drag
          //         ? pulledExtent / refreshTriggerPullDistance
          //         : 1.0,
          //   ),
          // ),
        );
      },
    );
  }
}

class _RefreshIndicatorContent extends StatelessWidget {
  final RefreshIndicatorMode refreshState;
  final double pulledExtent;
  final double refreshTriggerPullDistance;

  const _RefreshIndicatorContent({
    required this.refreshState,
    required this.pulledExtent,
    required this.refreshTriggerPullDistance,
  });

  @override
  Widget build(BuildContext context) {
    return refreshState == RefreshIndicatorMode.refresh
        ? Image.asset(
            'assets/icons/refresh-travel.gif', // Your loading animation GIF
            // width: 80,
            // height: 80,
            fit: BoxFit.fill,
          )
        : const SizedBox();
    // switch (refreshState) {
    //   case RefreshIndicatorMode.inactive:
    //     return const SizedBox();

    //   // case RefreshIndicatorMode.drag:
    //   //   return Opacity(
    //   //     opacity: pulledExtent / refreshTriggerPullDistance,
    //   //     child: Image.asset(
    //   //       'assets/refresh_pull.gif', // Your pull-down animation GIF
    //   //       width: 80,
    //   //       height: 80,
    //   //       fit: BoxFit.contain,
    //   //     ),
    //   //   );

    //   // case RefreshIndicatorMode.armed:
    //   //   return Image.asset(
    //   //     'assets/refresh_release.gif', // Your release-to-refresh animation GIF
    //   //     width: 80,
    //   //     height: 80,
    //   //     fit: BoxFit.contain,
    //   //   );

    //   case RefreshIndicatorMode.refresh:
    //     return Image.asset(
    //       'assets/icons/refresh-travel.gif', // Your loading animation GIF
    //       width: 80,
    //       height: 80,
    //       fit: BoxFit.contain,
    //     );

    //   // case RefreshIndicatorMode.done:
    //   //   return Image.asset(
    //   //     'assets/refresh_complete.gif', // Your success animation GIF
    //   //     width: 80,
    //   //     height: 80,
    //   //     fit: BoxFit.contain,
    //   //   );

    //   default:
    //     return const SizedBox();
    // }
  }
}
