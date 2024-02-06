import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'equipment_detail_model.dart';
export 'equipment_detail_model.dart';

class EquipmentDetailWidget extends StatefulWidget {
  const EquipmentDetailWidget({super.key});

  @override
  State<EquipmentDetailWidget> createState() => _EquipmentDetailWidgetState();
}

class _EquipmentDetailWidgetState extends State<EquipmentDetailWidget> {
  late EquipmentDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EquipmentDetailModel());

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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
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
                    'Gauge',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  subtitle: Text(
                    'Does it work?',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).accent1,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/seed/748/600',
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Upload Image',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF939393),
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
            FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Complete Inspection',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
          ],
        ),
      ),
    );
  }
}
