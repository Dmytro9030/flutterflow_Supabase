import '../database.dart';

class RequestsTable extends SupabaseTable<RequestsRow> {
  @override
  String get tableName => 'requests';

  @override
  RequestsRow createRow(Map<String, dynamic> data) => RequestsRow(data);
}

class RequestsRow extends SupabaseDataRow {
  RequestsRow(super.data);

  @override
  SupabaseTable get table => RequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get company => getField<int>('company');
  set company(int? value) => setField<int>('company', value);

  String? get requester => getField<String>('requester');
  set requester(String? value) => setField<String>('requester', value);

  String? get form => getField<String>('form');
  set form(String? value) => setField<String>('form', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
