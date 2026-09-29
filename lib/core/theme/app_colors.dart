import 'package:flutter/material.dart';

class AppColors {
  static const Color ink = Color(0xFF20332A);
  static const Color inkSoft = Color(0xFF64736A);
  static const Color primary = Color(0xFF2D6A4F);
  static const Color accent = Color(0xFFE5A83B);
  static const Color mist = Color(0xFFF1F5ED);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color outline = Color(0xFFD7E1D5);
  static const Color danger = Color(0xFFE53935);

  static Color typeColor(String type) {
    switch (type.toLowerCase()) {
      case 'mammal':
        return const Color(0xFF9A6216);
      case 'reptile':
        return const Color(0xFF3E7C59);
      case 'bird':
        return const Color(0xFF2E86AB);
      case 'dog':
        return const Color(0xFF7A5C99);
      default:
        return primary;
    }
  }
}
