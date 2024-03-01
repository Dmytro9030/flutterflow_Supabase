import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/common_components/f_e_not_found/f_e_not_found_widget.dart';
import '/equipment_pages/equipment_detail/equipment_detail_widget.dart';
import '/equipment_pages/extinguisher_detail_field/extinguisher_detail_field_widget.dart';
import '/equipment_pages/new_equipment/new_equipment_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'work_order_detail_field_model.dart';
export 'work_order_detail_field_model.dart';

class WorkOrderDetailFieldWidget extends StatefulWidget {
  const WorkOrderDetailFieldWidget({
    super.key,
    required this.workOrder,
    required this.customerID,
  });

  final int? workOrder;
  final int? customerID;

  @override
  State<WorkOrderDetailFieldWidget> createState() =>
      _WorkOrderDetailFieldWidgetState();
}

class _WorkOrderDetailFieldWidgetState
    extends State<WorkOrderDetailFieldWidget> {
  late WorkOrderDetailFieldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderDetailFieldModel());

    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(
      () async {
        await WorkOrdersTable().update(
          data: {
            'type': _model.textController1.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.workOrder,
          ),
        );
      },
    );

    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(
      () async {
        await WorkOrdersTable().update(
          data: {
            'type': _model.textController2.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.workOrder,
          ),
        );
      },
    );

    _model.contactTFFocusNode ??= FocusNode();
    _model.contactTFFocusNode!.addListener(
      () async {
        await CustomersTable().update(
          data: {
            'CONTACT': _model.contactTFController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.customerID,
          ),
        );
      },
    );

    _model.phoneTFFocusNode ??= FocusNode();
    _model.phoneTFFocusNode!.addListener(
      () async {
        await CustomersTable().update(
          data: {
            'Phone #': _model.phoneTFController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.customerID,
          ),
        );
      },
    );

    _model.emailTFFocusNode ??= FocusNode();
    _model.emailTFFocusNode!.addListener(
      () async {
        await CustomersTable().update(
          data: {
            'Email': _model.emailTFController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.customerID,
          ),
        );
      },
    );

    _model.addressTFFocusNode ??= FocusNode();
    _model.addressTFFocusNode!.addListener(
      () async {
        await CustomersTable().update(
          data: {
            'Service Location Address': _model.addressTFController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.customerID,
          ),
        );
      },
    );

    _model.wonotesFocusNode ??= FocusNode();
    _model.wonotesFocusNode!.addListener(
      () async {
        await WorkOrdersTable().update(
          data: {
            'notes': _model.wonotesController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.workOrder,
          ),
        );
      },
    );

    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(
      () async {
        await CustomersTable().update(
          data: {
            'notes': _model.textController8.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.customerID,
          ),
        );
      },
    );
    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController10 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

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
      future: CustomersTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.customerID,
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
        List<CustomersRow> workOrderDetailFieldCustomersRowList =
            snapshot.data!;
        final workOrderDetailFieldCustomersRow =
            workOrderDetailFieldCustomersRowList.isNotEmpty
                ? workOrderDetailFieldCustomersRowList.first
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
              title: Text(
                '${workOrderDetailFieldCustomersRow?.company == null || workOrderDetailFieldCustomersRow?.company == '' ? '' : workOrderDetailFieldCustomersRow?.company}- WO #${widget.workOrder?.toString()}',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: FutureBuilder<List<WorkOrdersRow>>(
                        future: WorkOrdersTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            widget.workOrder,
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
                          List<WorkOrdersRow> infoWorkOrdersRowList =
                              snapshot.data!;
                          final infoWorkOrdersRow =
                              infoWorkOrdersRowList.isNotEmpty
                                  ? infoWorkOrdersRowList.first
                                  : null;
                          return Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.textController1 ??=
                                                    TextEditingController(
                                              text: infoWorkOrdersRow?.status,
                                            ),
                                            focusNode:
                                                _model.textFieldFocusNode1,
                                            onFieldSubmitted: (_) async {
                                              await WorkOrdersTable().update(
                                                data: {
                                                  'type': _model
                                                      .textController1.text,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.workOrder,
                                                ),
                                              );
                                            },
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Status',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.textController2 ??=
                                                    TextEditingController(
                                              text: infoWorkOrdersRow?.type,
                                            ),
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            onFieldSubmitted: (_) async {
                                              await WorkOrdersTable().update(
                                                data: {
                                                  'type': _model
                                                      .textController2.text,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.workOrder,
                                                ),
                                              );
                                            },
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Type',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 250.0,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .contactTFController ??=
                                                      TextEditingController(
                                                    text: workOrderDetailFieldCustomersRow
                                                                    ?.contact ==
                                                                null ||
                                                            workOrderDetailFieldCustomersRow
                                                                    ?.contact ==
                                                                ''
                                                        ? ''
                                                        : workOrderDetailFieldCustomersRow
                                                            ?.contact,
                                                  ),
                                                  focusNode:
                                                      _model.contactTFFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    await CustomersTable()
                                                        .update(
                                                      data: {
                                                        'CONTACT': _model
                                                            .contactTFController
                                                            .text,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.customerID,
                                                      ),
                                                    );
                                                  },
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Contact',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 12.0,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .contactTFControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250.0,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .phoneTFController ??=
                                                      TextEditingController(
                                                    text: workOrderDetailFieldCustomersRow
                                                                    ?.phone ==
                                                                null ||
                                                            workOrderDetailFieldCustomersRow
                                                                    ?.phone ==
                                                                ''
                                                        ? ''
                                                        : workOrderDetailFieldCustomersRow
                                                            ?.phone,
                                                  ),
                                                  focusNode:
                                                      _model.phoneTFFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    await CustomersTable()
                                                        .update(
                                                      data: {
                                                        'Phone #': _model
                                                            .phoneTFController
                                                            .text,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.customerID,
                                                      ),
                                                    );
                                                  },
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Phone',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 12.0,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .phoneTFControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250.0,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .emailTFController ??=
                                                      TextEditingController(
                                                    text: workOrderDetailFieldCustomersRow
                                                                    ?.email ==
                                                                null ||
                                                            workOrderDetailFieldCustomersRow
                                                                    ?.email ==
                                                                ''
                                                        ? ''
                                                        : workOrderDetailFieldCustomersRow
                                                            ?.email,
                                                  ),
                                                  focusNode:
                                                      _model.emailTFFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    await CustomersTable()
                                                        .update(
                                                      data: {
                                                        'Email': _model
                                                            .emailTFController
                                                            .text,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.customerID,
                                                      ),
                                                    );
                                                  },
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Email',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 12.0,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .emailTFControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.phone,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path:
                                                  workOrderDetailFieldCustomersRow!
                                                      .phone!,
                                            ));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 250.0,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .addressTFController ??=
                                                      TextEditingController(
                                                    text: workOrderDetailFieldCustomersRow
                                                                    ?.serviceLocationAddress ==
                                                                null ||
                                                            workOrderDetailFieldCustomersRow
                                                                    ?.serviceLocationAddress ==
                                                                ''
                                                        ? ''
                                                        : workOrderDetailFieldCustomersRow
                                                            ?.serviceLocationAddress,
                                                  ),
                                                  focusNode:
                                                      _model.addressTFFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    await CustomersTable()
                                                        .update(
                                                      data: {
                                                        'Service Location Address':
                                                            _model
                                                                .addressTFController
                                                                .text,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.customerID,
                                                      ),
                                                    );
                                                  },
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Address',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 12.0,
                                                            ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  validator: _model
                                                      .addressTFControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          icon: Icon(
                                            Icons.map,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await launchMap(
                                              address:
                                                  workOrderDetailFieldCustomersRow
                                                      ?.serviceLocationAddress,
                                              title: '',
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: FutureBuilder<List<UsersRow>>(
                                          future: UsersTable().queryRows(
                                            queryFn: (q) =>
                                                q.order('id', ascending: true),
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
                                            List<UsersRow> userDDUsersRowList =
                                                snapshot.data!;
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .userDDValueController ??=
                                                  FormFieldController<String>(
                                                _model.userDDValue ??=
                                                    infoWorkOrdersRow?.tech ==
                                                            null
                                                        ? ''
                                                        : userDDUsersRowList
                                                            .where((e) =>
                                                                e.id ==
                                                                infoWorkOrdersRow
                                                                    ?.tech)
                                                            .toList()
                                                            .first
                                                            .name,
                                              ),
                                              options: userDDUsersRowList
                                                  .map((e) => e.name)
                                                  .withoutNulls
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.userDDValue = val);
                                                await WorkOrdersTable().update(
                                                  data: {
                                                    'tech': userDDUsersRowList
                                                        .where((e) =>
                                                            e.name ==
                                                            _model.userDDValue)
                                                        .toList()
                                                        .first
                                                        .id,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.workOrder,
                                                  ),
                                                );
                                              },
                                              width: 300.0,
                                              height: 50.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText: 'Tech',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue1 ??=
                                                infoWorkOrdersRow?.priority,
                                          ),
                                          options: const [
                                            '3 - Low',
                                            '2 - Medium',
                                            '1 - High'
                                          ],
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.dropDownValue1 = val);
                                            await WorkOrdersTable().update(
                                              data: {
                                                'priority':
                                                    _model.dropDownValue1,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.workOrder,
                                              ),
                                            );
                                          },
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Priority',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.wonotesController ??=
                                                  TextEditingController(
                                            text: infoWorkOrdersRow?.notes,
                                          ),
                                          focusNode: _model.wonotesFocusNode,
                                          onFieldSubmitted: (_) async {
                                            await WorkOrdersTable().update(
                                              data: {
                                                'notes': _model
                                                    .wonotesController.text,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.workOrder,
                                              ),
                                            );
                                          },
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Work Order Notes',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .wonotesControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.datePicked1 != null
                                                ? dateTimeFormat(
                                                    'yMd', _model.datePicked1)
                                                : dateTimeFormat('yMd',
                                                    infoWorkOrdersRow?.date),
                                            'Date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked1Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: getCurrentTimestamp,
                                            lastDate: DateTime(2050),
                                            builder: (context, child) {
                                              return wrapInMaterialDatePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 32.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );

                                          if (datePicked1Date != null) {
                                            safeSetState(() {
                                              _model.datePicked1 = DateTime(
                                                datePicked1Date.year,
                                                datePicked1Date.month,
                                                datePicked1Date.day,
                                              );
                                            });
                                          }
                                          await WorkOrdersTable().update(
                                            data: {
                                              'date': supaSerialize<DateTime>(
                                                  _model.datePicked1),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.workOrder,
                                            ),
                                          );
                                        },
                                        text: 'Change Date',
                                        options: FFButtonOptions(
                                          height: 30.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                    fontSize: 12.0,
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
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Stack(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final datePicked2Time =
                                                await showTimePicker(
                                              context: context,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      getCurrentTimestamp),
                                              builder: (context, child) {
                                                return wrapInMaterialTimePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 32.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );
                                            if (datePicked2Time != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  getCurrentTimestamp.year,
                                                  getCurrentTimestamp.month,
                                                  getCurrentTimestamp.day,
                                                  datePicked2Time.hour,
                                                  datePicked2Time.minute,
                                                );
                                              });
                                            }
                                            setState(() {
                                              _model.startTime =
                                                  _model.datePicked2;
                                            });
                                            await WorkOrdersTable().update(
                                              data: {
                                                'startTime':
                                                    supaSerialize<PostgresTime>(
                                                        PostgresTime(
                                                            _model.startTime)),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.workOrder,
                                              ),
                                            );
                                          },
                                          text: 'Start Time',
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
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
                                                      fontSize: 12.0,
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.startTime == null
                                                  ? infoWorkOrdersRow?.startTime
                                                      ?.toString()
                                                  : dateTimeFormat(
                                                      'jm', _model.startTime),
                                              'Start Time',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked3Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 32.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked3Time != null) {
                                            safeSetState(() {
                                              _model.datePicked3 = DateTime(
                                                getCurrentTimestamp.year,
                                                getCurrentTimestamp.month,
                                                getCurrentTimestamp.day,
                                                datePicked3Time.hour,
                                                datePicked3Time.minute,
                                              );
                                            });
                                          }
                                          setState(() {
                                            _model.endTime = _model.datePicked3;
                                          });
                                          await WorkOrdersTable().update(
                                            data: {
                                              'endTime': supaSerialize<
                                                      PostgresTime>(
                                                  PostgresTime(_model.endTime)),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.workOrder,
                                            ),
                                          );
                                        },
                                        text: 'End Time',
                                        options: FFButtonOptions(
                                          height: 30.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                    fontSize: 12.0,
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
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.endTime == null
                                                ? infoWorkOrdersRow?.endTime
                                                    ?.toString()
                                                : dateTimeFormat(
                                                    'jm', _model.endTime),
                                            'End Time',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController8 ??=
                                          TextEditingController(
                                        text: workOrderDetailFieldCustomersRow
                                            ?.notes,
                                      ),
                                      focusNode: _model.textFieldFocusNode3,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController8',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          await CustomersTable().update(
                                            data: {
                                              'notes':
                                                  _model.textController8.text,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.customerID,
                                            ),
                                          );
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        await CustomersTable().update(
                                          data: {
                                            'notes':
                                                _model.textController8.text,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.customerID,
                                          ),
                                        );
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Notes About Customer:',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textController8Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    FutureBuilder<List<EqptWoLisRow>>(
                      future: EqptWoLisTable().queryRows(
                        queryFn: (q) => q.eq(
                          'wo',
                          widget.workOrder,
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
                        List<EqptWoLisRow> formEqptWoLisRowList =
                            snapshot.data!;
                        return Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 20.0, 0.0, 10.0),
                                        child: Text(
                                          'Extinguisher List:',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: SizedBox(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController9,
                                            focusNode:
                                                _model.textFieldFocusNode4,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController9',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                setState(() {
                                                  _model.visibleData = _model
                                                      .textController9.text;
                                                });
                                              },
                                            ),
                                            onFieldSubmitted: (_) async {
                                              setState(() {
                                                _model.visibleData =
                                                    _model.textController9.text;
                                              });
                                            },
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Search',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.search_sharp,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.start,
                                            validator: _model
                                                .textController9Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Show Completed Items',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Switch.adaptive(
                                              value: _model.showSwitch1Value ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    _model.showSwitch1Value =
                                                        newValue);
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 5.0,
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      constraints: const BoxConstraints(
                                        minHeight: 300.0,
                                        maxHeight: 800.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child:
                                            FutureBuilder<List<EquipmentRow>>(
                                          future: EquipmentTable().queryRows(
                                            queryFn: (q) => q
                                                .in_(
                                                  'id',
                                                  functions.getEqptIDFunction(
                                                      formEqptWoLisRowList
                                                          .toList()),
                                                )
                                                .eq(
                                                  'type',
                                                  'Fire Extinguisher',
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
                                                listViewEquipmentRowList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewEquipmentRowList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewEquipmentRow =
                                                    listViewEquipmentRowList[
                                                        listViewIndex];
                                                return Visibility(
                                                  visible: ((!_model.showSwitch1Value! &&
                                                              (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) ==
                                                                      null ||
                                                                  functions.geteqpWoListStateFunction(
                                                                          formEqptWoLisRowList
                                                                              .toList(),
                                                                          listViewEquipmentRow
                                                                              .id) ==
                                                                      '')) ||
                                                          (_model.showSwitch1Value! &&
                                                              (functions.geteqpWoListStateFunction(
                                                                          formEqptWoLisRowList
                                                                              .toList(),
                                                                          listViewEquipmentRow
                                                                              .id) !=
                                                                      null &&
                                                                  functions.geteqpWoListStateFunction(
                                                                          formEqptWoLisRowList
                                                                              .toList(),
                                                                          listViewEquipmentRow
                                                                              .id) !=
                                                                      ''))) &&
                                                      ((_model.visibleData == null ||
                                                              _model.visibleData == '') ||
                                                          functions.subContainingFunc(
                                                              valueOrDefault<String>(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewEquipmentRow
                                                                      .description,
                                                                  'null',
                                                                ).toLowerCase(),
                                                                'null',
                                                              ),
                                                              (_model.visibleData!).toLowerCase()) ||
                                                          functions.subContainingFunc(
                                                              valueOrDefault<String>(
                                                                listViewEquipmentRow
                                                                    .serial,
                                                                'null',
                                                              ).toLowerCase(),
                                                              (_model.visibleData!).toLowerCase())),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  ExtinguisherDetailFieldWidget(
                                                                eqptLisID: functions.geteqptWoLisIDFunction(
                                                                    formEqptWoLisRowList
                                                                        .toList(),
                                                                    listViewEquipmentRow
                                                                        .id),
                                                                eqptID:
                                                                    listViewEquipmentRow
                                                                        .id,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                        '${listViewEquipmentRow.description} - ${listViewEquipmentRow.serial} - ${valueOrDefault<String>(
                                                          listViewEquipmentRow
                                                              .status,
                                                          'status',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                      subtitle: Text(
                                                        '${dateTimeFormat('yMd', listViewEquipmentRow.nextDue1)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue2)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue3)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                      trailing: Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      tileColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      dense: false,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.feSerial =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            'Cancel', // cancel button text
                                            true, // whether to show the flash icon
                                            ScanMode.BARCODE,
                                          );

                                          _model.apiResultEqpt =
                                              await FindEqptIDCall.call(
                                            serial: _model.feSerial,
                                          );
                                          if ((_model
                                                  .apiResultEqpt?.succeeded ??
                                              true)) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        ExtinguisherDetailFieldWidget(
                                                      eqptLisID: functions
                                                          .geteqptWoLisIDFunction(
                                                              formEqptWoLisRowList
                                                                  .toList(),
                                                              getJsonField(
                                                                (_model.apiResultEqpt
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.id''',
                                                              )),
                                                      eqptID: getJsonField(
                                                        (_model.apiResultEqpt
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.id''',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          } else {
                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: FENotFoundWidget(
                                                      customerID:
                                                          widget.customerID!,
                                                      workOrderID:
                                                          widget.workOrder!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }

                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ExtinguisherDetailFieldWidget(
                                                    eqptLisID: functions
                                                        .geteqptWoLisIDFunction(
                                                            formEqptWoLisRowList
                                                                .toList(),
                                                            11),
                                                    eqptID: 11,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          setState(() {});
                                        },
                                        text: 'Scan Barcode',
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
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 20.0, 0.0, 10.0),
                                          child: Text(
                                            'Equipment List:',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: SizedBox(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController10,
                                              focusNode:
                                                  _model.textFieldFocusNode5,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController10',
                                                const Duration(milliseconds: 2000),
                                                () async {
                                                  setState(() {
                                                    _model.visibleEqpt = _model
                                                        .textController10.text;
                                                  });
                                                },
                                              ),
                                              onFieldSubmitted: (_) async {
                                                setState(() {
                                                  _model.visibleEqpt = _model
                                                      .textController10.text;
                                                });
                                              },
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Search',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.search,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController10Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Show Completed Items',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Switch.adaptive(
                                                value: _model
                                                    .showSwitch2Value ??= false,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      _model.showSwitch2Value =
                                                          newValue);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                inactiveTrackColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                inactiveThumbColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      child: Container(
                                        width: double.infinity,
                                        height: 200.0,
                                        constraints: const BoxConstraints(
                                          minHeight: 300.0,
                                          maxHeight: 800.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child:
                                              FutureBuilder<List<EquipmentRow>>(
                                            future: EquipmentTable().queryRows(
                                              queryFn: (q) => q
                                                  .in_(
                                                    'id',
                                                    functions.getEqptIDFunction(
                                                        formEqptWoLisRowList
                                                            .toList()),
                                                  )
                                                  .neq(
                                                    'type',
                                                    'Fire Extinguisher',
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
                                                  listViewEquipmentRowList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewEquipmentRowList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewEquipmentRow =
                                                      listViewEquipmentRowList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible: ((!_model
                                                                    .showSwitch2Value! &&
                                                                (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) ==
                                                                        null ||
                                                                    functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) ==
                                                                        '')) ||
                                                            (_model.showSwitch2Value! &&
                                                                (functions.geteqpWoListStateFunction(
                                                                            formEqptWoLisRowList
                                                                                .toList(),
                                                                            listViewEquipmentRow
                                                                                .id) !=
                                                                        null &&
                                                                    functions.geteqpWoListStateFunction(
                                                                            formEqptWoLisRowList
                                                                                .toList(),
                                                                            listViewEquipmentRow
                                                                                .id) !=
                                                                        ''))) &&
                                                        ((_model.visibleEqpt ==
                                                                    null ||
                                                                _model.visibleEqpt ==
                                                                    '') ||
                                                            functions.subContainingFunc(
                                                                valueOrDefault<String>(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewEquipmentRow
                                                                        .description,
                                                                    '-',
                                                                  ).toLowerCase(),
                                                                  'null',
                                                                ),
                                                                (_model.visibleEqpt!).toLowerCase()) ||
                                                            functions.subContainingFunc(
                                                                valueOrDefault<String>(
                                                                  listViewEquipmentRow
                                                                      .serial,
                                                                  '-',
                                                                ).toLowerCase(),
                                                                (_model.visibleEqpt!).toLowerCase())),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    EquipmentDetailWidget(
                                                                  eqptLisID: functions.geteqptWoLisIDFunction(
                                                                      formEqptWoLisRowList
                                                                          .toList(),
                                                                      listViewEquipmentRow
                                                                          .id),
                                                                  eqptID:
                                                                      listViewEquipmentRow
                                                                          .id,
                                                                  eqpt:
                                                                      listViewEquipmentRow
                                                                          .type,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: ListTile(
                                                        title: Text(
                                                          '${listViewEquipmentRow.description} - ${listViewEquipmentRow.serial} - ${valueOrDefault<String>(
                                                            listViewEquipmentRow
                                                                .status,
                                                            'status',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge,
                                                        ),
                                                        subtitle: Text(
                                                          '${dateTimeFormat('yMd', listViewEquipmentRow.nextDue1)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue2)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue3)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                        trailing: Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<List<WorkOrdersRow>>(
                                  future: WorkOrdersTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'id',
                                      widget.workOrder,
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
                                    List<WorkOrdersRow> wrapWorkOrdersRowList =
                                        snapshot.data!;
                                    final wrapWorkOrdersRow =
                                        wrapWorkOrdersRowList.isNotEmpty
                                            ? wrapWorkOrdersRowList.first
                                            : null;
                                    return Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.spaceEvenly,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: NewEquipmentWidget(
                                                      customerId:
                                                          widget.customerID!,
                                                      workOrderId:
                                                          widget.workOrder,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Add Equipment',
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
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                          options: const ['To Invoice', 'To Shop'],
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownValue2 = val),
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Please select...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await WorkOrdersTable().update(
                                                data: {
                                                  'status':
                                                      _model.dropDownValue2,
                                                  'notes': _model
                                                      .wonotesController.text,
                                                  'startTime': supaSerialize<
                                                          PostgresTime>(
                                                      PostgresTime(
                                                          _model.datePicked2)),
                                                  'endTime': supaSerialize<
                                                          PostgresTime>(
                                                      PostgresTime(
                                                          _model.datePicked3)),
                                                  'date':
                                                      supaSerialize<DateTime>(
                                                          _model.datePicked1),
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.workOrder,
                                                ),
                                              );
                                            },
                                            text: ' Inspection Completed',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
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
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
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
