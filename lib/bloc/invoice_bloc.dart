import 'package:bloc/bloc.dart';
import '../repository/invoice_repository.dart';
import 'invoice_event.dart';
import 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final InvoiceRepository _repository;

  InvoiceBloc({required InvoiceRepository repository})
    : _repository = repository,
      super(const InvoiceInitial()) {
    on<LoadInvoices>(_onLoadInvoices);
    on<LoadPaidInvoices>(_onLoadPaidInvoices);
    on<LoadUnpaidInvoices>(_onLoadUnpaidInvoices);
  }

  Future<void> _onLoadInvoices(
    LoadInvoices event,
    Emitter<InvoiceState> emit,
  ) async {
    try {
      emit(const InvoiceLoading());
      final response = await _repository.getInvoices();
      emit(
        InvoiceLoaded(
          paidInvoices: response.paid,
          unpaidInvoices: response.unpaid,
        ),
      );
    } catch (e) {
      emit(InvoiceError(message: e.toString()));
    }
  }

  Future<void> _onLoadPaidInvoices(
    LoadPaidInvoices event,
    Emitter<InvoiceState> emit,
  ) async {
    try {
      emit(const InvoiceLoading());
      final paidInvoices = await _repository.getPaidInvoices();
      emit(InvoiceLoaded(paidInvoices: paidInvoices, unpaidInvoices: const []));
    } catch (e) {
      emit(InvoiceError(message: e.toString()));
    }
  }

  Future<void> _onLoadUnpaidInvoices(
    LoadUnpaidInvoices event,
    Emitter<InvoiceState> emit,
  ) async {
    try {
      emit(const InvoiceLoading());
      final unpaidInvoices = await _repository.getUnpaidInvoices();
      emit(
        InvoiceLoaded(paidInvoices: const [], unpaidInvoices: unpaidInvoices),
      );
    } catch (e) {
      emit(InvoiceError(message: e.toString()));
    }
  }
}
