import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(super.data);

  @override
  SupabaseTable get table => CommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get customer => getField<int>('customer');
  set customer(int? value) => setField<int>('customer', value);

  int? get createdBy => getField<int>('createdBy');
  set createdBy(int? value) => setField<int>('createdBy', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get creator => getField<String>('creator');
  set creator(String? value) => setField<String>('creator', value);

  int? get workOrder => getField<int>('work_order');
  set workOrder(int? value) => setField<int>('work_order', value);
}
