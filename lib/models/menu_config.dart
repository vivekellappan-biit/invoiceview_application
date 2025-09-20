import 'package:flutter/material.dart';
import 'package:invoiceview_application/widgets/menu_list_widget.dart';
import '../widgets/menu_item_widget.dart';
import '../screens/invoice_list_screen.dart';

class MenuConfig {
  final String id;
  final IconData iconData;
  final String title;
  final Color? iconColor;
  final Color? textColor;
  final bool showBackground;
  final MenuAction action;

  const MenuConfig({
    required this.id,
    required this.iconData,
    required this.title,
    this.iconColor,
    this.textColor,
    this.showBackground = false,
    required this.action,
  });

  MenuItemData toMenuItemData(BuildContext context, dynamic state) {
    return MenuItemData(
      icon: MenuIconWidget(
        iconData: iconData,
        color: iconColor,
        showBackground: showBackground,
      ),
      title: title,
      textColor: textColor,
      onTap: () => action.execute(context, state),
    );
  }
}

abstract class MenuAction {
  void execute(BuildContext context, dynamic state);
}

class NavigateToInvoiceListAction extends MenuAction {
  final String title;
  final Color accentColor;
  final bool isPaid;

  NavigateToInvoiceListAction({
    required this.title,
    required this.accentColor,
    required this.isPaid,
  });

  @override
  void execute(BuildContext context, dynamic state) {
    final invoices = isPaid ? state.paidInvoices : state.unpaidInvoices;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InvoiceListScreen(
          invoices: invoices,
          title: title,
          accentColor: accentColor,
        ),
      ),
    );
  }
}

class ShowComingSoonAction extends MenuAction {
  @override
  void execute(BuildContext context, dynamic state) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Coming Soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
