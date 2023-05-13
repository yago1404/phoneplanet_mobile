import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';

abstract class PhoneplanetTextStyles {
  // Titles
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bigTitle =  TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle smallTitle =  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Labels
  static const TextStyle label =  TextStyle(
    fontSize: 14,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: PhoneplanetColors.grey,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 12,
  );
}
