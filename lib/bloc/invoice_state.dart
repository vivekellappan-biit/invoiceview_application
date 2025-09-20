import 'package:equatable/equatable.dart';
import '../models/invoice.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object?> get props => [];
}

class InvoiceInitial extends InvoiceState {
  const InvoiceInitial();
}

class InvoiceLoading extends InvoiceState {
  const InvoiceLoading();
}

class InvoiceLoaded extends InvoiceState {
  final List<Invoice> paidInvoices;
  final List<Invoice> unpaidInvoices;

  const InvoiceLoaded({
    required this.paidInvoices,
    required this.unpaidInvoices,
  });

  @override
  List<Object?> get props => [paidInvoices, unpaidInvoices];
}

class InvoiceError extends InvoiceState {
  final String message;

  const InvoiceError({required this.message});

  @override
  List<Object?> get props => [message];
}
