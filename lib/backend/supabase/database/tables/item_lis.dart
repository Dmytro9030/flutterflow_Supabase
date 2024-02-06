import '../database.dart';

class ItemLisTable extends SupabaseTable<ItemLisRow> {
  @override
  String get tableName => 'itemLis';

  @override
  ItemLisRow createRow(Map<String, dynamic> data) => ItemLisRow(data);
}

class ItemLisRow extends SupabaseDataRow {
  ItemLisRow(super.data);

  @override
  SupabaseTable get table => ItemLisTable();

  double? get qty => getField<double>('Qty');
  set qty(double? value) => setField<double>('Qty', value);

  String? get uid => getField<String>('UID');
  set uid(String? value) => setField<String>('UID', value);

  double? get price => getField<double>('Price');
  set price(double? value) => setField<double>('Price', value);

  double? get subtotal => getField<double>('Subtotal');
  set subtotal(double? value) => setField<double>('Subtotal', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get workOrder => getField<int>('workOrder');
  set workOrder(int? value) => setField<int>('workOrder', value);

  int? get item => getField<int>('item');
  set item(int? value) => setField<int>('item', value);

  int? get equipment => getField<int>('equipment');
  set equipment(int? value) => setField<int>('equipment', value);
}
