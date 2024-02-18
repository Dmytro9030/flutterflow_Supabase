import '../database.dart';

class EqptWoLisTable extends SupabaseTable<EqptWoLisRow> {
  @override
  String get tableName => 'eqptWoLis';

  @override
  EqptWoLisRow createRow(Map<String, dynamic> data) => EqptWoLisRow(data);
}

class EqptWoLisRow extends SupabaseDataRow {
  EqptWoLisRow(super.data);

  @override
  SupabaseTable get table => EqptWoLisTable();

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  String? get comment => getField<String>('Comment');
  set comment(String? value) => setField<String>('Comment', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get eqpt => getField<int>('eqpt');
  set eqpt(int? value) => setField<int>('eqpt', value);

  int? get wo => getField<int>('wo');
  set wo(int? value) => setField<int>('wo', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get items => getField<String>('items');
  set items(String? value) => setField<String>('items', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);
}
