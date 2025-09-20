import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MenuItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final int? badge;
  final VoidCallback onTap;
  final bool showRedBar;
  final Color? textColor;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.badge,
    required this.onTap,
    this.showRedBar = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            _buildIconWithBadge(),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? AppColors.textPrimary,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            if (showRedBar) _buildRedBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithBadge() {
    return Stack(
      children: [icon, if (badge != null && badge! > 0) _buildBadge()],
    );
  }

  Widget _buildBadge() {
    return Positioned(
      right: -3,
      top: -3,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: AppColors.badgeRed,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.badgeWhite, width: 2),
        ),
        child: Center(
          child: Text(
            badge.toString(),
            style: const TextStyle(
              color: AppColors.badgeWhite,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRedBar() {
    return Container(
      width: 4,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class MenuIconWidget extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final bool showBackground;

  const MenuIconWidget({
    super.key,
    required this.iconData,
    this.color,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    if (showBackground) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!, width: 0.8),
        ),
        child: Icon(iconData, color: color ?? AppColors.iconGrey, size: 20),
      );
    } else {
      return SizedBox(
        width: 40,
        height: 40,
        child: Icon(iconData, color: color ?? AppColors.textPrimary, size: 24),
      );
    }
  }
}
