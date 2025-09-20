import 'package:equatable/equatable.dart';

class Invoice extends Equatable {
  final String id;
  final String amount;
  final String date;
  final String url;
  final String description;

  const Invoice({
    required this.id,
    required this.amount,
    required this.date,
    required this.url,
    required this.description,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'] as String,
      amount: json['amount'] as String,
      date: json['date'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
      'url': url,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, amount, date, url, description];
}

class InvoiceResponse extends Equatable {
  final List<Invoice> paid;
  final List<Invoice> unpaid;

  const InvoiceResponse({required this.paid, required this.unpaid});

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) {
    return InvoiceResponse(
      paid: (json['paid'] as List<dynamic>)
          .map((item) => Invoice.fromJson(item as Map<String, dynamic>))
          .toList(),
      unpaid: (json['unpaid'] as List<dynamic>)
          .map((item) => Invoice.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paid': paid.map((invoice) => invoice.toJson()).toList(),
      'unpaid': unpaid.map((invoice) => invoice.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [paid, unpaid];
}
