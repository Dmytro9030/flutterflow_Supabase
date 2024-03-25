import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'work_order_summary_model.dart';
export 'work_order_summary_model.dart';

class WorkOrderSummaryWidget extends StatefulWidget {
  const WorkOrderSummaryWidget({
    super.key,
    required this.woid,
  });

  final int? woid;

  @override
  State<WorkOrderSummaryWidget> createState() => _WorkOrderSummaryWidgetState();
}

class _WorkOrderSummaryWidgetState extends State<WorkOrderSummaryWidget> {
  late WorkOrderSummaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderSummaryModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WorkOrdersRow>>(
      future: WorkOrdersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.woid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<WorkOrdersRow> workOrderSummaryWorkOrdersRowList = snapshot.data!;
        final workOrderSummaryWorkOrdersRow =
            workOrderSummaryWorkOrdersRowList.isNotEmpty
                ? workOrderSummaryWorkOrdersRowList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Work Order Summary',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<CustomersRow>>(
                                  future: CustomersTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'id',
                                      workOrderSummaryWorkOrdersRow?.customer,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CustomersRow> titleCustomersRowList =
                                        snapshot.data!;
                                    final titleCustomersRow =
                                        titleCustomersRowList.isNotEmpty
                                            ? titleCustomersRowList.first
                                            : null;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            titleCustomersRow?.name,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 24.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              workOrderSummaryWorkOrdersRow?.id
                                                  .toString(),
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 24.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Fire Extiguisher Summary:',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 24.0,
                                          ),
                                    ),
                                  ],
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
                                    FutureBuilder<List<EqptWoLisRow>>(
                                      future: EqptWoLisTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'wo',
                                              workOrderSummaryWorkOrdersRow?.id,
                                            )
                                            .eq(
                                              'Status',
                                              'Completed',
                                            )
                                            .eq(
                                              'status_notes',
                                              'Annual',
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EqptWoLisRow>
                                            containerEqptWoLisRowList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Container(
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: ExpandableNotifier(
                                                controller: _model
                                                    .expandableController1,
                                                child: ExpandablePanel(
                                                  header: Text(
                                                    'Total Annuals Done - ${valueOrDefault<String>(
                                                      containerEqptWoLisRowList
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                        ),
                                                  ),
                                                  collapsed: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  expanded: Builder(
                                                    builder: (context) {
                                                      final eqptWoLisItem =
                                                          containerEqptWoLisRowList
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            eqptWoLisItem
                                                                .length,
                                                            (eqptWoLisItemIndex) {
                                                          final eqptWoLisItemItem =
                                                              eqptWoLisItem[
                                                                  eqptWoLisItemIndex];
                                                          return FutureBuilder<
                                                              List<
                                                                  EquipmentRow>>(
                                                            future: EquipmentTable()
                                                                .querySingleRow(
                                                              queryFn: (q) =>
                                                                  q.eq(
                                                                'id',
                                                                eqptWoLisItemItem
                                                                    .eqpt,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<EquipmentRow>
                                                                  textEquipmentRowList =
                                                                  snapshot
                                                                      .data!;
                                                              final textEquipmentRow =
                                                                  textEquipmentRowList
                                                                          .isNotEmpty
                                                                      ? textEquipmentRowList
                                                                          .first
                                                                      : null;
                                                              return Text(
                                                                '${textEquipmentRow?.serial} - ${textEquipmentRow?.notes}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  theme: const ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
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
                                    FutureBuilder<List<EqptWoLisRow>>(
                                      future: EqptWoLisTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'wo',
                                              workOrderSummaryWorkOrdersRow?.id,
                                            )
                                            .eq(
                                              'Status',
                                              'Completed',
                                            )
                                            .eq(
                                              'status_notes',
                                              'Recharge',
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EqptWoLisRow>
                                            containerEqptWoLisRowList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController2,
                                              child: ExpandablePanel(
                                                header: Text(
                                                  'Total Recharges Done - ${valueOrDefault<String>(
                                                    containerEqptWoLisRowList
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                      ),
                                                ),
                                                collapsed: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                expanded: Builder(
                                                  builder: (context) {
                                                    final rechargeListItem =
                                                        containerEqptWoLisRowList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          rechargeListItem
                                                              .length,
                                                          (rechargeListItemIndex) {
                                                        final rechargeListItemItem =
                                                            rechargeListItem[
                                                                rechargeListItemIndex];
                                                        return FutureBuilder<
                                                            List<EquipmentRow>>(
                                                          future: EquipmentTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              rechargeListItemItem
                                                                  .eqpt,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<EquipmentRow>
                                                                textEquipmentRowList =
                                                                snapshot.data!;
                                                            final textEquipmentRow =
                                                                textEquipmentRowList
                                                                        .isNotEmpty
                                                                    ? textEquipmentRowList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              '${textEquipmentRow?.serial} - ${textEquipmentRow?.details} - ${textEquipmentRow?.notes}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0x8A000000),
                                                                  ),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
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
                                    FutureBuilder<List<EqptWoLisRow>>(
                                      future: EqptWoLisTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'wo',
                                              workOrderSummaryWorkOrdersRow?.id,
                                            )
                                            .eq(
                                              'Status',
                                              'Completed',
                                            )
                                            .eq(
                                              'status_notes',
                                              'Hydro',
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EqptWoLisRow>
                                            containerEqptWoLisRowList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            color: Colors.white,
                                            child: ExpandableNotifier(
                                              controller:
                                                  _model.expandableController3,
                                              child: ExpandablePanel(
                                                header: Text(
                                                  'Total Hydros Done - ${valueOrDefault<String>(
                                                    containerEqptWoLisRowList
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.black,
                                                      ),
                                                ),
                                                collapsed: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                expanded: Builder(
                                                  builder: (context) {
                                                    final hydroListItem =
                                                        containerEqptWoLisRowList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          hydroListItem.length,
                                                          (hydroListItemIndex) {
                                                        final hydroListItemItem =
                                                            hydroListItem[
                                                                hydroListItemIndex];
                                                        return FutureBuilder<
                                                            List<EquipmentRow>>(
                                                          future: EquipmentTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              hydroListItemItem
                                                                  .eqpt,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<EquipmentRow>
                                                                textEquipmentRowList =
                                                                snapshot.data!;
                                                            final textEquipmentRow =
                                                                textEquipmentRowList
                                                                        .isNotEmpty
                                                                    ? textEquipmentRowList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              '${textEquipmentRow?.serial} - ${textEquipmentRow?.details} - ${workOrderSummaryWorkOrdersRow?.notes}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0x8A000000),
                                                                  ),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Other Equipment Done:',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                  ),
                                  FutureBuilder<List<EqptWoLisRow>>(
                                    future: EqptWoLisTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'wo',
                                            widget.woid,
                                          )
                                          .eq(
                                            'Status',
                                            'Passed',
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<EqptWoLisRow>
                                          columnEqptWoLisRowList =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnEqptWoLisRowList.length,
                                            (columnIndex) {
                                          final columnEqptWoLisRow =
                                              columnEqptWoLisRowList[
                                                  columnIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FutureBuilder<List<EquipmentRow>>(
                                                future: EquipmentTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eq(
                                                    'id',
                                                    columnEqptWoLisRow.eqpt,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<EquipmentRow>
                                                      textEquipmentRowList =
                                                      snapshot.data!;
                                                  final textEquipmentRow =
                                                      textEquipmentRowList
                                                              .isNotEmpty
                                                          ? textEquipmentRowList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    '${valueOrDefault<String>(
                                                      textEquipmentRow?.type,
                                                      'type',
                                                    )} - ${valueOrDefault<String>(
                                                      textEquipmentRow
                                                          ?.description,
                                                      'description',
                                                    )} - ${valueOrDefault<String>(
                                                      textEquipmentRow?.serial,
                                                      'serial',
                                                    )} - ${valueOrDefault<String>(
                                                      textEquipmentRow?.notes,
                                                      'notes',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Text(
                                    'Items Added:',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                ),
                                FutureBuilder<List<EqptWoLisRow>>(
                                  future: EqptWoLisTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'wo',
                                          widget.woid,
                                        )
                                        .not(
                                          'items',
                                          'is',
                                          null,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<EqptWoLisRow> columnEqptWoLisRowList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnEqptWoLisRowList.length,
                                          (columnIndex) {
                                        final columnEqptWoLisRow =
                                            columnEqptWoLisRowList[columnIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<List<EquipmentRow>>(
                                              future: EquipmentTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id',
                                                  columnEqptWoLisRow.eqpt,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<EquipmentRow>
                                                    textEquipmentRowList =
                                                    snapshot.data!;
                                                final textEquipmentRow =
                                                    textEquipmentRowList
                                                            .isNotEmpty
                                                        ? textEquipmentRowList
                                                            .first
                                                        : null;
                                                return Text(
                                                  '${valueOrDefault<String>(
                                                    textEquipmentRow?.type,
                                                    'type',
                                                  )} - ${valueOrDefault<String>(
                                                    textEquipmentRow?.serial,
                                                    'serial',
                                                  )} - ${valueOrDefault<String>(
                                                    columnEqptWoLisRow.items,
                                                    'items',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Notes:',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      workOrderSummaryWorkOrdersRow?.notes,
                                      'notes',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Reports:',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Extiguisher Report WIP',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 10.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
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
                                                widget.woid,
                                                ParamType.int,
                                              ),
                                              'customerID': serializeParam(
                                                workOrderSummaryWorkOrdersRow
                                                    ?.customer,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'EDIT - Field',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'workOrderDetailShop',
                                            queryParameters: {
                                              'workOrder': serializeParam(
                                                widget.woid,
                                                ParamType.int,
                                              ),
                                              'customerID': serializeParam(
                                                workOrderSummaryWorkOrdersRow
                                                    ?.customer,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'EDIT - Shop',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await WorkOrdersTable().update(
                                            data: {
                                              'status': 'Completed',
                                            },
                                            matchingRows: (rows) => rows,
                                          );
                                          context.safePop();
                                        },
                                        text: 'Invoice Done',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFF16B360),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirmation'),
                                                        content: const Text(
                                                            'Are you sure you want to delete this work order?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                const Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                const Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            await WorkOrdersTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.woid,
                                              ),
                                            );
                                            await EqptWoLisTable().delete(
                                              matchingRows: (rows) => rows.eq(
                                                'wo',
                                                widget.woid,
                                              ),
                                            );
                                          }
                                          context.safePop();
                                        },
                                        text: 'Delete Work Order',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFFEF393C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (workOrderSummaryWorkOrdersRow?.woNum != null &&
                            workOrderSummaryWorkOrdersRow?.woNum != '') {
                          return Text(
                            valueOrDefault<String>(
                              workOrderSummaryWorkOrdersRow?.woNum,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        } else {
                          return Text(
                            valueOrDefault<String>(
                              workOrderSummaryWorkOrdersRow?.id.toString(),
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
