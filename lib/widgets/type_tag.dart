import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class TypeTag extends StatelessWidget {
  final String type;

  const TypeTag({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.typeColor(type),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
