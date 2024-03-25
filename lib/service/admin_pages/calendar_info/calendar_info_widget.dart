import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'calendar_info_model.dart';
export 'calendar_info_model.dart';

class CalendarInfoWidget extends StatefulWidget {
  const CalendarInfoWidget({
    super.key,
    required this.woId,
    required this.customerId,
  });

  final int? woId;
  final int? customerId;

  @override
  State<CalendarInfoWidget> createState() => _CalendarInfoWidgetState();
}

class _CalendarInfoWidgetState extends State<CalendarInfoWidget> {
  late CalendarInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarInfoModel());

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
      child: FutureBuilder<List<CustomersRow>>(
        future: CustomersTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            widget.customerId,
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<List<WorkOrdersRow>>(
                future: WorkOrdersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.woId,
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
                  List<WorkOrdersRow> rowWorkOrdersRowList = snapshot.data!;
                  final rowWorkOrdersRow = rowWorkOrdersRowList.isNotEmpty
                      ? rowWorkOrdersRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          'Google Calendar Info:',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  );
                },
              ),
              FutureBuilder<List<WorkOrdersRow>>(
                future: WorkOrdersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.woId,
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
                  List<WorkOrdersRow> rowWorkOrdersRowList = snapshot.data!;
                  final rowWorkOrdersRow = rowWorkOrdersRowList.isNotEmpty
                      ? rowWorkOrdersRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Title:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            rowWorkOrdersRow?.id.toString(),
                            '#',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            columnCustomersRow?.name,
                            'customer',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            rowWorkOrdersRow?.type,
                            'type',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  );
                },
              ),
              FutureBuilder<List<WorkOrdersRow>>(
                future: WorkOrdersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.woId,
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
                  List<WorkOrdersRow> rowWorkOrdersRowList = snapshot.data!;
                  final rowWorkOrdersRow = rowWorkOrdersRowList.isNotEmpty
                      ? rowWorkOrdersRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Schedule:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat('yMMMd', rowWorkOrdersRow?.date),
                            '#',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            rowWorkOrdersRow?.startTime?.toString(),
                            '#',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            rowWorkOrdersRow?.endTime?.toString(),
                            '#',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  );
                },
              ),
              FutureBuilder<List<WorkOrdersRow>>(
                future: WorkOrdersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.woId,
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
                  List<WorkOrdersRow> rowWorkOrdersRowList = snapshot.data!;
                  final rowWorkOrdersRow = rowWorkOrdersRowList.isNotEmpty
                      ? rowWorkOrdersRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Address: ',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        valueOrDefault<String>(
                          columnCustomersRow?.serviceLocationAddress,
                          'address',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  );
                },
              ),
              FutureBuilder<List<WorkOrdersRow>>(
                future: WorkOrdersTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.woId,
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
                  List<WorkOrdersRow> rowWorkOrdersRowList = snapshot.data!;
                  final rowWorkOrdersRow = rowWorkOrdersRowList.isNotEmpty
                      ? rowWorkOrdersRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Notes:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            columnCustomersRow?.contact,
                            'contact',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            columnCustomersRow?.phone,
                            'phone',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            rowWorkOrdersRow?.notes,
                            'notes',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('customerList');
                      },
                      text: 'Done',
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
            ],
          );
        },
      ),
    );
  }
}
