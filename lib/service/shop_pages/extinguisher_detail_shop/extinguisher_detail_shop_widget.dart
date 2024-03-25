import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/service/to_hydro/to_hydro_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'extinguisher_detail_shop_model.dart';
export 'extinguisher_detail_shop_model.dart';

class ExtinguisherDetailShopWidget extends StatefulWidget {
  const ExtinguisherDetailShopWidget({
    super.key,
    required this.eqptLisID,
    required this.eqptID,
    required this.customerID,
    required this.woID,
  });

  final int? eqptLisID;
  final int? eqptID;
  final int? customerID;
  final int? woID;

  @override
  State<ExtinguisherDetailShopWidget> createState() =>
      _ExtinguisherDetailShopWidgetState();
}

class _ExtinguisherDetailShopWidgetState
    extends State<ExtinguisherDetailShopWidget> {
  late ExtinguisherDetailShopModel _model;

  bool textFieldFocusListenerRegistered1 = false;
  bool textFieldFocusListenerRegistered2 = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExtinguisherDetailShopModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

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

    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(
      () async {
        await EquipmentTable().update(
          data: {
            'notes': _model.textController4.text,
          },
          matchingRows: (rows) => rows.eq(
            'id',
            widget.eqptID,
          ),
        );
      },
    );
    _model.item1Controller ??= TextEditingController();
    _model.item1FocusNode ??= FocusNode();
    _model.item1FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item1Controller.text);
        });
      },
    );
    _model.item2Controller ??= TextEditingController();
    _model.item2FocusNode ??= FocusNode();
    _model.item2FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item2Controller.text);
        });
      },
    );
    _model.item3Controller ??= TextEditingController();
    _model.item3FocusNode ??= FocusNode();
    _model.item3FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item3Controller.text);
        });
      },
    );
    _model.item4Controller ??= TextEditingController();
    _model.item4FocusNode ??= FocusNode();
    _model.item4FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item4Controller.text);
        });
      },
    );
    _model.item5Controller ??= TextEditingController();
    _model.item5FocusNode ??= FocusNode();
    _model.item5FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item5Controller.text);
        });
      },
    );
    _model.item6Controller ??= TextEditingController();
    _model.item6FocusNode ??= FocusNode();
    _model.item6FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item6Controller.text);
        });
      },
    );
    _model.item7Controller ??= TextEditingController();
    _model.item7FocusNode ??= FocusNode();
    _model.item7FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item7Controller.text);
        });
      },
    );
    _model.item8Controller ??= TextEditingController();
    _model.item8FocusNode ??= FocusNode();
    _model.item8FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item8Controller.text);
        });
      },
    );
    _model.item9Controller ??= TextEditingController();
    _model.item9FocusNode ??= FocusNode();
    _model.item9FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item9Controller.text);
        });
      },
    );
    _model.item10Controller ??= TextEditingController();
    _model.item10FocusNode ??= FocusNode();
    _model.item10FocusNode!.addListener(
      () async {
        setState(() {
          _model.addToDeficiencyList(_model.item10Controller.text);
        });
      },
    );
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      constraints: const BoxConstraints(
        maxWidth: 600.0,
        maxHeight: 1100.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
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
                    FutureBuilder<List<CustomersRow>>(
                      future: CustomersTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          widget.customerID,
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
                        List<CustomersRow> wrapCustomersRowList =
                            snapshot.data!;
                        final wrapCustomersRow = wrapCustomersRowList.isNotEmpty
                            ? wrapCustomersRowList.first
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.woID?.toString(),
                                  '#',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  wrapCustomersRow?.name,
                                  'customer',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                formEquipmentRow?.description,
                                'location',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ],
                        );
                      },
                    ),
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
                                child: Builder(builder: (_) {
                                  if (!textFieldFocusListenerRegistered1) {
                                    textFieldFocusListenerRegistered1 = true;
                                    _model.textFieldFocusNode1!.addListener(
                                      () async {
                                        await EquipmentTable().update(
                                          data: {
                                            'serial': formEquipmentRow?.serial,
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
                                    controller: _model.textController1 ??=
                                        TextEditingController(
                                      text: valueOrDefault<String>(
                                        formEquipmentRow?.serial,
                                        '-',
                                      ),
                                    ),
                                    focusNode: _model.textFieldFocusNode1,
                                    onFieldSubmitted: (_) async {
                                      await EquipmentTable().update(
                                        data: {
                                          'serial': formEquipmentRow?.serial,
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
                                    validator: _model.textController1Validator
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
                                child: Builder(builder: (_) {
                                  if (!textFieldFocusListenerRegistered2) {
                                    textFieldFocusListenerRegistered2 = true;
                                    _model.textFieldFocusNode2!.addListener(
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
                                    controller: _model.textController2 ??=
                                        TextEditingController(
                                      text: valueOrDefault<String>(
                                        formEquipmentRow?.details,
                                        '-',
                                      ),
                                    ),
                                    focusNode: _model.textFieldFocusNode2,
                                    onFieldSubmitted: (_) async {
                                      await EquipmentTable().update(
                                        data: {
                                          'details': formEquipmentRow?.details,
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
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  );
                                }),
                              ),
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: const ['AC', 'GB', 'KH'],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 200.0,
                              height: 56.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Tech',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
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
                                  onFieldSubmitted: (_) async {
                                    await EquipmentTable().update(
                                      data: {
                                        'manufacturedDate': int.tryParse(
                                            _model.mfgDateController.text),
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
                            Container(
                              width: 200.0,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController4 ??=
                                      TextEditingController(
                                    text: valueOrDefault<String>(
                                      formEquipmentRow?.notes,
                                      '-',
                                    ),
                                  ),
                                  focusNode: _model.textFieldFocusNode3,
                                  onFieldSubmitted: (_) async {
                                    await EquipmentTable().update(
                                      data: {
                                        'notes': _model.textController4.text,
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
                                    labelText: 'Notes',
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.end,
                                  validator: _model.textController4Validator
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
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items to Add:',
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.item1Controller,
                                    focusNode: _model.item1FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item1Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item1ControllerValidator
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
                                    controller: _model.item2Controller,
                                    focusNode: _model.item2FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item2Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item2ControllerValidator
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
                                    controller: _model.item3Controller,
                                    focusNode: _model.item3FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item3Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item3ControllerValidator
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
                                    controller: _model.item4Controller,
                                    focusNode: _model.item4FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item4Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item4ControllerValidator
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
                                    controller: _model.item5Controller,
                                    focusNode: _model.item5FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item5Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item5ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.item6Controller,
                                    focusNode: _model.item6FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item6Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item6ControllerValidator
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
                                    controller: _model.item7Controller,
                                    focusNode: _model.item7FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item7Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item7ControllerValidator
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
                                    controller: _model.item8Controller,
                                    focusNode: _model.item8FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item8Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item8ControllerValidator
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
                                    controller: _model.item9Controller,
                                    focusNode: _model.item9FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item9Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item9ControllerValidator
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
                                    controller: _model.item10Controller,
                                    focusNode: _model.item10FocusNode,
                                    onFieldSubmitted: (_) async {
                                      setState(() {
                                        _model.addToDeficiencyList(
                                            _model.item10Controller.text);
                                      });
                                    },
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Item',
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
                                    validator: _model.item10ControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
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
                                    _model.uploadedFileUrl = downloadUrls.first;
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
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Wrap(
                        spacing: 0.0,
                        runSpacing: 0.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Inspection Due',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FFButtonWidget(
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
                                    },
                                    text: valueOrDefault<String>(
                                      dateTimeFormat(
                                          'yMd', formEquipmentRow?.nextDue1),
                                      'nextDue1',
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.inspectionDueValueController ??=
                                            FormFieldController<String>(
                                      _model.inspectionDueValue ??=
                                          formEquipmentRow?.frequency1,
                                    ),
                                    options: const [
                                      'Annual',
                                      '5 Years',
                                      '6 Years',
                                      '12 Years'
                                    ],
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.inspectionDueValue = val);
                                      await EquipmentTable().update(
                                        data: {
                                          'frequency1':
                                              _model.inspectionDueValue,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                    },
                                    width: 140.0,
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
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await EquipmentTable().update(
                                        data: {
                                          'inspectionDate1':
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                      await EqptWoLisTable().update(
                                        data: {
                                          'Status': 'Completed',
                                          'items': (List<String> inputlist) {
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
                                      Navigator.pop(context);
                                    },
                                    text: 'Annual Done',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Recharge Due',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
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
                                        formEquipmentRow?.id,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.rechargeDueValueController ??=
                                            FormFieldController<String>(
                                      _model.rechargeDueValue ??=
                                          formEquipmentRow?.frequency2,
                                    ),
                                    options: const [
                                      'Annual',
                                      '5 Years',
                                      '6 Years',
                                      '12 Years'
                                    ],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.rechargeDueValue = val);
                                      await EquipmentTable().update(
                                        data: {
                                          'frequency2': _model.rechargeDueValue,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                    },
                                    width: 140.0,
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
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await EquipmentTable().update(
                                        data: {
                                          'inspectionDate2':
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                          'inspectionDate1':
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                      if (formEquipmentRow?.frequency2 ==
                                          '6 Years') {
                                        await EquipmentTable().update(
                                          data: {
                                            'nextDue2': functions.getYear(
                                                getCurrentTimestamp, 6),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.eqptID,
                                          ),
                                        );
                                      } else {
                                        if (formEquipmentRow?.frequency2 ==
                                            '12 Years') {
                                          await EquipmentTable().update(
                                            data: {
                                              'nextDue2': functions.getYear(
                                                  getCurrentTimestamp, 12),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.eqptID,
                                            ),
                                          );
                                        } else {
                                          if (formEquipmentRow?.frequency2 ==
                                              '5 Years') {
                                            await EquipmentTable().update(
                                              data: {
                                                'nextDue2': functions.getYear(
                                                    getCurrentTimestamp, 5),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.eqptID,
                                              ),
                                            );
                                          }
                                        }
                                      }

                                      await EqptWoLisTable().update(
                                        data: {
                                          'Status': 'Completed',
                                          'items': (List<String> inputlist) {
                                            return inputlist
                                                .toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', '');
                                          }(_model.deficiencyList.toList()),
                                          'status_notes': 'Recharge',
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptLisID,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    text: 'Recharge Done',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    'Hydro Due',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
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
                                        formEquipmentRow?.id,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.hydroDueValueController ??=
                                            FormFieldController<String>(
                                      _model.hydroDueValue ??=
                                          formEquipmentRow?.frequency3,
                                    ),
                                    options: const [
                                      'Annual',
                                      '5 Years',
                                      '6 Years',
                                      '12 Years'
                                    ],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.hydroDueValue = val);
                                      await EquipmentTable().update(
                                        data: {
                                          'frequency3': _model.hydroDueValue,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.eqptID,
                                        ),
                                      );
                                    },
                                    width: 140.0,
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
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: FutureBuilder<List<WorkOrdersRow>>(
                                    future: WorkOrdersTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        widget.woID,
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
                                      List<WorkOrdersRow>
                                          buttonWorkOrdersRowList =
                                          snapshot.data!;
                                      final buttonWorkOrdersRow =
                                          buttonWorkOrdersRowList.isNotEmpty
                                              ? buttonWorkOrdersRowList.first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          await EquipmentTable().update(
                                            data: {
                                              'inspectionDate3':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'inspectionDate2':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'inspectionDate1':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.eqptID,
                                            ),
                                          );
                                          if (formEquipmentRow?.frequency3 ==
                                              '6 Years') {
                                            await EquipmentTable().update(
                                              data: {
                                                'nextDue3': functions
                                                    .nextDueDateFunction(6),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.eqptID,
                                              ),
                                            );
                                          } else {
                                            if (formEquipmentRow?.frequency3 ==
                                                '12 Years') {
                                              await EquipmentTable().update(
                                                data: {
                                                  'nextDue3': functions
                                                      .nextDueDateFunction(12),
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.eqptID,
                                                ),
                                              );
                                            } else {
                                              if (formEquipmentRow
                                                      ?.frequency3 ==
                                                  '5 Years') {
                                                await EquipmentTable().update(
                                                  data: {
                                                    'nextDue3': functions
                                                        .nextDueDateFunction(5),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.eqptID,
                                                  ),
                                                );
                                              }
                                            }
                                          }

                                          if (formEquipmentRow?.frequency2 ==
                                              '6 Years') {
                                            await EquipmentTable().update(
                                              data: {
                                                'nextDue2': functions
                                                    .nextDueDateFunction(6),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.eqptID,
                                              ),
                                            );
                                          } else {
                                            if (formEquipmentRow?.frequency2 ==
                                                '12 Years') {
                                              await EquipmentTable().update(
                                                data: {
                                                  'nextDue2': functions
                                                      .nextDueDateFunction(12),
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  widget.eqptID,
                                                ),
                                              );
                                            } else {
                                              if (formEquipmentRow
                                                      ?.frequency2 ==
                                                  '5 Years') {
                                                await EquipmentTable().update(
                                                  data: {
                                                    'nextDue2': functions
                                                        .nextDueDateFunction(5),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    widget.eqptID,
                                                  ),
                                                );
                                              }
                                            }
                                          }

                                          await EqptWoLisTable().update(
                                            data: {
                                              'Status': 'Completed',
                                              'items':
                                                  (List<String> inputlist) {
                                                return inputlist
                                                    .toString()
                                                    .replaceAll('[', '')
                                                    .replaceAll(']', '');
                                              }(_model.deficiencyList.toList()),
                                              'status_notes': 'Hydro',
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.eqptLisID,
                                            ),
                                          );
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height: 200.0,
                                                  child: ToHydroWidget(
                                                    wo: widget.woID!,
                                                    serial: formEquipmentRow!
                                                        .serial!,
                                                    extDetails:
                                                        formEquipmentRow
                                                            .details!,
                                                    tech: buttonWorkOrdersRow!
                                                        .tech!
                                                        .toString(),
                                                    customerId:
                                                        widget.customerID!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          Navigator.pop(context);
                                        },
                                        text: 'Hydro Done',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await EqptWoLisTable().update(
                                  data: {
                                    'Status': 'Condemned',
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
    );
  }
}
