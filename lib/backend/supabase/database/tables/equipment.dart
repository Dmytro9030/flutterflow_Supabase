import '../database.dart';

class EquipmentTable extends SupabaseTable<EquipmentRow> {
  @override
  String get tableName => 'equipment';

  @override
  EquipmentRow createRow(Map<String, dynamic> data) => EquipmentRow(data);
}

class EquipmentRow extends SupabaseDataRow {
  EquipmentRow(super.data);

  @override
  SupabaseTable get table => EquipmentTable();

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get customer => getField<int>('customer');
  set customer(int? value) => setField<int>('customer', value);

  int? get eqptWoLis => getField<int>('eqptWoLis');
  set eqptWoLis(int? value) => setField<int>('eqptWoLis', value);

  DateTime? get inspectionDate1 => getField<DateTime>('inspectionDate1');
  set inspectionDate1(DateTime? value) =>
      setField<DateTime>('inspectionDate1', value);

  String? get frequency1 => getField<String>('frequency1');
  set frequency1(String? value) => setField<String>('frequency1', value);

  String? get serial => getField<String>('serial');
  set serial(String? value) => setField<String>('serial', value);

  DateTime? get inspectionDate2 => getField<DateTime>('inspectionDate2');
  set inspectionDate2(DateTime? value) =>
      setField<DateTime>('inspectionDate2', value);

  String? get frequency2 => getField<String>('frequency2');
  set frequency2(String? value) => setField<String>('frequency2', value);

  DateTime? get inspectionDate3 => getField<DateTime>('inspectionDate3');
  set inspectionDate3(DateTime? value) =>
      setField<DateTime>('inspectionDate3', value);

  String? get frequency3 => getField<String>('frequency3');
  set frequency3(String? value) => setField<String>('frequency3', value);

  DateTime? get manufacturedDate => getField<DateTime>('manufacturedDate');
  set manufacturedDate(DateTime? value) =>
      setField<DateTime>('manufacturedDate', value);

  int? get extinguisherCatalog => getField<int>('extinguisherCatalog');
  set extinguisherCatalog(int? value) =>
      setField<int>('extinguisherCatalog', value);

  String? get shopF => getField<String>('ShopF');
  set shopF(String? value) => setField<String>('ShopF', value);

  DateTime? get nextDue1 => getField<DateTime>('nextDue1');
  set nextDue1(DateTime? value) => setField<DateTime>('nextDue1', value);

  DateTime? get nextDue2 => getField<DateTime>('nextDue2');
  set nextDue2(DateTime? value) => setField<DateTime>('nextDue2', value);

  DateTime? get nextDue3 => getField<DateTime>('nextDue3');
  set nextDue3(DateTime? value) => setField<DateTime>('nextDue3', value);

  DateTime? get soonestDate => getField<DateTime>('soonestDate');
  set soonestDate(DateTime? value) => setField<DateTime>('soonestDate', value);

  String? get inspection1Desc => getField<String>('inspection1Desc');
  set inspection1Desc(String? value) =>
      setField<String>('inspection1Desc', value);

  String? get inspection2Desc => getField<String>('inspection2Desc');
  set inspection2Desc(String? value) =>
      setField<String>('inspection2Desc', value);

  String? get inspection3Desc => getField<String>('inspection3Desc');
  set inspection3Desc(String? value) =>
      setField<String>('inspection3Desc', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get loanerSn => getField<String>('loaner_sn');
  set loanerSn(String? value) => setField<String>('loaner_sn', value);

  String? get extinguisherDetails => getField<String>('extinguisherDetails');
  set extinguisherDetails(String? value) =>
      setField<String>('extinguisherDetails', value);
}
