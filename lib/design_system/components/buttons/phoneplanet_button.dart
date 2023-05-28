import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';

class PhoneplanetButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color loadingColor;
  final Function onTap;
  final bool outlined;
  final bool isLoading;

  const PhoneplanetButton.primary({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = PhoneplanetColors.primaryColor,
    this.loadingColor = Colors.white,
    this.outlined = false,
    this.isLoading = false,
  }) : super(key: key);

  const PhoneplanetButton.secondary({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = PhoneplanetColors.secondary,
    this.loadingColor = Colors.black,
    this.outlined = false,
    this.isLoading = false,
  }) : super(key: key);

  const PhoneplanetButton.outlined({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = Colors.transparent,
    this.loadingColor = Colors.black,
    this.outlined = true,
    this.isLoading = false,
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
              isLoading
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: loadingColor,
                      ),
                    )
                  : child,
            ],
          ),
        ),
      ),
    );
  }
}
