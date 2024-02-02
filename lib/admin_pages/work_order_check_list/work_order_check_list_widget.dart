import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Text(
                    'New Work Order',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.customerName,
                      'Customer',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Work Order #',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                              headerTextStyle: FlutterFlowTheme.of(context)
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
                                  FlutterFlowTheme.of(context).primaryText,
                              selectedDateTimeBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              selectedDateTimeForegroundColor:
                                  FlutterFlowTheme.of(context).info,
                              actionButtonForegroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
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
                            dateTimeFormat('yMMMd', _model.woDate),
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
                List<CustomersRow> listViewCustomersRowList = snapshot.data!;
                final listViewCustomersRow = listViewCustomersRowList.isNotEmpty
                    ? listViewCustomersRowList.first
                    : null;
                return ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    if (listViewCustomersRow!.fireExtinguishers! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue1 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue1 = newValue);
                        },
                        title: Text(
                          'Fire Extinguishers',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.fireHoses! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue2 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue2 = newValue);
                        },
                        title: Text(
                          'Fire Hoses',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.suppressionSystems! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue3 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue3 = newValue);
                        },
                        title: Text(
                          'Suppression Systems',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.emergencyLights! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue4 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue4 = newValue);
                        },
                        title: Text(
                          'Emergency Lights',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.firstAidKits! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue5 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue5 = newValue);
                        },
                        title: Text(
                          'First Aid Kits',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.aeds! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue6 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue6 = newValue);
                        },
                        title: Text(
                          'AEDs',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.eyeWash! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue7 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue7 = newValue);
                        },
                        title: Text(
                          'Wash Stations',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.scba! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue8 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue8 = newValue);
                        },
                        title: Text(
                          'SCBAs',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.fixedGas! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue9 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue9 = newValue);
                        },
                        title: Text(
                          'Fixed Gas Monitors',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    if (listViewCustomersRow.fallArrest! > 0)
                      SwitchListTile.adaptive(
                        value: _model.switchListTileValue10 ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.switchListTileValue10 = newValue);
                        },
                        title: Text(
                          'Fall Arrest',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.switchListTileValue1!) {
                    _model.addToTypeList('Fire Extinguisher');
                  }
                  if (_model.switchListTileValue2!) {
                    _model.addToTypeList('Fire Hose');
                  }
                  if (_model.switchListTileValue3!) {
                    _model.addToTypeList('Suppression System');
                  }
                  if (_model.switchListTileValue4!) {
                    _model.addToTypeList('Emergency Lights');
                  }
                  if (_model.switchListTileValue5!) {
                    _model.addToTypeList('First Aid Kit');
                  }
                  if (_model.switchListTileValue6!) {
                    _model.addToTypeList('AED');
                  }
                  if (_model.switchListTileValue7!) {
                    _model.addToTypeList('Eye Wash Station');
                  }
                  if (_model.switchListTileValue8!) {
                    _model.addToTypeList('SCBA/SABA');
                  }
                  if (_model.switchListTileValue9!) {
                    _model.addToTypeList('Fixed Gas Monitor');
                  }
                  if (_model.switchListTileValue10!) {
                    _model.addToTypeList('Fall Arrest Equipment');
                  }
                  _model.workOrderCreated = await WorkOrdersTable().insert({
                    'woNum': _model.textController.text,
                    'customer': widget.customerID,
                    'date': supaSerialize<DateTime>(_model.datePicked),
                    'status': 'New',
                    'notes': '',
                    'type': (List<String> inputlist) {
                      return inputlist
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', '');
                    }(_model.typeList.toList()),
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _model.typeList.length.toString(),
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                  while ((_model.typeList.isNotEmpty) &&
                      (_model.loopCount < _model.typeList.length)) {
                    _model.apiResult27v = await FindEquipmentOfTypeCall.call(
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
                    }.withoutNulls,
                  );

                  setState(() {});
                },
                text: 'Create',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
  }
}
