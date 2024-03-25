import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'open_wo_from_lookup_model.dart';
export 'open_wo_from_lookup_model.dart';

class OpenWoFromLookupWidget extends StatefulWidget {
  const OpenWoFromLookupWidget({
    super.key,
    required this.wo,
  });

  final int? wo;

  @override
  State<OpenWoFromLookupWidget> createState() => _OpenWoFromLookupWidgetState();
}

class _OpenWoFromLookupWidgetState extends State<OpenWoFromLookupWidget> {
  late OpenWoFromLookupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenWoFromLookupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Which view would you like to see?',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<WorkOrdersRow>>(
            future: WorkOrdersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget.wo,
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
              List<WorkOrdersRow> wrapWorkOrdersRowList = snapshot.data!;
              final wrapWorkOrdersRow = wrapWorkOrdersRowList.isNotEmpty
                  ? wrapWorkOrdersRowList.first
                  : null;
              return Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'workOrderDetailField',
                        queryParameters: {
                          'workOrder': serializeParam(
                            widget.wo,
                            ParamType.int,
                          ),
                          'customerID': serializeParam(
                            wrapWorkOrdersRow?.customer,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Field',
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
                      context.pushNamed(
                        'workOrderDetailShop',
                        queryParameters: {
                          'workOrder': serializeParam(
                            widget.wo,
                            ParamType.int,
                          ),
                          'customerID': serializeParam(
                            wrapWorkOrdersRow?.id,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Shop',
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
                      context.pushNamed(
                        'workOrderSummary',
                        queryParameters: {
                          'woid': serializeParam(
                            widget.wo,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Reporting',
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
              );
            },
          ),
        ],
      ),
    );
  }
}
