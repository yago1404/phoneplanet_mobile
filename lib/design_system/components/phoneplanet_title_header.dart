import 'package:flutter/material.dart';

import '../phoneplanet_colors.dart';
import '../styles/phoneplanet_text_styles.dart';

class PhoneplanetTitleHeader extends StatelessWidget {
  final String title;
  final String label;

  const PhoneplanetTitleHeader({
    Key? key,
    required this.title,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 30,
        top: 30 + MediaQuery.of(context).padding.top,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PhoneplanetColors.primaryColor[800]!,
            PhoneplanetColors.primaryColor[900]!,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PhoneplanetTextStyles.bigTitle.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: PhoneplanetTextStyles.label.copyWith(
              color: PhoneplanetColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
