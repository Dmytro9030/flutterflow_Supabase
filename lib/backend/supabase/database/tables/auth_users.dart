import '../database.dart';

class AuthUsersTable extends SupabaseTable<AuthUsersRow> {
  @override
  String get tableName => 'auth_users';

  @override
  AuthUsersRow createRow(Map<String, dynamic> data) => AuthUsersRow(data);
}

class AuthUsersRow extends SupabaseDataRow {
  AuthUsersRow(super.data);

  @override
  SupabaseTable get table => AuthUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);
}
