import '/backend/supabase/supabase.dart';
import '/common_components/edit_row/edit_row_widget.dart';
import '/common_components/mass_edit_date_dialog/mass_edit_date_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list4_model.dart';
export 'list4_model.dart';

class List4Widget extends StatefulWidget {
  const List4Widget({
    super.key,
    required this.type,
    required this.typeStr,
    required this.customerId,
    required this.customerName,
  });

  final String? type;
  final String? typeStr;
  final int? customerId;
  final String? customerName;

  @override
  State<List4Widget> createState() => _List4WidgetState();
}

class _List4WidgetState extends State<List4Widget> {
  late List4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => List4Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            'List of ${widget.typeStr} for ${widget.customerName}',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<List<EquipmentRow>>(
                  future: EquipmentTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'customer',
                          widget.customerId,
                        )
                        .eq(
                          'type',
                          widget.typeStr,
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
                    List<EquipmentRow> dataTableEquipmentRowList =
                        snapshot.data!;
                    return DataTable2(
                      columns: [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Location',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Notes',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Serial',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Inspection',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'HST',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Status',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'Actions',
                              style: FlutterFlowTheme.of(context).labelLarge,
                            ),
                          ),
                        ),
                      ],
                      rows: dataTableEquipmentRowList
                          .mapIndexed((dataTableIndex, dataTableEquipmentRow) =>
                              [
                                Text(
                                  valueOrDefault<String>(
                                    dataTableEquipmentRow.description,
                                    'Location',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    dataTableEquipmentRow.notes,
                                    'Notes',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    dataTableEquipmentRow.serial,
                                    'Serial',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: MassEditDateDialogWidget(
                                              eqptType:
                                                  dataTableEquipmentRow.type,
                                              field: 'inspectionDate1',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat('yMd',
                                          dataTableEquipmentRow.nextDue1),
                                      'Date',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: MassEditDateDialogWidget(
                                              eqptType:
                                                  dataTableEquipmentRow.type,
                                              field: 'inspectionDate2',
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat('yMd',
                                          dataTableEquipmentRow.nextDue2),
                                      'Date',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    dataTableEquipmentRow.status,
                                    'Status',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                EditRowWidget(
                                  key: Key(
                                      'Keyfiv_${dataTableIndex}_of_${dataTableEquipmentRowList.length}'),
                                ),
                              ].map((c) => DataCell(c)).toList())
                          .map((e) => DataRow(cells: e))
                          .toList(),
                      headingRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      headingRowHeight: 56.0,
                      dataRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      dataRowHeight: 56.0,
                      border: TableBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      dividerThickness: 1.0,
                      showBottomBorder: true,
                      minWidth: 49.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
