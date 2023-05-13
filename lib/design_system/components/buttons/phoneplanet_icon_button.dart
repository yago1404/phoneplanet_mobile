import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';

class PhoneplanetIconButton extends StatelessWidget {
  final Widget icon;
  final Color borderColor;
  final Color backgroundColor;
  final Function? onPressed;

  const PhoneplanetIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.borderColor = PhoneplanetColors.grey,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  const PhoneplanetIconButton.primary({
    Key? key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = PhoneplanetColors.primaryColor,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed?.call(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
