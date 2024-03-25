import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'field_item_model.dart';
export 'field_item_model.dart';

class FieldItemWidget extends StatefulWidget {
  const FieldItemWidget({
    super.key,
    required this.eqptWoLisID,
  });

  final int? eqptWoLisID;

  @override
  State<FieldItemWidget> createState() => _FieldItemWidgetState();
}

class _FieldItemWidgetState extends State<FieldItemWidget> {
  late FieldItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      constraints: const BoxConstraints(
        maxWidth: 350.0,
        maxHeight: 450.0,
      ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      'Hose',
                      style: FlutterFlowTheme.of(context).bodyLarge,
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
                      'Bracket',
                      style: FlutterFlowTheme.of(context).bodyLarge,
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
                      'Hose Holder',
                      style: FlutterFlowTheme.of(context).bodyLarge,
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
                      'Pull Pin',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.1,
                      0.0,
                    ),
                    0.0,
                    0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        if (_model.switchListTileValue1!) {
                          _model.addToItemList('Hose');
                        }
                        if (_model.switchListTileValue4!) {
                          _model.addToItemList('Cauter Pin');
                        }
                        if (_model.switchListTileValue2!) {
                          _model.addToItemList('Bracket');
                        }
                        if (_model.switchListTileValue3!) {
                          _model.addToItemList('Hose Holder');
                        }
                        await EqptWoLisTable().update(
                          data: {
                            'items': (List<String> inputlist) {
                              return inputlist
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', '');
                            }(_model.itemList.toList()),
                          },
                          matchingRows: (rows) => rows.eq(
                            'id',
                            widget.eqptWoLisID,
                          ),
                        );
                        Navigator.pop(context, _model.itemList);
                      },
                      text: 'Add Item',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
