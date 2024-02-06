import '../database.dart';

class ExtinguisherCatalogTable extends SupabaseTable<ExtinguisherCatalogRow> {
  @override
  String get tableName => 'extinguisherCatalog';

  @override
  ExtinguisherCatalogRow createRow(Map<String, dynamic> data) =>
      ExtinguisherCatalogRow(data);
}

class ExtinguisherCatalogRow extends SupabaseDataRow {
  ExtinguisherCatalogRow(super.data);

  @override
  SupabaseTable get table => ExtinguisherCatalogTable();

  String? get brand => getField<String>('Brand');
  set brand(String? value) => setField<String>('Brand', value);

  String? get size => getField<String>('Size');
  set size(String? value) => setField<String>('Size', value);

  String? get aField => getField<String>('A');
  set aField(String? value) => setField<String>('A', value);

  String? get bc => getField<String>('BC');
  set bc(String? value) => setField<String>('BC', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get other => getField<String>('Other');
  set other(String? value) => setField<String>('Other', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
