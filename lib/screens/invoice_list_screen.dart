import 'package:flutter/material.dart';
import '../models/invoice.dart';
import '../widgets/app_header.dart';
import '../widgets/invoice_list_view.dart';
import '../constants/app_colors.dart';
import '../utils/status_bar_utils.dart';

class InvoiceListScreen extends StatelessWidget {
  final List<Invoice> invoices;
  final String title;
  final Color? accentColor;

  const InvoiceListScreen({
    super.key,
    required this.invoices,
    required this.title,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    StatusBarUtils.setDarkStatusBar();

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            AppHeader(title: title, showBackButton: true),
            Expanded(
              child: InvoiceListView(
                invoices: invoices,
                accentColor: accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
