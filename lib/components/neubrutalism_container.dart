import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class NeubrutalismContainer extends StatelessWidget {
  final Color? color;
  final double spreadRadius;
  final bool isHover;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Duration animationDuration;
  final Curve animationCurve;

  const NeubrutalismContainer({
    super.key,
    this.color,
    this.spreadRadius = 6,
    this.isHover = false,
    this.padding,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeOut,
  });

  static Widget action(
    BuildContext context, {
    Key? key,
    Color? color,
    double spreadRadius = 6,
    EdgeInsetsGeometry? padding,
    required VoidCallback onPressed,
    required Widget child,
    Duration animationDuration = const Duration(milliseconds: 150),
    Curve animationCurve = Curves.easeOut,
  }) {
    return _NeubrutalismInteractiveContainer(
      // color: color ?? context.color.surface,
      spreadRadius: spreadRadius,
      padding: padding,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      builder: (isHover) => NeubrutalismContainer(
        color: color ?? context.color.surface,
        spreadRadius: spreadRadius,
        isHover: isHover,
        padding: padding,
        animationDuration: animationDuration,
        animationCurve: animationCurve,
        child: child,
      ),
      onPressed: onPressed,
    );
  }

  static Widget button({
    Key? key,
    required Color color,
    double spreadRadius = 4,
    double width = 150,
    double height = 48,
    Widget? icon,
    required String label,
    Color? labelColor,
    required VoidCallback onPressed,
    Duration animationDuration = const Duration(milliseconds: 150),
    Curve animationCurve = Curves.easeOut,
  }) {
    return _NeubrutalismInteractiveContainer(
      // color: color,
      spreadRadius: spreadRadius,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      builder: (isHover) => SizedBox(
        width: width,
        height: height,
        child: NeubrutalismContainer(
          color: color,
          spreadRadius: spreadRadius,
          isHover: isHover,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    const SizedBox(width: 8),
                    _buttonText(label, labelColor, isHover),
                  ],
                )
              : _buttonText(label, labelColor, isHover),
        ),
      ),
      onPressed: onPressed,
    );
  }

  static Text _buttonText(String label, Color? labelColor, bool isHover) {
    return Text(
      label,
      style: isHover
          ? GoogleFonts.spaceGrotesk(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: labelColor,
            )
          : GoogleFonts.inter(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: labelColor,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow/background element
        AnimatedPositioned(
          duration: animationDuration,
          curve: animationCurve,
          top: isHover ? spreadRadius * .75 : spreadRadius,
          left: isHover ? spreadRadius * .75 : spreadRadius,
          right: isHover ? spreadRadius : 0,
          bottom: isHover ? spreadRadius : 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black,
                width: spreadRadius * 0.5,
              ),
            ),
          ),
        ),
        // Main content
        AnimatedPositioned(
          duration: animationDuration,
          curve: animationCurve,
          top: isHover ? spreadRadius : 0,
          left: isHover ? spreadRadius : 0,
          right: isHover ? 0 : spreadRadius,
          bottom: isHover ? 0 : spreadRadius,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color ?? context.color.surface,
              border: Border.all(
                color: Colors.black,
                width: spreadRadius * 0.5,
              ),
            ),
            child: Center(child: child),
          ),
        ),
      ],
    );
  }
}

class _NeubrutalismInteractiveContainer extends StatefulWidget {
  // final Color color;
  final double spreadRadius;
  final EdgeInsetsGeometry? padding;
  final Widget Function(bool isHover) builder;
  final VoidCallback onPressed;
  final Duration animationDuration;
  final Curve animationCurve;

  const _NeubrutalismInteractiveContainer({
    // required this.color,
    required this.spreadRadius,
    this.padding,
    required this.builder,
    required this.onPressed,
    required this.animationDuration,
    required this.animationCurve,
  });

  @override
  State<_NeubrutalismInteractiveContainer> createState() =>
      _NeubrutalismInteractiveContainerState();
}

class _NeubrutalismInteractiveContainerState
    extends State<_NeubrutalismInteractiveContainer> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: widget.builder(_isHover),
      ),
    );
  }
}
