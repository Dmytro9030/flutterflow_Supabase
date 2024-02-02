import '../database.dart';

class LoanersTable extends SupabaseTable<LoanersRow> {
  @override
  String get tableName => 'loaners';

  @override
  LoanersRow createRow(Map<String, dynamic> data) => LoanersRow(data);
}

class LoanersRow extends SupabaseDataRow {
  LoanersRow(super.data);

  @override
  SupabaseTable get table => LoanersTable();

  String? get description => getField<String>('Description');
  set description(String? value) => setField<String>('Description', value);

  double? get serial => getField<double>('Serial');
  set serial(double? value) => setField<double>('Serial', value);

  DateTime? get manufactureDate => getField<DateTime>('Manufacture Date');
  set manufactureDate(DateTime? value) =>
      setField<DateTime>('Manufacture Date', value);

  DateTime? get field6YrDue => getField<DateTime>('6 Yr Due');
  set field6YrDue(DateTime? value) => setField<DateTime>('6 Yr Due', value);

  DateTime? get hydroDue => getField<DateTime>('Hydro Due');
  set hydroDue(DateTime? value) => setField<DateTime>('Hydro Due', value);

  List<String> get fELIs => getListField<String>('FE LIs');
  set fELIs(List<String>? value) => setListField<String>('FE LIs', value);

  String? get desc => getField<String>('Desc');
  set desc(String? value) => setField<String>('Desc', value);

  List<String> get extCatalog => getListField<String>('Ext Catalog');
  set extCatalog(List<String>? value) =>
      setListField<String>('Ext Catalog', value);

  String? get shopF => getField<String>('Shop/F');
  set shopF(String? value) => setField<String>('Shop/F', value);

  List<String> get bc => getListField<String>('BC');
  set bc(List<String>? value) => setListField<String>('BC', value);

  List<String> get aField => getListField<String>('A');
  set aField(List<String>? value) => setListField<String>('A', value);

  double? get mfgYr => getField<double>('Mfg Yr');
  set mfgYr(double? value) => setField<double>('Mfg Yr', value);

  double? get field6Yr => getField<double>('6 Yr');
  set field6Yr(double? value) => setField<double>('6 Yr', value);

  double? get hydroYr => getField<double>('Hydro Yr');
  set hydroYr(double? value) => setField<double>('Hydro Yr', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
