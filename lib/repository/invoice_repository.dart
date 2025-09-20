import '../models/invoice.dart';

class InvoiceRepository {
  // Hardcoded JSON data as requested
  static const Map<String, dynamic> _hardcodedData = {
    "paid": [
      {
        "id": "5708161",
        "amount": "\$542.24",
        "date": "May 12th, 2025",
        "url": "https://example.com/invoice/5708161",
        "description": "Invoice for May services",
      },
      {
        "id": "5708165",
        "amount": "\$1,200.00",
        "date": "April 28th, 2025",
        "url": "https://example.com/invoice/5708165",
        "description": "Monthly subscription invoice",
      },
      {
        "id": "5708168",
        "amount": "\$850.50",
        "date": "April 15th, 2025",
        "url": "https://example.com/invoice/5708168",
        "description": "Service charge invoice",
      },
    ],
    "unpaid": [
      {
        "id": "5708169",
        "amount": "\$142.24",
        "date": "May 19th, 2025",
        "url": "https://example.com/invoice/5708169",
        "description": "Outstanding payment for May",
      },
      {
        "id": "5708170",
        "amount": "\$2,100.00",
        "date": "May 25th, 2025",
        "url": "https://example.com/invoice/5708170",
        "description": "Premium service invoice",
      },
    ],
  };

  Future<InvoiceResponse> getInvoices() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return InvoiceResponse.fromJson(_hardcodedData);
  }

  Future<List<Invoice>> getPaidInvoices() async {
    final response = await getInvoices();
    return response.paid;
  }

  Future<List<Invoice>> getUnpaidInvoices() async {
    final response = await getInvoices();
    return response.unpaid;
  }
}
