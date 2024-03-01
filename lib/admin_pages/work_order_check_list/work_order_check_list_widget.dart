import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
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

    _model.woController ??= TextEditingController();
    _model.woFocusNode ??= FocusNode();

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
    context.watch<FFAppState>();

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
            child: SingleChildScrollView(
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
                          style: FlutterFlowTheme.of(context).headlineSmall,
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
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.woController,
                            focusNode: _model.woFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Work Order #',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.woControllerValidator
                                .asValidator(context),
                          ),
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
                            _model.apiUsersResult = await FindUserIDCall.call(
                              name: _model.userDDValue,
                            );
                            if ((_model.apiUsersResult?.succeeded ?? true)) {
                              setState(() {
                                _model.userID = getJsonField(
                                  (_model.apiUsersResult?.jsonBody ?? ''),
                                  r'''$.id''',
                                );
                              });
                            }

                            setState(() {});
                          },
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Tech',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
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
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Source',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
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
                  Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
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
                              final datePickedDate = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return wrapInMaterialDatePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    selectedDateTimeBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    selectedDateTimeForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );

                              TimeOfDay? datePickedTime;
                              if (datePickedDate != null) {
                                datePickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      getCurrentTimestamp),
                                  builder: (context, child) {
                                    return wrapInMaterialTimePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );
                              }

                              if (datePickedDate != null &&
                                  datePickedTime != null) {
                                safeSetState(() {
                                  _model.datePicked = DateTime(
                                    datePickedDate.year,
                                    datePickedDate.month,
                                    datePickedDate.day,
                                    datePickedTime!.hour,
                                    datePickedTime.minute,
                                  );
                                });
                              }
                              setState(() {
                                _model.woDate = _model.datePicked;
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
                                color: const Color(0xFFC2C2C2),
                                borderRadius: BorderRadius.circular(10.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: const Color(0xFF6A6A6A),
                                  width: 1.0,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat('M/d h:mm a', _model.woDate),
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Priority',
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
                            options: const ['3 - Low', '2 - Medium', '1 - High'],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Priority',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
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
                    ],
                  ),
                  FutureBuilder<List<CustomersRow>>(
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
                      List<CustomersRow> listViewCustomersRowList =
                          snapshot.data!;
                      final listViewCustomersRow =
                          listViewCustomersRowList.isNotEmpty
                              ? listViewCustomersRowList.first
                              : null;
                      return ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          if (listViewCustomersRow!.fireExtinguishers! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue1 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue1 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Fire Extinguisher');
                                }
                              },
                              title: Text(
                                'Fire Extinguishers',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.fireHoses! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue2 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue2 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Fire Hose');
                                }
                              },
                              title: Text(
                                'Fire Hoses',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.suppressionSystems! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue3 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue3 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Suppression System');
                                }
                              },
                              title: Text(
                                'Suppression Systems',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.emergencyLights! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue4 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue4 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Emergency Lights');
                                }
                              },
                              title: Text(
                                'Emergency Lights',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.firstAidKits! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue5 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue5 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('First Aid Kit');
                                }
                              },
                              title: Text(
                                'First Aid Kits',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.aeds! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue6 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue6 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('AED');
                                }
                              },
                              title: Text(
                                'AEDs',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.eyeWash! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue7 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue7 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Eye Wash Station');
                                }
                              },
                              title: Text(
                                'Wash Stations',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.scba! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue8 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue8 = newValue);
                              },
                              title: Text(
                                'SCBAs',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.fixedGas! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue9 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue9 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Fixed Gas Monitor');
                                }
                              },
                              title: Text(
                                'Fixed Gas Monitors',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          if (listViewCustomersRow.fallArrest! > 0)
                            SwitchListTile.adaptive(
                              value: _model.switchListTileValue10 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue10 = newValue);
                                if (newValue) {
                                  _model.addToTypeList('Fall Arrest Equipment');
                                }
                              },
                              title: Text(
                                'Fall Arrest',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                          'woNum': _model.woController.text,
                          'customer': widget.customerID,
                          'date': supaSerialize<DateTime>(_model.datePicked),
                          'status': 'New',
                          'notes': _model.notesController.text,
                          'type': (List<String> inputlist) {
                            return inputlist
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', '');
                          }(_model.typeList.toList()),
                          'tech': formUsersRowList
                              .where((e) => e.name == _model.userDDValue)
                              .toList()
                              .first
                              .id,
                          'source': _model.sourceValue,
                          'priority': _model.dropDownValue,
                        });
                        while ((_model.typeList.isNotEmpty) &&
                            (_model.loopCount < _model.typeList.length)) {
                          _model.apiResult27v =
                              await FindEquipmentOfTypeCall.call(
                            custIDValue: widget.customerID,
                            typeListItem: _model.typeList[_model.loopCount],
                          );
                          if ((_model.apiResult27v?.succeeded ?? true)) {
                            if (functions.existIDCheckFunc(
                                (_model.apiResult27v?.jsonBody ?? ''))) {
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
                                (_model.loopCount2 < _model.eqptList.length)) {
                              await EqptWoLisTable().insert({
                                'wo': _model.workOrderCreated?.id,
                                'eqpt': _model.eqptList[_model.loopCount2],
                              });
                              _model.loopCount2 = _model.loopCount2 + 1;
                            }
                          } else {
                            break;
                          }

                          _model.loopCount = _model.loopCount + 1;
                          _model.loopCount2 = 0;
                        }

                        context.pushNamed(
                          'workOrderDetailField',
                          queryParameters: {
                            'workOrder': serializeParam(
                              _model.workOrderCreated?.id,
                              ParamType.int,
                            ),
                            'customerID': serializeParam(
                              widget.customerID,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Create',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
          );
        },
      ),
    );
  }
}
