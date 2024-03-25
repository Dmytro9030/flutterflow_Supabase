import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/service/field_pages/emergency_lights_popup/emergency_lights_popup_widget.dart';
import 'package:flutter/material.dart';
import 'emergency_lights_loop_model.dart';
export 'emergency_lights_loop_model.dart';

class EmergencyLightsLoopWidget extends StatefulWidget {
  const EmergencyLightsLoopWidget({
    super.key,
    this.description,
    this.type,
    this.battery,
    this.equipmentid,
    required this.woid,
  });

  final String? description;
  final String? type;
  final String? battery;
  final int? equipmentid;
  final int? woid;

  @override
  State<EmergencyLightsLoopWidget> createState() =>
      _EmergencyLightsLoopWidgetState();
}

class _EmergencyLightsLoopWidgetState extends State<EmergencyLightsLoopWidget> {
  late EmergencyLightsLoopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencyLightsLoopModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.description,
      'description',
    ));
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'description': _model.textController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.equipmentid,
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
    return FutureBuilder<List<EqptWoLisRow>>(
      future: EqptWoLisTable().querySingleRow(
        queryFn: (q) => q
            .eq(
              'eqpt',
              widget.equipmentid,
            )
            .eq(
              'wo',
              widget.woid,
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
        List<EqptWoLisRow> containerEqptWoLisRowList = snapshot.data!;
        final containerEqptWoLisRow = containerEqptWoLisRowList.isNotEmpty
            ? containerEqptWoLisRowList.first
            : null;
        return Container(
          decoration: const BoxDecoration(),
          child: Visibility(
            visible: containerEqptWoLisRow?.eqpt != null,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 10.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
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
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.typeDDValueController ??=
                                  FormFieldController<String>(
                                _model.typeDDValue ??= valueOrDefault<String>(
                                  widget.type,
                                  ' Type',
                                ),
                              ),
                              options: const [
                                'Battery Pack',
                                'Remote Heads',
                                'Exit Sign',
                                'Exit Combo',
                                'Run Man Sign',
                                'Run Man Combo'
                              ],
                              onChanged: (val) async {
                                setState(() => _model.typeDDValue = val);
                                await EquipmentTable().update(
                                  data: {
                                    'details': _model.typeDDValue,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.equipmentid,
                                  ),
                                );
                              },
                              width: 130.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                                  5.0, 0.0, 5.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.batteryDDValueController ??=
                                FormFieldController<String>(
                              _model.batteryDDValue ??= valueOrDefault<String>(
                                widget.battery,
                                'Battery',
                              ),
                            ),
                            options: const [
                              '6V 4.5A',
                              '6V 7A',
                              '6V 12A',
                              '12V 7A',
                              '12V 28A',
                              '12V 133A'
                            ],
                            onChanged: (val) async {
                              setState(() => _model.batteryDDValue = val);
                              await EquipmentTable().update(
                                data: {
                                  'details2': _model.batteryDDValue,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  widget.equipmentid,
                                ),
                              );
                            },
                            width: 130.0,
                            height: 50.0,
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
                                5.0, 0.0, 5.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Status:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: const [
                          'Passed',
                          'Failed',
                          'Not Found',
                          'Not Tested'
                        ],
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          await EqptWoLisTable().update(
                            data: {
                              'Status': _model.dropDownValue,
                            },
                            matchingRows: (rows) => rows
                                .eq(
                                  'wo',
                                  widget.woid,
                                )
                                .eq(
                                  'eqpt',
                                  widget.equipmentid,
                                ),
                          );
                        },
                        width: 100.0,
                        height: 56.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: 'Status',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height: 200.0,
                                  child: EmergencyLightsPopupWidget(
                                    woLiId: containerEqptWoLisRow!.id,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Icon(
                          Icons.note_add,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 40.0,
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
