import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String appVersion;

  const UserProfileWidget({
    super.key,
    required this.name,
    required this.email,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                email,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.05,
                ),
              ),
              const Spacer(),
              Text(
                '${AppStrings.appVersionPrefix}$appVersion',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.05,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
