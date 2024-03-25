import '../database.dart';

class HydroLogTable extends SupabaseTable<HydroLogRow> {
  @override
  String get tableName => 'hydro_log';

  @override
  HydroLogRow createRow(Map<String, dynamic> data) => HydroLogRow(data);
}

class HydroLogRow extends SupabaseDataRow {
  HydroLogRow(super.data);

  @override
  SupabaseTable get table => HydroLogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get wo => getField<int>('wo');
  set wo(int? value) => setField<int>('wo', value);

  int? get customer => getField<int>('customer');
  set customer(int? value) => setField<int>('customer', value);

  String? get serial => getField<String>('serial');
  set serial(String? value) => setField<String>('serial', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get extDetails => getField<String>('ext_details');
  set extDetails(String? value) => setField<String>('ext_details', value);

  String? get testPressure => getField<String>('test_pressure');
  set testPressure(String? value) => setField<String>('test_pressure', value);

  bool? get vi => getField<bool>('vi');
  set vi(bool? value) => setField<bool>('vi', value);

  bool? get disposition => getField<bool>('disposition');
  set disposition(bool? value) => setField<bool>('disposition', value);

  String? get tech => getField<String>('tech');
  set tech(String? value) => setField<String>('tech', value);
}
