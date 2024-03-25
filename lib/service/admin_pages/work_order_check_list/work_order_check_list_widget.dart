import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/service/admin_pages/calendar_info/calendar_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'work_order_check_list_model.dart';
export 'work_order_check_list_model.dart';

class WorkOrderCheckListWidget extends StatefulWidget {
  const WorkOrderCheckListWidget({
    super.key,
    required this.customerID,
    required this.customerName,
  });

  final int? customerID;
  final String? customerName;

  @override
  State<WorkOrderCheckListWidget> createState() =>
      _WorkOrderCheckListWidgetState();
}

class _WorkOrderCheckListWidgetState extends State<WorkOrderCheckListWidget> {
  late WorkOrderCheckListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderCheckListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.woDate = getCurrentTimestamp;
    });

    _model.notesController ??= TextEditingController();
    _model.notesFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EquipmentRow>>(
      future: EquipmentTable().queryRows(
        queryFn: (q) => q.eq(
          'customer',
          widget.customerID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<EquipmentRow> containerEquipmentRowList = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().queryRows(
              queryFn: (q) => q,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<UsersRow> formUsersRowList = snapshot.data!;
              return Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: FutureBuilder<List<CustomersRow>>(
                  future: CustomersTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'id',
                      widget.customerID,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CustomersRow> columnCustomersRowList = snapshot.data!;
                    final columnCustomersRow = columnCustomersRowList.isNotEmpty
                        ? columnCustomersRowList.first
                        : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: Text(
                                  'New Work Order',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.customerName,
                                  'Customer',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.black,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 10.0, 0.0),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 300.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.typeValueController ??=
                                      FormFieldController<String>(null),
                                  options: const [
                                    'Annual Inspection',
                                    'Retrofit Kitchen',
                                    'Semi Annual Inspection',
                                    'Service Repair',
                                    'First Aid Kit/AED Audit',
                                    'Fire Alarm',
                                    'Hood Service'
                                  ],
                                  onChanged: (val) =>
                                      setState(() => _model.typeValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Type',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.userDDValueController ??=
                                      FormFieldController<String>(null),
                                  options: formUsersRowList
                                      .map((e) => e.name)
                                      .withoutNulls
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() => _model.userDDValue = val);
                                    _model.apiUsersResult =
                                        await FindUserIDCall.call(
                                      name: _model.userDDValue,
                                    );
                                    if ((_model.apiUsersResult?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.userID = getJsonField(
                                          (_model.apiUsersResult?.jsonBody ??
                                              ''),
                                          r'''$[0].id''',
                                        );
                                      });
                                    }

                                    setState(() {});
                                  },
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Tech',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.sourceValueController ??=
                                      FormFieldController<String>(null),
                                  options: const ['Field', 'Shop'],
                                  onChanged: (val) =>
                                      setState(() => _model.sourceValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Source',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    'Priority:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '2 - Medium',
                                  ),
                                  options: const [
                                    '3 - Low',
                                    '2 - Medium',
                                    '1 - High'
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Priority',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2050),
                                        builder: (context, child) {
                                          return wrapInMaterialDatePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 32.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );

                                      if (datePicked1Date != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            datePicked1Date.year,
                                            datePicked1Date.month,
                                            datePicked1Date.day,
                                          );
                                        });
                                      }
                                      setState(() {
                                        _model.woDate = _model.datePicked1;
                                      });
                                    },
                                    child: Container(
                                      width: 150.0,
                                      height: 40.0,
                                      constraints: const BoxConstraints(
                                        minWidth: 150.0,
                                        maxWidth: 500.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF26867C),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: const Color(0xFF6A6A6A),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat('yMd', _model.woDate),
                                          'Choose Date',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePicked2Time =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                        builder: (context, child) {
                                          return wrapInMaterialTimePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 32.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );
                                      if (datePicked2Time != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            getCurrentTimestamp.year,
                                            getCurrentTimestamp.month,
                                            getCurrentTimestamp.day,
                                            datePicked2Time.hour,
                                            datePicked2Time.minute,
                                          );
                                        });
                                      }
                                      setState(() {
                                        _model.woDate = _model.datePicked2;
                                      });
                                    },
                                    child: Container(
                                      width: 150.0,
                                      height: 40.0,
                                      constraints: const BoxConstraints(
                                        minWidth: 150.0,
                                        maxWidth: 500.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF26867C),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: const Color(0xFF6A6A6A),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat('jm', _model.woDate),
                                          'Start Time',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePicked3Time =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                        builder: (context, child) {
                                          return wrapInMaterialTimePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 32.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );
                                      if (datePicked3Time != null) {
                                        safeSetState(() {
                                          _model.datePicked3 = DateTime(
                                            getCurrentTimestamp.year,
                                            getCurrentTimestamp.month,
                                            getCurrentTimestamp.day,
                                            datePicked3Time.hour,
                                            datePicked3Time.minute,
                                          );
                                        });
                                      }
                                      setState(() {
                                        _model.woDate = _model.datePicked3;
                                      });
                                    },
                                    child: Container(
                                      width: 150.0,
                                      height: 40.0,
                                      constraints: const BoxConstraints(
                                        minWidth: 150.0,
                                        maxWidth: 500.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF26867C),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: const Color(0xFF6A6A6A),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat('jm', _model.woDate),
                                          'Start Time',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (containerEquipmentRowList.isNotEmpty)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.fireHoses != null) &&
                                      (columnCustomersRow!.fireHoses! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue1 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue1 = newValue);
                                      if (newValue) {
                                        _model.addToTypeList('Fire Hose');
                                      }
                                    },
                                    title: Text(
                                      'Fire Hoses',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.fireExtinguishers !=
                                          null) &&
                                      (columnCustomersRow!.fireExtinguishers! >
                                          0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue2 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue2 = newValue);
                                      if (newValue) {
                                        _model
                                            .addToTypeList('Fire Extinguisher');
                                      }
                                    },
                                    title: Text(
                                      'Fire Extinguishers',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.suppressionSystems !=
                                          null) &&
                                      (columnCustomersRow!.suppressionSystems! >
                                          0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue3 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue3 = newValue);
                                      if (newValue) {
                                        _model.addToTypeList(
                                            'Suppression System');
                                      }
                                    },
                                    title: Text(
                                      'Suppression Systems',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.emergencyLights !=
                                          null) &&
                                      (columnCustomersRow!.emergencyLights! >
                                          0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue4 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue4 = newValue);
                                      if (newValue) {
                                        _model
                                            .addToTypeList('Emergency Lights');
                                      }
                                    },
                                    title: Text(
                                      'Emergency Lights',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.firstAidKits != null) &&
                                      (columnCustomersRow!.firstAidKits! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue5 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue5 = newValue);
                                      if (newValue) {
                                        _model.addToTypeList('First Aid Kit');
                                      }
                                    },
                                    title: Text(
                                      'First Aid Kits',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.aeds != null) &&
                                      (columnCustomersRow!.aeds! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue6 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue6 = newValue);
                                      if (newValue) {
                                        _model.addToTypeList('AED');
                                      }
                                    },
                                    title: Text(
                                      'AEDs',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.eyeWash != null) &&
                                      (columnCustomersRow!.eyeWash! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue7 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue7 = newValue);
                                      if (newValue) {
                                        _model
                                            .addToTypeList('Eye Wash Station');
                                      }
                                    },
                                    title: Text(
                                      'Wash Stations',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.scba != null) &&
                                      (columnCustomersRow!.scba! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue8 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue8 = newValue);
                                    },
                                    title: Text(
                                      'SCBAs',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.fixedGas != null) &&
                                      (columnCustomersRow!.fixedGas! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue9 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue9 = newValue);
                                      if (newValue) {
                                        _model
                                            .addToTypeList('Fixed Gas Monitor');
                                      }
                                    },
                                    title: Text(
                                      'Fixed Gas Monitors',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                if (valueOrDefault<bool>(
                                  (columnCustomersRow?.fallArrest != null) &&
                                      (columnCustomersRow!.fallArrest! > 0),
                                  false,
                                ))
                                  SwitchListTile.adaptive(
                                    value: _model.switchListTileValue10 ??=
                                        false,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                          .switchListTileValue10 = newValue);
                                      if (newValue) {
                                        _model.addToTypeList(
                                            'Fall Arrest Equipment');
                                      }
                                    },
                                    title: Text(
                                      'Fall Arrest',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.notesController,
                                      focusNode: _model.notesFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Notes:',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.notesControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.workOrderCreated =
                                    await WorkOrdersTable().insert({
                                  'customer': widget.customerID,
                                  'date': supaSerialize<DateTime>(
                                      _model.datePicked1),
                                  'notes': _model.notesController.text,
                                  'subtype': (List<String> inputlist) {
                                    return inputlist
                                        .toString()
                                        .replaceAll('[', '')
                                        .replaceAll(']', '');
                                  }(_model.typeList.toList()),
                                  'tech': _model.userID,
                                  'source': _model.sourceValue,
                                  'priority': _model.dropDownValue,
                                  'startTime': supaSerialize<PostgresTime>(
                                      PostgresTime(_model.datePicked2)),
                                  'status': 'New',
                                  'type': _model.typeValue,
                                  'endTime': supaSerialize<PostgresTime>(
                                      PostgresTime(_model.datePicked3)),
                                });
                                if (_model.sourceValue == 'Shop') {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'status': 'To Shop',
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      _model.workOrderCreated?.id,
                                    ),
                                  );
                                } else {
                                  await WorkOrdersTable().update(
                                    data: {
                                      'status': 'New',
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      _model.workOrderCreated?.id,
                                    ),
                                  );
                                }

                                while ((_model.typeList.isNotEmpty) &&
                                    (_model.loopCount <
                                        _model.typeList.length)) {
                                  _model.apiResult27v =
                                      await FindEquipmentOfTypeCall.call(
                                    custIDValue: widget.customerID,
                                    typeListItem:
                                        _model.typeList[_model.loopCount],
                                  );
                                  if ((_model.apiResult27v?.succeeded ??
                                      true)) {
                                    if (functions.existIDCheckFunc(
                                        (_model.apiResult27v?.jsonBody ??
                                            ''))) {
                                      setState(() {
                                        _model.eqptList = getJsonField(
                                          (_model.apiResult27v?.jsonBody ?? ''),
                                          r'''$[:].id''',
                                          true,
                                        )!
                                            .toList()
                                            .cast<int>();
                                      });
                                    } else {
                                      setState(() {
                                        _model.eqptList = [];
                                      });
                                    }

                                    while ((_model.eqptList.isNotEmpty) &&
                                        (_model.loopCount2 <
                                            _model.eqptList.length)) {
                                      if (_model.sourceValue == 'Shop') {
                                        await EqptWoLisTable().insert({
                                          'wo': _model.workOrderCreated?.id,
                                          'eqpt': _model
                                              .eqptList[_model.loopCount2],
                                          'Status': 'To Shop',
                                        });
                                      } else {
                                        await EqptWoLisTable().insert({
                                          'wo': _model.workOrderCreated?.id,
                                          'eqpt': _model
                                              .eqptList[_model.loopCount2],
                                        });
                                      }

                                      _model.loopCount2 = _model.loopCount2 + 1;
                                    }
                                  } else {
                                    break;
                                  }

                                  _model.loopCount = _model.loopCount + 1;
                                  _model.loopCount2 = 0;
                                }
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height: 350.0,
                                        child: CalendarInfoWidget(
                                          woId: valueOrDefault<int>(
                                            _model.workOrderCreated?.id,
                                            0,
                                          ),
                                          customerId: widget.customerID!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                setState(() {});
                              },
                              text: 'Create',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
