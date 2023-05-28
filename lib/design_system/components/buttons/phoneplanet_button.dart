import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';

class PhoneplanetButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onTap;
  final bool outlined;

  const PhoneplanetButton.primary({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = PhoneplanetColors.primaryColor,
    this.outlined = false,
  }) : super(key: key);

  const PhoneplanetButton.secondary({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = PhoneplanetColors.secondary,
    this.outlined = false,
  }) : super(key: key);

  const PhoneplanetButton.outlined({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = Colors.transparent,
    this.outlined = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: outlined
              ? Border.all(color: PhoneplanetColors.grey, width: 1)
              : null,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              child,
            ],
          ),
        ),
      ),
    );
  }
}
