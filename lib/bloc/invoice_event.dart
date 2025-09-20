import 'package:equatable/equatable.dart';

abstract class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object?> get props => [];
}

class LoadInvoices extends InvoiceEvent {
  const LoadInvoices();
}

class LoadPaidInvoices extends InvoiceEvent {
  const LoadPaidInvoices();
}

class LoadUnpaidInvoices extends InvoiceEvent {
  const LoadUnpaidInvoices();
}
