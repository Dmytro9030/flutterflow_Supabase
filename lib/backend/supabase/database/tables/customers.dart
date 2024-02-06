import '../database.dart';

class CustomersTable extends SupabaseTable<CustomersRow> {
  @override
  String get tableName => 'customers';

  @override
  CustomersRow createRow(Map<String, dynamic> data) => CustomersRow(data);
}

class CustomersRow extends SupabaseDataRow {
  CustomersRow(super.data);

  @override
  SupabaseTable get table => CustomersTable();

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get owner => getField<String>('Owner');
  set owner(String? value) => setField<String>('Owner', value);

  String? get customerLocations => getField<String>('Customer Locations');
  set customerLocations(String? value) =>
      setField<String>('Customer Locations', value);

  String? get contact => getField<String>('CONTACT');
  set contact(String? value) => setField<String>('CONTACT', value);

  String? get serviceLocationAddress =>
      getField<String>('Service Location Address');
  set serviceLocationAddress(String? value) =>
      setField<String>('Service Location Address', value);

  String? get contacts2 => getField<String>('Contacts2');
  set contacts2(String? value) => setField<String>('Contacts2', value);

  String? get company => getField<String>('Company');
  set company(String? value) => setField<String>('Company', value);

  int? get fireExtinguishers => getField<int>('fireExtinguishers');
  set fireExtinguishers(int? value) =>
      setField<int>('fireExtinguishers', value);

  int? get emergencyLights => getField<int>('emergencyLights');
  set emergencyLights(int? value) => setField<int>('emergencyLights', value);

  String? get phone => getField<String>('Phone #');
  set phone(String? value) => setField<String>('Phone #', value);

  String? get email => getField<String>('Email');
  set email(String? value) => setField<String>('Email', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int? get aeds => getField<int>('aeds');
  set aeds(int? value) => setField<int>('aeds', value);

  int? get firstAidKits => getField<int>('firstAidKits');
  set firstAidKits(int? value) => setField<int>('firstAidKits', value);

  String? get statusAnnual => getField<String>('Status Annual');
  set statusAnnual(String? value) => setField<String>('Status Annual', value);

  String? get sprinklers => getField<String>('sprinklers');
  set sprinklers(String? value) => setField<String>('sprinklers', value);

  int? get fireHoses => getField<int>('fireHoses');
  set fireHoses(int? value) => setField<int>('fireHoses', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get nextInspectionDate => getField<DateTime>('nextInspectionDate');
  set nextInspectionDate(DateTime? value) =>
      setField<DateTime>('nextInspectionDate', value);

  String? get nextEquipment => getField<String>('nextEquipment');
  set nextEquipment(String? value) => setField<String>('nextEquipment', value);

  int? get scba => getField<int>('scba');
  set scba(int? value) => setField<int>('scba', value);

  int? get fixedGas => getField<int>('fixedGas');
  set fixedGas(int? value) => setField<int>('fixedGas', value);

  int? get fallArrest => getField<int>('fallArrest');
  set fallArrest(int? value) => setField<int>('fallArrest', value);

  int? get eyeWash => getField<int>('eyeWash');
  set eyeWash(int? value) => setField<int>('eyeWash', value);

  int? get fireAlarms => getField<int>('fireAlarms');
  set fireAlarms(int? value) => setField<int>('fireAlarms', value);

  int? get suppressionSystems => getField<int>('suppressionSystems');
  set suppressionSystems(int? value) =>
      setField<int>('suppressionSystems', value);

  DateTime get nextFixedGas => getField<DateTime>('nextFixedGas')!;
  set nextFixedGas(DateTime value) => setField<DateTime>('nextFixedGas', value);

  DateTime get nextScba => getField<DateTime>('nextScba')!;
  set nextScba(DateTime value) => setField<DateTime>('nextScba', value);

  DateTime get nextSuppressionSystems =>
      getField<DateTime>('nextSuppressionSystems')!;
  set nextSuppressionSystems(DateTime value) =>
      setField<DateTime>('nextSuppressionSystems', value);

  DateTime? get nextFallArrest => getField<DateTime>('nextFallArrest');
  set nextFallArrest(DateTime? value) =>
      setField<DateTime>('nextFallArrest', value);

  DateTime? get nextEyeWash => getField<DateTime>('nextEyeWash');
  set nextEyeWash(DateTime? value) => setField<DateTime>('nextEyeWash', value);

  DateTime? get nextSprinklers => getField<DateTime>('nextSprinklers');
  set nextSprinklers(DateTime? value) =>
      setField<DateTime>('nextSprinklers', value);

  DateTime? get nextFireAlarms => getField<DateTime>('nextFireAlarms');
  set nextFireAlarms(DateTime? value) =>
      setField<DateTime>('nextFireAlarms', value);

  DateTime? get nextEmergencyLights =>
      getField<DateTime>('nextEmergencyLights');
  set nextEmergencyLights(DateTime? value) =>
      setField<DateTime>('nextEmergencyLights', value);

  DateTime get nextFirstAidKits => getField<DateTime>('nextFirstAidKits')!;
  set nextFirstAidKits(DateTime value) =>
      setField<DateTime>('nextFirstAidKits', value);

  DateTime? get nextAeds => getField<DateTime>('nextAeds');
  set nextAeds(DateTime? value) => setField<DateTime>('nextAeds', value);

  DateTime? get nextFireHoses => getField<DateTime>('nextFireHoses');
  set nextFireHoses(DateTime? value) =>
      setField<DateTime>('nextFireHoses', value);

  DateTime get nextFireExtinguishers =>
      getField<DateTime>('nextFireExtinguishers')!;
  set nextFireExtinguishers(DateTime value) =>
      setField<DateTime>('nextFireExtinguishers', value);

  String? get billingContact => getField<String>('billingContact');
  set billingContact(String? value) =>
      setField<String>('billingContact', value);

  String? get billingAddress => getField<String>('billingAddress');
  set billingAddress(String? value) =>
      setField<String>('billingAddress', value);

  String? get billingPhone => getField<String>('billingPhone');
  set billingPhone(String? value) => setField<String>('billingPhone', value);

  String? get billingEmail => getField<String>('billingEmail');
  set billingEmail(String? value) => setField<String>('billingEmail', value);
}
