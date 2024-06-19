import 'package:flutter/material.dart';
import 'package:laywer_desk/styles.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
      this.useLightGradient = true,
      this.showAsGradientBorder = false,
      required this.child});
  final bool useLightGradient;
  final bool showAsGradientBorder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: showAsGradientBorder ? const EdgeInsets.all(2) : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: showAsGradientBorder ? Colors.white : null),
        child: child,
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: GradientContainer(
            child: Text(
          label,
          style: const MediumTextStyle(color: Colors.white, isBold: true),
        )));
  }
}

class GradientWidget extends StatelessWidget {
  const GradientWidget(
      {super.key, required this.child,
        this.style,
      });

  final Widget child;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}



