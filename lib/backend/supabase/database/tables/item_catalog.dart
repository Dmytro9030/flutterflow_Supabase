import '../database.dart';

class ItemCatalogTable extends SupabaseTable<ItemCatalogRow> {
  @override
  String get tableName => 'itemCatalog';

  @override
  ItemCatalogRow createRow(Map<String, dynamic> data) => ItemCatalogRow(data);
}

class ItemCatalogRow extends SupabaseDataRow {
  ItemCatalogRow(super.data);

  @override
  SupabaseTable get table => ItemCatalogTable();

  String? get itemName => getField<String>('Item Name');
  set itemName(String? value) => setField<String>('Item Name', value);

  double? get price => getField<double>('Price');
  set price(double? value) => setField<double>('Price', value);

  String? get category => getField<String>('Category');
  set category(String? value) => setField<String>('Category', value);

  String? get name => getField<String>('Name');
  set name(String? value) => setField<String>('Name', value);

  double? get stock => getField<double>('Stock');
  set stock(double? value) => setField<double>('Stock', value);

  double? get cost => getField<double>('Cost');
  set cost(double? value) => setField<double>('Cost', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get itemLis => getField<int>('itemLis');
  set itemLis(int? value) => setField<int>('itemLis', value);
}
