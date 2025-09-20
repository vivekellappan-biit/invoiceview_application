import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'menu_item_widget.dart';

class MenuListWidget extends StatelessWidget {
  final List<MenuItemData> menuItems;

  const MenuListWidget({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return MenuItemWidget(
            icon: menuItem.icon,
            title: menuItem.title,
            badge: menuItem.badge,
            onTap: menuItem.onTap,
            showRedBar: menuItem.showRedBar,
            textColor: menuItem.textColor,
          );
        },
      ),
    );
  }
}

class MenuItemData {
  final Widget icon;
  final String title;
  final int? badge;
  final VoidCallback onTap;
  final bool showRedBar;
  final Color? textColor;

  const MenuItemData({
    required this.icon,
    required this.title,
    this.badge,
    required this.onTap,
    this.showRedBar = false,
    this.textColor,
  });
}
