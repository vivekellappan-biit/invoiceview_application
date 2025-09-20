import 'package:flutter/material.dart';
import '../models/invoice.dart';
import '../constants/app_colors.dart';
import 'invoice_row_widget.dart';

class InvoiceListView extends StatelessWidget {
  final List<Invoice> invoices;
  final Color? accentColor;

  const InvoiceListView({super.key, required this.invoices, this.accentColor});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      itemCount: invoices.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: AppColors.borderGrey),
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return InvoiceRowWidget(invoice: invoice, accentColor: accentColor);
      },
    );
  }
}
