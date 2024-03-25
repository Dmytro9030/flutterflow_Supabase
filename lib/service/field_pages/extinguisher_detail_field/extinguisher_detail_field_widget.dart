import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/service/field_pages/field_item/field_item_widget.dart';
import '/service/field_pages/to_shop_popup/to_shop_popup_widget.dart';
import 'package:flutter/material.dart';
import 'extinguisher_detail_field_model.dart';
export 'extinguisher_detail_field_model.dart';

class ExtinguisherDetailFieldWidget extends StatefulWidget {
  const ExtinguisherDetailFieldWidget({
    super.key,
    required this.eqptLisID,
    required this.eqptID,
  });

  final int? eqptLisID;
  final int? eqptID;

  @override
  State<ExtinguisherDetailFieldWidget> createState() =>
      _ExtinguisherDetailFieldWidgetState();
}

class _ExtinguisherDetailFieldWidgetState
    extends State<ExtinguisherDetailFieldWidget> {
  late ExtinguisherDetailFieldModel _model;

  bool typeFocusListenerRegistered1 = false;
  bool typeFocusListenerRegistered2 = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExtinguisherDetailFieldModel());

    _model.descrFocusNode ??= FocusNode();
    _model.descrFocusNode!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'description': _model.descrController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.eqptID,
          ),
        );
      },
    );

    _model.serialFocusNode ??= FocusNode();
    _model.serialFocusNode!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'serial': _model.serialController.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.eqptID,
          ),
        );
      },
    );

    _model.typeFocusNode1 ??= FocusNode();

    _model.typeFocusNode2 ??= FocusNode();

    _model.mfgDateFocusNode ??= FocusNode();
    _model.mfgDateFocusNode!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'manufacturedDate': int.tryParse(_model.mfgDateController.text),
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.eqptID,
          ),
        );
      },
    );
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      constraints: const BoxConstraints(
        maxWidth: 600.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: FutureBuilder<List<EquipmentRow>>(
          future: EquipmentTable().querySingleRow(
            queryFn: (q) => q.eq(
              'id',
              widget.eqptID,
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
            List<EquipmentRow> formEquipmentRowList = snapshot.data!;
            final formEquipmentRow = formEquipmentRowList.isNotEmpty
                ? formEquipmentRowList.first
                : null;
            return Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 200.0,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.descrController ??=
                                        TextEditingController(
                                      text: formEquipmentRow?.description,
                                    ),
                                    focusNode: _model.descrFocusNode,
                                    onFieldSubmitted: (_) async {
                                      await EquipmentTable().update(
                                        data: {
                                          'description':
                                              _model.descrController.text,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Description',
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
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.descrControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.serialController ??=
                                        TextEditingController(
                                      text: formEquipmentRow?.serial,
                                    ),
                                    focusNode: _model.serialFocusNode,
                                    onFieldSubmitted: (_) async {
                                      await EquipmentTable().update(
                                        data: {
                                          'serial':
                                              _model.serialController.text,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Serial',
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
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    validator: _model.serialControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(builder: (_) {
                                    if (!typeFocusListenerRegistered1) {
                                      typeFocusListenerRegistered1 = true;
                                      _model.typeFocusNode1!.addListener(
                                        () async {
                                          await EquipmentTable().update(
                                            data: {
                                              'details':
                                                  formEquipmentRow?.details,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.eqptID,
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    return TextFormField(
                                      controller: _model.typeController1 ??=
                                          TextEditingController(
                                        text: formEquipmentRow?.details,
                                      ),
                                      focusNode: _model.typeFocusNode1,
                                      onFieldSubmitted: (_) async {
                                        await EquipmentTable().update(
                                          data: {
                                            'details':
                                                formEquipmentRow?.details,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.eqptID,
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
                                      validator: _model.typeController1Validator
                                          .asValidator(context),
                                    );
                                  }),
                                ),
                              ),
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FutureBuilder<List<EqptWoLisRow>>(
                                    future: EqptWoLisTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        widget.eqptLisID,
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
                                      List<EqptWoLisRow> typeEqptWoLisRowList =
                                          snapshot.data!;
                                      final typeEqptWoLisRow =
                                          typeEqptWoLisRowList.isNotEmpty
                                              ? typeEqptWoLisRowList.first
                                              : null;
                                      return Builder(builder: (_) {
                                        if (!typeFocusListenerRegistered2) {
                                          typeFocusListenerRegistered2 = true;
                                          _model.typeFocusNode2!.addListener(
                                            () async {
                                              await EquipmentTable().update(
                                                data: {
                                                  'details':
                                                      formEquipmentRow?.details,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.eqptID,
                                                ),
                                              );
                                            },
                                          );
                                        }
                                        return TextFormField(
                                          controller: _model.typeController2 ??=
                                              TextEditingController(
                                            text: valueOrDefault<String>(
                                              typeEqptWoLisRow?.status,
                                              'Status',
                                            ),
                                          ),
                                          focusNode: _model.typeFocusNode2,
                                          onFieldSubmitted: (_) async {
                                            await EquipmentTable().update(
                                              data: {
                                                'details':
                                                    formEquipmentRow?.details,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.eqptID,
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
                                              .typeController2Validator
                                              .asValidator(context),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await EqptWoLisTable().update(
                                      data: {
                                        'Status': 'Not Found',
                                        'notes': _model.textController6.text ==
                                                    ''
                                            ? null
                                            : _model.textController6.text,
                                        'items': (List<String> inputlist) {
                                          return inputlist
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', '');
                                        }(_model.deficiencyList.toList()),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.eqptLisID,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  text: 'Not Found',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFFEF3939),
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ToShopPopupWidget(
                                            eqptWoLi: widget.eqptLisID!,
                                            eqptID: widget.eqptID!,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    context.safePop();
                                  },
                                  text: 'To Shop',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).warning,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.mfgDateController ??=
                                        TextEditingController(
                                      text: valueOrDefault<String>(
                                        formEquipmentRow?.manufacturedDate
                                            ?.toString(),
                                        '-',
                                      ),
                                    ),
                                    focusNode: _model.mfgDateFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Manufacture Year:',
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
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.number,
                                    validator: _model.mfgDateControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Inspection Due',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    final datePickedDate =
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
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 32.0,
                                                    fontWeight: FontWeight.w600,
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
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          datePickedDate.year,
                                          datePickedDate.month,
                                          datePickedDate.day,
                                        );
                                      });
                                    }
                                    await EquipmentTable().update(
                                      data: {
                                        'nextDue1': supaSerialize<DateTime>(
                                            _model.datePicked),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.eqptID,
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  text: valueOrDefault<String>(
                                    dateTimeFormat(
                                        'yMd', formEquipmentRow?.nextDue1),
                                    'na',
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Recharge Due',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.rechargeDDValueController ??=
                                          FormFieldController<String>(
                                    _model.rechargeDDValue ??=
                                        valueOrDefault<String>(
                                      formEquipmentRow?.nextDue2?.toString(),
                                      '-',
                                    ),
                                  ),
                                  options: const [
                                    '2023',
                                    '2024',
                                    '2025',
                                    '2026',
                                    '2027',
                                    '2028',
                                    '2029',
                                    '2030',
                                    '2031',
                                    '2032',
                                    '2033',
                                    '2034',
                                    '2035',
                                    '2036'
                                  ],
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.rechargeDDValue = val);
                                    await EquipmentTable().update(
                                      data: {
                                        'nextDue2': int.parse(
                                            (_model.rechargeDDValue!)),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.eqptID,
                                      ),
                                    );
                                  },
                                  width: 100.0,
                                  height: 56.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Please select...',
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
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Hydro Due',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.hydroDDValueController ??=
                                      FormFieldController<String>(
                                    _model.hydroDDValue ??=
                                        valueOrDefault<String>(
                                      formEquipmentRow?.nextDue3?.toString(),
                                      '-',
                                    ),
                                  ),
                                  options: const [
                                    '2023',
                                    '2024',
                                    '2025',
                                    '2026',
                                    '2027',
                                    '2028',
                                    '2029',
                                    '2030',
                                    '2031',
                                    '2032',
                                    '2033',
                                    '2034',
                                    '2035',
                                    '2036'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.hydroDDValue = val);
                                    await EquipmentTable().update(
                                      data: {
                                        'nextDue3':
                                            int.parse((_model.hydroDDValue!)),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.eqptID,
                                      ),
                                    );
                                  },
                                  width: 100.0,
                                  height: 56.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Please select...',
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue1 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue1 = newValue);
                              if (newValue) {
                                _model.addToDeficiencyList(
                                    'Deficiency - Gauge Pressure');
                              }
                            },
                            title: Text(
                              'Gauge Pressure',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'In operable range?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue2 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue2 = newValue);
                              if (newValue) {
                                _model.addToDeficiencyList(
                                    'Deficiency - Hose and Horn');
                              }
                            },
                            title: Text(
                              'Hose and Horn',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'Are they unobstructed?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue3 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue3 = newValue);
                              if (newValue) {
                                _model.addToDeficiencyList(
                                    'Deficiency - Lock Pin & Tamper Seal');
                              }
                            },
                            title: Text(
                              'Lock Pin & Tamper Seal',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'Are they in place?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue4 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue4 = newValue);
                              if (newValue) {
                                _model
                                    .addToDeficiencyList('Deficiency - Label');
                              }
                            },
                            title: Text(
                              'Label',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'Is it legible? Does it have ULC?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue5 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue5 = newValue);
                              if (newValue) {
                                _model.addToDeficiencyList('Deficiency - Body');
                              }
                            },
                            title: Text(
                              'Body',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'No dents or deep gouges?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          SwitchListTile.adaptive(
                            value: _model.switchListTileValue6 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue6 = newValue);
                              if (newValue) {
                                _model
                                    .addToDeficiencyList('Deficiency - Powder');
                              }
                            },
                            title: Text(
                              'Powder',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            subtitle: Text(
                              'Does it move?',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: SwitchListTile.adaptive(
                              value: _model.switchListTileValue7 ??= true,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue7 = newValue);
                                if (newValue) {
                                  _model.addToDeficiencyList(
                                      'Deficiency - Fire Extinguisher Tag');
                                }
                              },
                              title: Text(
                                'Fire Extinguisher Tag',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                              subtitle: Text(
                                'Signed and dated?',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 15.0),
                            child: TextFormField(
                              controller: _model.textController6,
                              focusNode: _model.textFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await WorkOrdersTable().update(
                                  data: {
                                    'notes': _model.textController6.text,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.eqptLisID,
                                  ),
                                );
                              },
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Notes',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textController6Validator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Wrap(
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
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: FieldItemWidget(
                                        eqptWoLisID: widget.eqptLisID!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              text: 'Add Item',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await EqptWoLisTable().update(
                                  data: {
                                    'Status': 'Condemned',
                                    'notes': _model.textController6.text == ''
                                        ? null
                                        : _model.textController6.text,
                                    'details': '',
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.eqptLisID,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Condemn ',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFEF3939),
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await EqptWoLisTable().update(
                                  data: {
                                    'Status': 'Completed',
                                    'notes': _model.textController6.text == ''
                                        ? ''
                                        : _model.textController6.text,
                                    'details': (List<String> inputlist) {
                                      return inputlist
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', '');
                                    }(_model.deficiencyList.toList()),
                                    'status_notes': 'Annual',
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.eqptLisID,
                                  ),
                                );
                                await EquipmentTable().update(
                                  data: {
                                    'inspectionDate1': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                    'nextDue1': supaSerialize<DateTime>(
                                        dateTimeFromSecondsSinceEpoch(
                                            getCurrentTimestamp
                                                    .secondsSinceEpoch +
                                                86400)),
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.eqptID,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              text: 'Complete ',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF5ABB11),
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  storageFolderPath: 'pics',
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName: 'equipmentImagebucket',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                await EquipmentTable().update(
                                  data: {
                                    'photo_url': _model.uploadedFileUrl,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    widget.eqptID,
                                  ),
                                );
                              },
                              text: 'Add Picture',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.uploadedFileUrl,
                                width: 60.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Delete Extinguisher'),
                                          content: const Text(
                                              'Are you sure you want to delete this extinguisher?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: const Text('Yes'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  await EqptWoLisTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.eqptLisID,
                                    ),
                                  );
                                  await EquipmentTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.eqptID,
                                    ),
                                  );
                                }
                                Navigator.pop(context);
                              },
                              text: 'Delete Extinguisher',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFEF3939),
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
          },
        ),
      ),
    );
  }
}
