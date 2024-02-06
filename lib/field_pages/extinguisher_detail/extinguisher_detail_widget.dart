import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'extinguisher_detail_model.dart';
export 'extinguisher_detail_model.dart';

class ExtinguisherDetailWidget extends StatefulWidget {
  const ExtinguisherDetailWidget({
    super.key,
    required this.eqptLisID,
    required this.eqptID,
  });

  final int? eqptLisID;
  final int? eqptID;

  @override
  State<ExtinguisherDetailWidget> createState() =>
      _ExtinguisherDetailWidgetState();
}

class _ExtinguisherDetailWidgetState extends State<ExtinguisherDetailWidget> {
  late ExtinguisherDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExtinguisherDetailModel());

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  'Serial - Location',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue1 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue1 = newValue);
                    },
                    title: Text(
                      'Hose and Horn',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'Are they unobstructed?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue2 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue2 = newValue);
                    },
                    title: Text(
                      'Gauge Pressure',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'In operable range?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue3 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue3 = newValue);
                    },
                    title: Text(
                      'Lock Pin & Tamper Seal',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'Are they in place?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue4 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue4 = newValue);
                    },
                    title: Text(
                      'Label',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'Is it legible? Does it have ULC?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue5 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue5 = newValue);
                    },
                    title: Text(
                      'Body',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'No dents or deep gouges?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  SwitchListTile.adaptive(
                    value: _model.switchListTileValue6 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue6 = newValue);
                    },
                    title: Text(
                      'Powder',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    subtitle: Text(
                      'Does it move?',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: SwitchListTile.adaptive(
                      value: _model.switchListTileValue7 ??= false,
                      onChanged: (newValue) async {
                        setState(() => _model.switchListTileValue7 = newValue);
                      },
                      title: Text(
                        'Fire Extinguisher Tag',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      subtitle: Text(
                        'Signed and dated?',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      _model.apiWorkOrderID = await FindWorkOrderIDCall.call(
                        typedID: widget.eqptLisID,
                      );

                      context.pushNamed(
                        'fieldItemPage',
                        queryParameters: {
                          'orderID': serializeParam(
                            getJsonField(
                              (_model.apiWorkOrderID?.jsonBody ?? ''),
                              r'''$.wo''',
                            ),
                            ParamType.int,
                          ),
                          'eqptID': serializeParam(
                            widget.eqptID,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );

                      setState(() {});
                    },
                    text: 'Add Item',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                  FFButtonWidget(
                    onPressed: () async {
                      if (_model.switchListTileValue1!) {
                        _model
                            .addToDeficiencyList('Deficiency - Hose and Horn');
                      }
                      if (_model.switchListTileValue2!) {
                        _model
                            .addToDeficiencyList('Deficiency - Gauge Pressure');
                      }
                      if (_model.switchListTileValue3!) {
                        _model.addToDeficiencyList(
                            'Deficiency - Lock Pin & Tamper Seal');
                      }
                      if (_model.switchListTileValue4!) {
                        _model.addToDeficiencyList('Deficiency - Label');
                      }
                      if (_model.switchListTileValue5!) {
                        _model.addToDeficiencyList('Deficiency - Body');
                      }
                      if (_model.switchListTileValue6!) {
                        _model.addToDeficiencyList('Deficiency - Powder');
                      }
                      if (_model.switchListTileValue7!) {
                        _model.addToDeficiencyList(
                            'Deficiency - Fire Extinguisher Tag');
                      }
                      if (_model.deficiencyList.length == 7) {
                        await EqptWoLisTable().update(
                          data: {
                            'Status': 'Complete',
                          },
                          matchingRows: (rows) => rows.eq(
                            'id',
                            widget.eqptLisID,
                          ),
                        );
                      } else {
                        _model.matchedWoLis = await EqptWoLisTable().update(
                          data: {
                            'Status': 'Deficiency',
                          },
                          matchingRows: (rows) => rows.eq(
                            'id',
                            widget.eqptLisID,
                          ),
                          returnRows: true,
                        );
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Result'),
                              content: Text(
                                  _model.deficiencyList.toList().toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      setState(() {});
                    },
                    text: 'Complete ',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
