import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'work_order_list_field_model.dart';
export 'work_order_list_field_model.dart';

class WorkOrderListFieldWidget extends StatefulWidget {
  const WorkOrderListFieldWidget({super.key});

  @override
  State<WorkOrderListFieldWidget> createState() =>
      _WorkOrderListFieldWidgetState();
}

class _WorkOrderListFieldWidgetState extends State<WorkOrderListFieldWidget> {
  late WorkOrderListFieldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderListFieldModel());

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
        List<CustomersRow> workOrderListFieldCustomersRowList = snapshot.data!;
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
                'My Work Orders',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        alignment: WrapAlignment.spaceAround,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FutureBuilder<List<UsersRow>>(
                            future: UsersTable().queryRows(
                              queryFn: (q) => q,
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
                              List<UsersRow> dropDownUsersRowList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: dropDownUsersRowList
                                    .map((e) => e.name)
                                    .withoutNulls
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  _model.apiResultmox =
                                      await FindUserIDCall.call(
                                    name: _model.dropDownValue,
                                  );
                                  if ((_model.apiResultmox?.succeeded ??
                                      true)) {
                                    setState(() {
                                      _model.currentUser = getJsonField(
                                        (_model.apiResultmox?.jsonBody ?? ''),
                                        r'''$[0].id''',
                                      );
                                    });
                                  }

                                  setState(() {});
                                },
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Tech',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                          Text(
                            'Show Completed Items',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Switch.adaptive(
                            value: _model.switchValue ??= false,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue = newValue);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                    ),
                    if (!_model.switchValue!)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FutureBuilder<List<WorkOrdersRow>>(
                          future: WorkOrdersTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'status',
                                  'New',
                                )
                                .order('date', ascending: true)
                                .order('priority', ascending: true),
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
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewWorkOrdersRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewWorkOrdersRow =
                                    listViewWorkOrdersRowList[listViewIndex];
                                return Visibility(
                                  visible: (_model.currentUser < 0) ||
                                      (_model.currentUser ==
                                          listViewWorkOrdersRow.tech),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: InkWell(
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
                                                    workOrderListFieldCustomersRowList[
                                                            functions.getIndexOfCustomerFunc(
                                                                workOrderListFieldCustomersRowList
                                                                    .toList(),
                                                                listViewWorkOrdersRow
                                                                    .customer!)]
                                                        .id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                  workOrderListFieldCustomersRowList
                                                                      .toList(),
                                                                  listViewWorkOrdersRow
                                                                      .customer!)]
                                                              .company,
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 17.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .status,
                                                          'New',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .woNum,
                                                          'WO#',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              'yMd',
                                                              listViewWorkOrdersRow
                                                                  .date),
                                                          'N/A',
                                                        )} - ${valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .startTime
                                                              ?.toString(),
                                                          'N/A',
                                                        )} - ${valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .status,
                                                          'n/a',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .type,
                                                          'type',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Wrap(
                                                    spacing: 10.0,
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Wrap(
                                                        spacing: 10.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                      workOrderListFieldCustomersRowList
                                                                          .toList(),
                                                                      listViewWorkOrdersRow
                                                                          .customer!)]
                                                                  .serviceLocationAddress,
                                                              'Address',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 25.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            icon: Icon(
                                                              Icons.map,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 11.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList
                                                                                  .toList(),
                                                                              listViewWorkOrdersRow
                                                                                  .customer!)]
                                                                          .serviceLocationAddress ==
                                                                      null ||
                                                                  workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList.toList(),
                                                                              listViewWorkOrdersRow.customer!)]
                                                                          .serviceLocationAddress ==
                                                                      '') {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Error'),
                                                                      content: const Text(
                                                                          'Address is incorrect.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await launchMap(
                                                                  address:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                            workOrderListFieldCustomersRowList.toList(),
                                                                            listViewWorkOrdersRow.customer!)]
                                                                        .serviceLocationAddress,
                                                                    'Address',
                                                                  ),
                                                                  title: '',
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Wrap(
                                                        spacing: 10.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                      workOrderListFieldCustomersRowList
                                                                          .toList(),
                                                                      listViewWorkOrdersRow
                                                                          .customer!)]
                                                                  .phone,
                                                              'Phone',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 25.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            icon: Icon(
                                                              Icons.phone_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 11.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList
                                                                                  .toList(),
                                                                              listViewWorkOrdersRow
                                                                                  .customer!)]
                                                                          .phone ==
                                                                      null ||
                                                                  workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList.toList(),
                                                                              listViewWorkOrdersRow.customer!)]
                                                                          .phone ==
                                                                      '') {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Error'),
                                                                      content: const Text(
                                                                          'Phone number is incorrect.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await launchUrl(
                                                                    Uri(
                                                                  scheme: 'tel',
                                                                  path: workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                          workOrderListFieldCustomersRowList
                                                                              .toList(),
                                                                          listViewWorkOrdersRow
                                                                              .customer!)]
                                                                      .phone!,
                                                                ));
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 10.0))
                                                    .around(
                                                        const SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (_model.switchValue ?? true)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FutureBuilder<List<WorkOrdersRow>>(
                          future: WorkOrdersTable().queryRows(
                            queryFn: (q) => q.order('date'),
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
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewWorkOrdersRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewWorkOrdersRow =
                                    listViewWorkOrdersRowList[listViewIndex];
                                return Visibility(
                                  visible: ((_model.currentUser < 0) ||
                                          (_model.currentUser ==
                                              listViewWorkOrdersRow.tech)) &&
                                      ((listViewWorkOrdersRow.status !=
                                              'New') ||
                                          (listViewWorkOrdersRow.status ==
                                                  null ||
                                              listViewWorkOrdersRow.status ==
                                                  '')),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: InkWell(
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
                                                    workOrderListFieldCustomersRowList[
                                                            functions.getIndexOfCustomerFunc(
                                                                workOrderListFieldCustomersRowList
                                                                    .toList(),
                                                                listViewWorkOrdersRow
                                                                    .customer!)]
                                                        .id,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                  workOrderListFieldCustomersRowList
                                                                      .toList(),
                                                                  listViewWorkOrdersRow
                                                                      .customer!)]
                                                              .company,
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 17.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .woNum,
                                                          'WO#',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${valueOrDefault<String>(
                                                          dateTimeFormat(
                                                              'yMd',
                                                              listViewWorkOrdersRow
                                                                  .date),
                                                          'N/A',
                                                        )} - ${valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .startTime
                                                              ?.toString(),
                                                          'N/A',
                                                        )} - ${valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .status,
                                                          'N/A',
                                                        )}',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewWorkOrdersRow
                                                              .type,
                                                          'type',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Wrap(
                                                    spacing: 10.0,
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Wrap(
                                                        spacing: 10.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                      workOrderListFieldCustomersRowList
                                                                          .toList(),
                                                                      listViewWorkOrdersRow
                                                                          .customer!)]
                                                                  .serviceLocationAddress,
                                                              'Address',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 25.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            icon: Icon(
                                                              Icons.map,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 11.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList
                                                                                  .toList(),
                                                                              listViewWorkOrdersRow
                                                                                  .customer!)]
                                                                          .serviceLocationAddress ==
                                                                      null ||
                                                                  workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList.toList(),
                                                                              listViewWorkOrdersRow.customer!)]
                                                                          .serviceLocationAddress ==
                                                                      '') {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Error'),
                                                                      content: const Text(
                                                                          'Address is incorrect.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await launchURL(workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                        workOrderListFieldCustomersRowList
                                                                            .toList(),
                                                                        listViewWorkOrdersRow
                                                                            .customer!)]
                                                                    .serviceLocationAddress!);
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Wrap(
                                                        spacing: 10.0,
                                                        runSpacing: 0.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                      workOrderListFieldCustomersRowList
                                                                          .toList(),
                                                                      listViewWorkOrdersRow
                                                                          .customer!)]
                                                                  .phone,
                                                              'Phone',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 25.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            icon: Icon(
                                                              Icons.phone_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 11.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList
                                                                                  .toList(),
                                                                              listViewWorkOrdersRow
                                                                                  .customer!)]
                                                                          .phone ==
                                                                      null ||
                                                                  workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                              workOrderListFieldCustomersRowList.toList(),
                                                                              listViewWorkOrdersRow.customer!)]
                                                                          .phone ==
                                                                      '') {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          'Error'),
                                                                      content: const Text(
                                                                          'Phone number is incorrect.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                await launchUrl(
                                                                    Uri(
                                                                  scheme: 'tel',
                                                                  path: workOrderListFieldCustomersRowList[functions.getIndexOfCustomerFunc(
                                                                          workOrderListFieldCustomersRowList
                                                                              .toList(),
                                                                          listViewWorkOrdersRow
                                                                              .customer!)]
                                                                      .phone!,
                                                                ));
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 10.0))
                                                    .around(
                                                        const SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
          ),
        );
      },
    );
  }
}
