import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';
import 'package:phoneplanet/design_system/styles/phoneplanet_text_styles.dart';

class PhoneplanetSelectButton extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Widget? icon;
  final Function? onTap;

  const PhoneplanetSelectButton({
    Key? key,
    required this.isSelected,
    required this.label,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : PhoneplanetColors.grey,
          ),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: PhoneplanetTextStyles.smallText.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
