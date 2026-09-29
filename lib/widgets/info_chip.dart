import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final bool isFilled;
  final IconData? icon;

  const InfoChip({
    super.key,
    required this.label,
    this.isFilled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: isFilled ? Colors.white : AppColors.ink),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isFilled ? Colors.white : AppColors.ink,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      backgroundColor: isFilled
          ? AppColors.primary
          : AppColors.surface,
      side: isFilled
          ? BorderSide.none
          : const BorderSide(color: AppColors.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
