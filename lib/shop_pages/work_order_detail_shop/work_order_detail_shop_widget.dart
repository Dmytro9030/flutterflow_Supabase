import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/equipment_pages/extinguisher_detail_field/extinguisher_detail_field_widget.dart';
import '/equipment_pages/extinguisher_detail_shop/extinguisher_detail_shop_widget.dart';
import '/equipment_pages/new_equipment/new_equipment_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'work_order_detail_shop_model.dart';
export 'work_order_detail_shop_model.dart';

class WorkOrderDetailShopWidget extends StatefulWidget {
  const WorkOrderDetailShopWidget({
    super.key,
    required this.workOrder,
    required this.customerID,
  });

  final int? workOrder;
  final int? customerID;

  @override
  State<WorkOrderDetailShopWidget> createState() =>
      _WorkOrderDetailShopWidgetState();
}

class _WorkOrderDetailShopWidgetState extends State<WorkOrderDetailShopWidget> {
  late WorkOrderDetailShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkOrderDetailShopModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.wonotesFocusNode ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
        List<CustomersRow> workOrderDetailShopCustomersRowList = snapshot.data!;
        final workOrderDetailShopCustomersRow =
            workOrderDetailShopCustomersRowList.isNotEmpty
                ? workOrderDetailShopCustomersRowList.first
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
                '${workOrderDetailShopCustomersRow?.company == null || workOrderDetailShopCustomersRow?.company == '' ? '' : workOrderDetailShopCustomersRow?.company}- Work Order ${widget.workOrder?.toString()}',
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
                primary: false,
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.textController1 ??=
                                          TextEditingController(
                                        text: infoWorkOrdersRow?.type,
                                      ),
                                      focusNode: _model.textFieldFocusNode1,
                                      onFieldSubmitted: (_) async {
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
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Type',
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
                                      validator: _model.textController1Validator
                                          .asValidator(context),
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController3 ??=
                                          TextEditingController(
                                        text: workOrderDetailShopCustomersRow
                                            ?.notes,
                                      ),
                                      focusNode: _model.textFieldFocusNode2,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController3',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          await CustomersTable().update(
                                            data: {
                                              'notes':
                                                  _model.textController3.text,
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
                                                _model.textController3.text,
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
                                      validator: _model.textController3Validator
                                          .asValidator(context),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<EqptWoLisRow> formEqptWoLisRowList =
                                          snapshot.data!;
                                      return Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
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
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Extinguisher List:',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 22.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: SizedBox(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController4,
                                                          focusNode: _model
                                                              .textFieldFocusNode3,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController4',
                                                            const Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              setState(() {
                                                                _model.visibleData =
                                                                    _model
                                                                        .textController4
                                                                        .text;
                                                              });
                                                            },
                                                          ),
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            setState(() {
                                                              _model.visibleData =
                                                                  _model
                                                                      .textController4
                                                                      .text;
                                                            });
                                                          },
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Search',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            prefixIcon: const Icon(
                                                              Icons
                                                                  .search_sharp,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          textAlign:
                                                              TextAlign.start,
                                                          validator: _model
                                                              .textController4Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Show Completed Items',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Switch.adaptive(
                                                            value: _model
                                                                    .showSwitch1Value ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.showSwitch1Value =
                                                                      newValue);
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            inactiveTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            inactiveThumbColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (infoWorkOrdersRow
                                                            ?.source ==
                                                        'Shop') {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          constraints:
                                                              const BoxConstraints(
                                                            minHeight: 300.0,
                                                            maxHeight: 800.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<
                                                                    EquipmentRow>>(
                                                              future:
                                                                  EquipmentTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q
                                                                        .in_(
                                                                          'id',
                                                                          functions
                                                                              .getEqptIDFunction(formEqptWoLisRowList.toList()),
                                                                        )
                                                                        .eq(
                                                                          'type',
                                                                          'Fire Extinguisher',
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
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<EquipmentRow>
                                                                    listViewEquipmentRowList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewEquipmentRowList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewEquipmentRow =
                                                                        listViewEquipmentRowList[
                                                                            listViewIndex];
                                                                    return Visibility(
                                                                      visible: (_model.showSwitch1Value! && (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) != null && functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) != '')) ||
                                                                          (!_model.showSwitch1Value! &&
                                                                              (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) == null || functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) == '')),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: ExtinguisherDetailShopWidget(
                                                                                    eqptLisID: functions.geteqptWoLisIDFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id),
                                                                                    eqptID: listViewEquipmentRow.id,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text(
                                                                            '${listViewEquipmentRow.description} - ${listViewEquipmentRow.serial} - ${valueOrDefault<String>(
                                                                              listViewEquipmentRow.status,
                                                                              'status',
                                                                            )}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyLarge,
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            '${dateTimeFormat('yMd', listViewEquipmentRow.nextDue1)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue2)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue3)}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
                                                                          ),
                                                                          trailing:
                                                                              Icon(
                                                                            Icons.check_box_outline_blank,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          dense:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          constraints:
                                                              const BoxConstraints(
                                                            minHeight: 300.0,
                                                            maxHeight: 800.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<
                                                                    EquipmentRow>>(
                                                              future:
                                                                  EquipmentTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q
                                                                        .in_(
                                                                          'id',
                                                                          functions
                                                                              .getEqptIDFunction(formEqptWoLisRowList.toList()),
                                                                        )
                                                                        .eq(
                                                                          'type',
                                                                          'Fire Extinguisher',
                                                                        )
                                                                        .is_(
                                                                          'loaner_sn',
                                                                          true,
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
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<EquipmentRow>
                                                                    listViewEquipmentRowList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewEquipmentRowList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewEquipmentRow =
                                                                        listViewEquipmentRowList[
                                                                            listViewIndex];
                                                                    return Visibility(
                                                                      visible: (_model.showSwitch1Value! && ((functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) == 'Completed') || (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) == 'Condemned'))) ||
                                                                          (!_model.showSwitch1Value! &&
                                                                              ((functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) != 'Completed') && (functions.geteqpWoListStateFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id) != 'Condemned'))),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: ExtinguisherDetailShopWidget(
                                                                                    eqptLisID: functions.geteqptWoLisIDFunction(formEqptWoLisRowList.toList(), listViewEquipmentRow.id),
                                                                                    eqptID: listViewEquipmentRow.id,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text(
                                                                            '${listViewEquipmentRow.description} - ${listViewEquipmentRow.serial} - ${valueOrDefault<String>(
                                                                              listViewEquipmentRow.status,
                                                                              'status',
                                                                            )}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyLarge,
                                                                          ),
                                                                          subtitle:
                                                                              Text(
                                                                            '${dateTimeFormat('yMd', listViewEquipmentRow.nextDue1)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue2)} - ${dateTimeFormat('yMd', listViewEquipmentRow.nextDue3)}',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).labelMedium,
                                                                          ),
                                                                          trailing:
                                                                              Icon(
                                                                            Icons.check_box_outline_blank,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          tileColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          dense:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                                          await FindEqptIDCall
                                                              .call(
                                                        serial: _model.feSerial,
                                                      );
                                                      if ((_model.apiResultEqpt
                                                              ?.succeeded ??
                                                          true)) {
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
                                                                    ExtinguisherDetailFieldWidget(
                                                                  eqptLisID: functions
                                                                      .geteqptWoLisIDFunction(
                                                                          formEqptWoLisRowList
                                                                              .toList(),
                                                                          getJsonField(
                                                                            (_model.apiResultEqpt?.jsonBody ??
                                                                                ''),
                                                                            r'''$.id''',
                                                                          )),
                                                                  eqptID:
                                                                      getJsonField(
                                                                    (_model.apiResultEqpt
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.id''',
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        Navigator.pop(context);
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'Scan Barcode',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<WorkOrdersRow>>(
                                                future: WorkOrdersTable()
                                                    .querySingleRow(
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
                                                  List<WorkOrdersRow>
                                                      wrapWorkOrdersRowList =
                                                      snapshot.data!;
                                                  final wrapWorkOrdersRow =
                                                      wrapWorkOrdersRowList
                                                              .isNotEmpty
                                                          ? wrapWorkOrdersRowList
                                                              .first
                                                          : null;
                                                  return Wrap(
                                                    spacing: 10.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.center,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment: WrapAlignment
                                                        .spaceEvenly,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
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
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      NewEquipmentWidget(
                                                                    customerId:
                                                                        0,
                                                                    workOrderId:
                                                                        widget
                                                                            .workOrder,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        text: 'Add Equipment',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .dropDownValueController2 ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: const [
                                                          'To Invoice',
                                                          'To Shop'
                                                        ],
                                                        onChanged: (val) =>
                                                            setState(() => _model
                                                                    .dropDownValue2 =
                                                                val),
                                                        width: 300.0,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        hintText:
                                                            'Please select...',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    20.0,
                                                                    20.0,
                                                                    20.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await WorkOrdersTable()
                                                                .update(
                                                              data: {
                                                                'status': _model
                                                                    .dropDownValue2,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                widget
                                                                    .workOrder,
                                                              ),
                                                            );

                                                            context.pushNamed(
                                                                'workOrderListField');
                                                          },
                                                          text:
                                                              ' Inspection Completed',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ],
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
