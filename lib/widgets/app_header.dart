import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;

  const AppHeader({
    super.key,
    required this.title,
    this.onBackPressed,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 60 + statusBarHeight,
      decoration: const BoxDecoration(color: AppColors.primaryBlue),
      child: Stack(
        children: [
          if (showBackButton)
            Positioned(
              left: 16,
              top: statusBarHeight,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 18,
                  ),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                ),
              ),
            ),
          Positioned(
            top: statusBarHeight,
            left: 0,
            right: 0,
            height: 60,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
