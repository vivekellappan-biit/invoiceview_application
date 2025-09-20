import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/invoice.dart';

class InvoiceRowWidget extends StatelessWidget {
  final Invoice invoice;
  final Color? accentColor;

  const InvoiceRowWidget({super.key, required this.invoice, this.accentColor});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(invoice.url),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            _buildInvoiceId(),
            _buildDate(),
            _buildAmount(),
            _buildActionIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceId() {
    return Expanded(
      flex: 2,
      child: Text(
        '#${invoice.id}',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Expanded(
      flex: 3,
      child: Text(
        invoice.date,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildAmount() {
    return Expanded(
      flex: 2,
      child: Text(
        invoice.amount,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildActionIcon() {
    return Expanded(
      flex: 1,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: accentColor ?? const Color(0xFF1E3A8A),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.open_in_new, color: Colors.white, size: 16),
      ),
    );
  }
}
