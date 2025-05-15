import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class NeubrutalismContainer extends StatelessWidget {
  final Color color;
  final double spreadRadius;
  final bool isHover;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const NeubrutalismContainer(
      {super.key,
      this.color = Colors.white,
      this.spreadRadius = 6,
      this.isHover = false,
      this.padding,
      required this.child});

  static Widget action({
    Key? key,
    Color color = Colors.white,
    double spreadRadius = 6,
    EdgeInsetsGeometry? padding,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    bool isHover = false;
    return StatefulBuilder(
        builder: (context, setState) => MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: onPressed,
                onHover: (value) {
                  setState(() => isHover = value);
                },
                child: NeubrutalismContainer(
                  color: color,
                  spreadRadius: spreadRadius,
                  isHover: isHover,
                  padding: padding,
                  child: child,
                ),
              ),
            ));
  }

  static Widget button(
      {Key? key,
      required Color color,
      double spreadRadius = 4,
      double width = 150,
      double height = 48,
      Widget? icon,
      required String label,
      Color? labelColor,
      required VoidCallback onPressed}) {
    bool isHover = false;
    return StatefulBuilder(
        builder: (context, setState) => SizedBox(
              width: width,
              height: height,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                    onTap: onPressed,
                    onHover: (value) {
                      setState(() => isHover = value);
                    },
                    child: NeubrutalismContainer(
                      color: color,
                      spreadRadius: spreadRadius,
                      isHover: isHover,
                      child: icon != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                icon,
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  label,
                                  style: GoogleFonts.inter(
                                      fontSize: context.isMobile ? 12 : 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: labelColor),
                                )
                              ],
                            )
                          : Text(
                              label,
                              style: GoogleFonts.inter(
                                  fontSize: context.isMobile ? 12 : 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: labelColor),
                            ),
                    )),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!isHover)
          Positioned.fill(
            top: spreadRadius,
            left: spreadRadius,
            child: Container(
                decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black,
                width: spreadRadius * .5,
              ),
            )),
          ),
        Positioned.fill(
          bottom: spreadRadius,
          right: spreadRadius,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: Colors.black,
                width: spreadRadius * .5,
              ),
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
