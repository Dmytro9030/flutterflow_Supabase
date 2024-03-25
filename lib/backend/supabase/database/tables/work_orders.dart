import '../database.dart';

class WorkOrdersTable extends SupabaseTable<WorkOrdersRow> {
  @override
  String get tableName => 'workOrders';

  @override
  WorkOrdersRow createRow(Map<String, dynamic> data) => WorkOrdersRow(data);
}

class WorkOrdersRow extends SupabaseDataRow {
  WorkOrdersRow(super.data);

  @override
  SupabaseTable get table => WorkOrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  PostgresTime? get startTime => getField<PostgresTime>('startTime');
  set startTime(PostgresTime? value) =>
      setField<PostgresTime>('startTime', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get woNum => getField<String>('woNum');
  set woNum(String? value) => setField<String>('woNum', value);

  int? get itemLis => getField<int>('itemLis');
  set itemLis(int? value) => setField<int>('itemLis', value);

  int? get customer => getField<int>('customer');
  set customer(int? value) => setField<int>('customer', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  PostgresTime? get endTime => getField<PostgresTime>('endTime');
  set endTime(PostgresTime? value) => setField<PostgresTime>('endTime', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get tech => getField<int>('tech');
  set tech(int? value) => setField<int>('tech', value);

  String? get invoiceNum => getField<String>('invoiceNum');
  set invoiceNum(String? value) => setField<String>('invoiceNum', value);

  bool? get deficienciesFound => getField<bool>('deficienciesFound');
  set deficienciesFound(bool? value) =>
      setField<bool>('deficienciesFound', value);

  bool? get estimateNeeded => getField<bool>('estimateNeeded');
  set estimateNeeded(bool? value) => setField<bool>('estimateNeeded', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);

  String? get statusNotes => getField<String>('status_notes');
  set statusNotes(String? value) => setField<String>('status_notes', value);

  String? get subtype => getField<String>('subtype');
  set subtype(String? value) => setField<String>('subtype', value);

  DateTime? get dateInvoiced => getField<DateTime>('date_invoiced');
  set dateInvoiced(DateTime? value) =>
      setField<DateTime>('date_invoiced', value);

  DateTime? get followUpDate => getField<DateTime>('follow_up_date');
  set followUpDate(DateTime? value) =>
      setField<DateTime>('follow_up_date', value);

  int? get comment => getField<int>('comment');
  set comment(int? value) => setField<int>('comment', value);

  double? get invoiceAmt => getField<double>('invoice_amt');
  set invoiceAmt(double? value) => setField<double>('invoice_amt', value);

  String? get invoiceLink => getField<String>('invoice_link');
  set invoiceLink(String? value) => setField<String>('invoice_link', value);

  DateTime? get datePaid => getField<DateTime>('date_paid');
  set datePaid(DateTime? value) => setField<DateTime>('date_paid', value);
}
