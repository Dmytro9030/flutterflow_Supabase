import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'edit_equipmen_model.dart';
export 'edit_equipmen_model.dart';

class EditEquipmenWidget extends StatefulWidget {
  const EditEquipmenWidget({
    super.key,
    this.equipmentId,
  });

  final int? equipmentId;

  @override
  State<EditEquipmenWidget> createState() => _EditEquipmenWidgetState();
}

class _EditEquipmenWidgetState extends State<EditEquipmenWidget> {
  late EditEquipmenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEquipmenModel());

    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'details': _model.textController1.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.equipmentId,
          ),
        );
      },
    );

    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'manufacturedDate': int.parse(_model.textController2.text),
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.equipmentId,
          ),
        );
      },
    );

    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'description': _model.textController3.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.equipmentId,
          ),
        );
      },
    );

    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textFieldFocusNode4!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'serial': _model.textController4.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.equipmentId,
          ),
        );
      },
    );
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
      future: EquipmentTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.equipmentId,
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
        final containerEquipmentRow = containerEquipmentRowList.isNotEmpty
            ? containerEquipmentRowList.first
            : null;
        return Container(
          constraints: const BoxConstraints(
            minWidth: 350.0,
            minHeight: 700.0,
            maxWidth: 600.0,
            maxHeight: 800.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.typeValueController ??=
                              FormFieldController<String>(
                            _model.typeValue ??= valueOrDefault<String>(
                              containerEquipmentRow?.type,
                              'Fire Extinguisher',
                            ),
                          ),
                          options: const [
                            'Fire Extinguisher',
                            'Emergency Lights',
                            'First Aid Kit',
                            'AED',
                            'Fire Hose',
                            'Suppression System',
                            'SCBA/SABA',
                            'Fixed Gas Monitor',
                            'Fall Arrest Equipment',
                            'Eye Wash Station',
                            'Sprinklers',
                            'Fire Alarm'
                          ],
                          onChanged: (val) async {
                            setState(() => _model.typeValue = val);
                            await EquipmentTable().update(
                              data: {
                                'type': _model.typeValue,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                widget.equipmentId,
                              ),
                            );
                          },
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Equipment Type',
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
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).accent1,
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
                  if (_model.typeValue == 'Emergency Lights')
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
                        FlutterFlowDropDown<String>(
                          controller: _model.emg1ValueController ??=
                              FormFieldController<String>(null),
                          options: const [
                            'Battery Pack',
                            'Remote Heads',
                            'Exit Sign',
                            'Exit Combo',
                            'Run Man Sign',
                            'Run Man Combo'
                          ],
                          onChanged: (val) async {
                            setState(() => _model.emg1Value = val);
                            await EquipmentTable().update(
                              data: {
                                'details': _model.emg1Value,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                widget.equipmentId,
                              ),
                            );
                          },
                          width: 250.0,
                          height: 56.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Please select...',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.emg2ValueController ??=
                                FormFieldController<String>(null),
                            options: const [
                              '6V 4.5A',
                              '6V 7A',
                              '6V 12A',
                              '12V 7A',
                              '12V 28A',
                              '12V 133A'
                            ],
                            onChanged: (val) async {
                              setState(() => _model.emg2Value = val);
                              await EquipmentTable().update(
                                data: {
                                  'details2': _model.emg2Value,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  widget.equipmentId,
                                ),
                              );
                            },
                            width: 250.0,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Please select...',
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
                        ),
                      ],
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController1 ??=
                                TextEditingController(
                              text: valueOrDefault<String>(
                                containerEquipmentRow?.details,
                                'details',
                              ),
                            ),
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: ' Details',
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
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController2 ??=
                                TextEditingController(
                              text: valueOrDefault<String>(
                                containerEquipmentRow?.manufacturedDate
                                    ?.toString(),
                                '-',
                              ),
                            ),
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Mfg Yr',
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
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController3 ??=
                                TextEditingController(
                              text: valueOrDefault<String>(
                                containerEquipmentRow?.description,
                                'location',
                              ),
                            ),
                            focusNode: _model.textFieldFocusNode3,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Location',
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
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController4 ??=
                                TextEditingController(
                              text: valueOrDefault<String>(
                                containerEquipmentRow?.serial,
                                'serial',
                              ),
                            ),
                            focusNode: _model.textFieldFocusNode4,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Serial',
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
                            validator: _model.textController4Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Last Inspection',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
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

                                if (datePickedDate != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      datePickedDate.year,
                                      datePickedDate.month,
                                      datePickedDate.day,
                                    );
                                  });
                                }
                                await EquipmentTable().update(
                                  data: {
                                    'inspectionDate1': supaSerialize<DateTime>(
                                        _model.datePicked),
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.equipmentId,
                                  ),
                                );
                              },
                              text: valueOrDefault<String>(
                                dateTimeFormat('yMd',
                                    containerEquipmentRow?.inspectionDate1),
                                'blank',
                              ),
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
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController1 ??=
                                          FormFieldController<String>(
                                    _model.dropDownValue1 ??=
                                        valueOrDefault<String>(
                                      containerEquipmentRow?.frequency1,
                                      'Annual',
                                    ),
                                  ),
                                  options: const [
                                    'Annual',
                                    'Semi-Annual',
                                    'Quarterly',
                                    'Monthly',
                                    '6 Years',
                                    '12 Years',
                                    '5 Years',
                                    'n/a'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue1 = val);
                                    await EquipmentTable().update(
                                      data: {
                                        'frequency1': _model.dropDownValue1,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.equipmentId,
                                      ),
                                    );
                                  },
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Frequency',
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if ((_model.typeValue == 'Fire Extinguisher') ||
                      (_model.typeValue == 'Suppression System') ||
                      (_model.typeValue == 'SCBA/SABA') ||
                      (_model.typeValue == 'AED') ||
                      (_model.typeValue == 'First Aid Kit') ||
                      (_model.typeValue == 'Fire Hose'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    () {
                                      if (_model.typeValue ==
                                          'Fire Extinguisher') {
                                        return 'Recharge Due';
                                      } else if (_model.typeValue ==
                                          'Fire Hose') {
                                        return 'Recharge Due';
                                      } else if (_model.typeValue ==
                                          'SCBA/SABA') {
                                        return 'Hydro Due';
                                      } else if (_model.typeValue ==
                                          'Suppression System') {
                                        return 'Recharge Due';
                                      } else if (_model.typeValue == 'AED') {
                                        return 'Battery Expiration';
                                      } else if (_model.typeValue ==
                                          'First Aid Kit') {
                                        return 'Expiration 1';
                                      } else {
                                        return 'n/a';
                                      }
                                    }(),
                                    'n/a',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.nextDue2ValueController ??=
                                    FormFieldController<String>(null),
                                options: const [
                                  '2023',
                                  '2024',
                                  '2025',
                                  '2026',
                                  '2027',
                                  '2028',
                                  '2029',
                                  '2030',
                                  '2031',
                                  '2032',
                                  '2033',
                                  '2034',
                                  '2035',
                                  '2036'
                                ],
                                onChanged: (val) async {
                                  setState(() => _model.nextDue2Value = val);
                                  await EquipmentTable().update(
                                    data: {
                                      'nextDue2': valueOrDefault<int>(
                                        int.parse((_model.nextDue2Value!)),
                                        0,
                                      ),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.equipmentId,
                                    ),
                                  );
                                },
                                width: 100.0,
                                height: 56.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Please select...',
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
                              if ((_model.typeValue == 'First Aid Kit') ||
                                  (_model.typeValue == 'AED'))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Enter the expiration date (future date)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              if ((_model.typeValue != 'AED') &&
                                  (_model.typeValue != 'First Aid Kit'))
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController2 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue2 ??=
                                                  valueOrDefault<String>(
                                                containerEquipmentRow
                                                    ?.frequency2,
                                                '6 Years',
                                              ),
                                            ),
                                            options: const [
                                              'Annual',
                                              'Semi-Annual',
                                              'Quarterly',
                                              'Monthly',
                                              '6 Years',
                                              '12 Years',
                                              '5 Years',
                                              'n/a'
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue2 = val);
                                              await EquipmentTable().update(
                                                data: {
                                                  'frequency2':
                                                      _model.dropDownValue2,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.equipmentId,
                                                ),
                                              );
                                            },
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Frequency',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if ((_model.typeValue == 'Fire Extinguisher') ||
                      (_model.typeValue == 'Suppression System') ||
                      (_model.typeValue == 'SCBA/SABA') ||
                      (_model.typeValue == 'AED') ||
                      (_model.typeValue == 'First Aid Kit'))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    () {
                                      if (_model.typeValue ==
                                          'Fire Extinguisher') {
                                        return 'Hydro Due';
                                      } else if (_model.typeValue ==
                                          'SCBA/SABA') {
                                        return 'Bottle Expiration';
                                      } else if (_model.typeValue ==
                                          'Suppression System') {
                                        return 'Hydro Due';
                                      } else if (_model.typeValue == 'AED') {
                                        return 'Pad Expiration';
                                      } else if (_model.typeValue ==
                                          'First Aid Kit') {
                                        return 'Expiration 2';
                                      } else {
                                        return 'n/a';
                                      }
                                    }(),
                                    'n/a',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.nextDue3ValueController ??=
                                    FormFieldController<String>(null),
                                options: const [
                                  '2023',
                                  '2024',
                                  '2025',
                                  '2026',
                                  '2027',
                                  '2028',
                                  '2029',
                                  '2030',
                                  '2031',
                                  '2032',
                                  '2033',
                                  '2034',
                                  '2035',
                                  '2036'
                                ],
                                onChanged: (val) async {
                                  setState(() => _model.nextDue3Value = val);
                                  await EquipmentTable().update(
                                    data: {
                                      'nextDue3': valueOrDefault<int>(
                                        int.parse((_model.nextDue3Value!)),
                                        0,
                                      ),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.equipmentId,
                                    ),
                                  );
                                },
                                width: 100.0,
                                height: 56.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Please select...',
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
                              if ((_model.typeValue == 'First Aid Kit') ||
                                  (_model.typeValue == 'AED') ||
                                  (_model.typeValue == 'SCBA/SABA'))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Enter the expiration date (future date)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              if ((_model.typeValue != 'AED') &&
                                  (_model.typeValue != 'First Aid Kit') &&
                                  (_model.typeValue != 'SCBA/SABA'))
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController3 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue3 ??=
                                                  valueOrDefault<String>(
                                                containerEquipmentRow
                                                    ?.frequency3,
                                                '12 Years',
                                              ),
                                            ),
                                            options: const [
                                              'Annual',
                                              'Semi-Annual',
                                              'Quarterly',
                                              'Monthly',
                                              '6 Years',
                                              '12 Years',
                                              '5 Years',
                                              'n/a'
                                            ],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue3 = val);
                                              await EquipmentTable().update(
                                                data: {
                                                  'frequency3':
                                                      _model.dropDownValue3,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.equipmentId,
                                                ),
                                              );
                                            },
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Frequency',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleMedium,
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
