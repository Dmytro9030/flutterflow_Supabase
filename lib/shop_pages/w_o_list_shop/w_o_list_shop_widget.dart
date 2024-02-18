import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'w_o_list_shop_model.dart';
export 'w_o_list_shop_model.dart';

class WOListShopWidget extends StatefulWidget {
  const WOListShopWidget({super.key});

  @override
  State<WOListShopWidget> createState() => _WOListShopWidgetState();
}

class _WOListShopWidgetState extends State<WOListShopWidget> {
  late WOListShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WOListShopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<List<CustomersRow>>(
      future: CustomersTable().queryRows(
        queryFn: (q) => q,
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
        List<CustomersRow> wOListShopCustomersRowList = snapshot.data!;
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
              title: Text(
                'Shop Work Orders',
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                    child: FutureBuilder<List<WorkOrdersRow>>(
                      future: WorkOrdersTable().queryRows(
                        queryFn: (q) => q.eq(
                          'status',
                          'To Shop',
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
                        List<WorkOrdersRow> listViewWorkOrdersRowList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewWorkOrdersRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewWorkOrdersRow =
                                listViewWorkOrdersRowList[listViewIndex];
                            return SizedBox(
                              height: 50.0,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'workOrderDetailField',
                                                queryParameters: {
                                                  'workOrder': serializeParam(
                                                    listViewWorkOrdersRow.id,
                                                    ParamType.int,
                                                  ),
                                                  'customerID': serializeParam(
                                                    wOListShopCustomersRowList[functions
                                                            .getIndexOfCustomerFunc(
                                                                wOListShopCustomersRowList
                                                                    .toList(),
                                                                listViewWorkOrdersRow
                                                                    .customer!)]
                                                        .id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Text(
                                              valueOrDefault<String>(
                                                wOListShopCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                    wOListShopCustomersRowList
                                                                        .toList(),
                                                                    listViewWorkOrdersRow
                                                                        .customer!)]
                                                                .company ==
                                                            null ||
                                                        wOListShopCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                    wOListShopCustomersRowList
                                                                        .toList(),
                                                                    listViewWorkOrdersRow
                                                                        .customer!)]
                                                                .company ==
                                                            ''
                                                    ? ''
                                                    : wOListShopCustomersRowList[
                                                            functions.getIndexOfCustomerFunc(
                                                                wOListShopCustomersRowList
                                                                    .toList(),
                                                                listViewWorkOrdersRow
                                                                    .customer!)]
                                                        .company,
                                                '.',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            listViewWorkOrdersRow.date == null
                                                ? ''
                                                : dateTimeFormat(
                                                    'yMd',
                                                    listViewWorkOrdersRow
                                                        .date!),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Address',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            listViewWorkOrdersRow.type ==
                                                        null ||
                                                    listViewWorkOrdersRow
                                                            .type ==
                                                        ''
                                                ? ''
                                                : listViewWorkOrdersRow.type!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
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