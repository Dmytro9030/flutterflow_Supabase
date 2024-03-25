import '../database.dart';

class TicketsTable extends SupabaseTable<TicketsRow> {
  @override
  String get tableName => 'tickets';

  @override
  TicketsRow createRow(Map<String, dynamic> data) => TicketsRow(data);
}

class TicketsRow extends SupabaseDataRow {
  TicketsRow(super.data);

  @override
  SupabaseTable get table => TicketsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  int? get owner => getField<int>('owner');
  set owner(int? value) => setField<int>('owner', value);

  int? get customer => getField<int>('customer');
  set customer(int? value) => setField<int>('customer', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  DateTime? get deadline => getField<DateTime>('deadline');
  set deadline(DateTime? value) => setField<DateTime>('deadline', value);

  DateTime? get ffUpDate => getField<DateTime>('ff_up_date');
  set ffUpDate(DateTime? value) => setField<DateTime>('ff_up_date', value);
}
